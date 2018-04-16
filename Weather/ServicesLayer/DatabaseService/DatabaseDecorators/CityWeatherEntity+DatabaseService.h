//
// Created by Maxim Bunkov on 06/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CityWeatherEntity.h"

@class RACSignal;

@interface CityWeatherEntity (DatabaseService)


+ (RACSignal *)allDatabaseView;
+ (CityWeatherEntity *)getObjectById:(NSNumber *)objectId;
- (void)saveToDataBase;
@end