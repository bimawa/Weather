//
// Created by Maxim Bunkov on 06/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import "CityWeatherEntity+DatabaseService.h"
#import "DatabaseService.h"
#import "RACSubject.h"
#import "YapDatabaseViewTypes.h"
#import "RACSignal.h"
#import "YapDatabaseAutoView.h"

NSString *const kCityWeatherCollectionName = @"kCityWeatherEntityCollectionName";
NSString *const kCityWeatherDatabaseView   = @"kCityWeatherDatabaseView";

@implementation CityWeatherEntity (DatabaseService)

+ (RACSignal *)allDatabaseView {
  return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {

    YapDatabaseViewGrouping *grouping = [YapDatabaseViewGrouping withRowBlock:
        ^NSString *(YapDatabaseReadTransaction *transaction,
            NSString *collection, NSString *key, id object, id metadata) {
          if ([object isKindOfClass:[self class]])
            return @"cityWeather";
          return nil;
        }];

    YapDatabaseViewSorting *sorting         = [YapDatabaseViewSorting withObjectBlock:
        ^(YapDatabaseReadTransaction *transaction, NSString *group,
            NSString *collection1, NSString *key1, CityWeatherEntity *obj1,
            NSString *collection2, NSString *key2, CityWeatherEntity *obj2) {
          if ([group isEqualToString:@"cityWeather"])
            return [obj1.dt compare:obj2.dt];
          return NSOrderedSame;
        }];
    YapDatabaseAutoView    *databaseView    = [[YapDatabaseAutoView alloc] initWithGrouping:grouping sorting:sorting];
    DatabaseService        *databaseService = [DatabaseService sharedInstance];
    [databaseService.yapDatabaseStorage registerExtension:databaseView withName:kCityWeatherDatabaseView];
    return nil;
  }];
}

+ (CityWeatherEntity *)getObjectById:(NSNumber *)objectId {
  DatabaseService           *databaseService = [DatabaseService sharedInstance];
  __block CityWeatherEntity *resultObject    = nil;
  [databaseService.getBackgroundDatabaseConnection readWithBlock:^(YapDatabaseReadTransaction *transaction) {
    resultObject = [transaction objectForKey:objectId.stringValue inCollection:kCityWeatherCollectionName];
  }];
  return resultObject;
}

- (void)saveToDataBase {
  DatabaseService *databaseService = [DatabaseService sharedInstance];
  [databaseService.getBackgroundDatabaseConnection asyncReadWriteWithBlock:^(YapDatabaseReadWriteTransaction *transaction) {
    [transaction setObject:self forKey:self.id.stringValue inCollection:kCityWeatherCollectionName];
  }];
}

@end