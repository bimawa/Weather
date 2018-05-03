//
//  HistoryDataViewScreenHistoryDataViewScreenInteractorOutput.h
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CityWeatherEntity;

@protocol HistoryDataViewScreenInteractorOutput <NSObject>

- (void)receivedData:(NSArray <CityWeatherEntity *> *)data;
@end