//
//  HistoryDataViewScreenHistoryDataViewScreenViewModel.m
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "HistoryDataViewScreenViewModel.h"
#import "HistoryDataViewScreenCellViewModel.h"
#import "CityWeatherEntity.h"
#import "WeatherEntity.h"
#import "MainEntity.h"
#import <UIKit/UIkit.h>

@interface HistoryDataViewScreenViewModel ()

@property(nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation HistoryDataViewScreenViewModel

+ (instancetype)initWithBlock:(HistoryDataViewScreenViewModelBuilderBlock)block {
  return [[HistoryDataViewScreenViewModel alloc] initWithBlock:block];
}

- (instancetype)initWithBlock:(HistoryDataViewScreenViewModelBuilderBlock)block {
  self = [super init];
  if (self) {
    //Place defaults params for props
    self.dataArray = [NSMutableArray new];

    if (block)
      block(self);
  }
  return self;
}

- (instancetype)update:(HistoryDataViewScreenViewModelBuilderBlock)updateBlock {
  updateBlock(self);
  return self;
}

- (NSInteger)numberOfItems {
  return [self.dataArray count];
}

- (NSInteger)numberOfSections {
  return 1;
}

- (HistoryDataViewScreenCellViewModel *)cellModelForIndexPath:(NSIndexPath *)indexPath {
  return self.dataArray[indexPath.row];
}

- (void)receivedData:(NSArray<CityWeatherEntity *> *)array {
  [array enumerateObjectsUsingBlock:^(CityWeatherEntity *cityWeatherEntity, NSUInteger idx, BOOL *stop) {
    [self.dataArray addObject:[[HistoryDataViewScreenCellViewModel alloc] initWithBlock:^(HistoryDataViewScreenCellViewModel *builder) {
      WeatherEntity *weatherEntity = cityWeatherEntity.weather[0];
      if (weatherEntity.itemId) {
        builder.title         = [NSString stringWithFormat:@"%@℃, %@", cityWeatherEntity.main.temp.stringValue ?: @"--", weatherEntity.itemDescription ?: @"--"];
        builder.iconURLString = [NSString stringWithFormat:@"https://openweathermap.org/img/w/%@.png", weatherEntity.icon];

        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.locale     = [NSLocale currentLocale];
        dateFormatter.dateFormat = @"dd/mm/YYYY";
        dateFormatter.timeZone   = [NSTimeZone timeZoneForSecondsFromGMT:0];

        builder.subTitle      = [NSString stringWithFormat:@"%@, %@", [dateFormatter stringFromDate:cityWeatherEntity.dt], cityWeatherEntity.name];
      }
    }]];
  }];
}

@end
