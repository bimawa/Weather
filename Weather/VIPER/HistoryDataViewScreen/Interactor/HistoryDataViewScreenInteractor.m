//
//  HistoryDataViewScreenHistoryDataViewScreenInteractor.m
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "HistoryDataViewScreenInteractor.h"

#import "CityWeatherEntity.h"
#import "CityWeatherEntity+DatabaseService.h"
#import "HistoryDataViewScreenInteractorOutput.h"

@implementation HistoryDataViewScreenInteractor

#pragma mark - Методы HistoryDataViewScreenInteractorInput

- (void)loadHistoryData {
  NSArray <CityWeatherEntity *> *dataArray = [CityWeatherEntity getAllData];
  [self.output receivedData:dataArray];
}

@end