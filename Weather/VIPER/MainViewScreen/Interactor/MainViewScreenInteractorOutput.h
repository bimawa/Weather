//
//  MainViewScreenMainViewScreenInteractorOutput.h
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CityWeatherEntity;

@protocol MainViewScreenInteractorOutput <NSObject>

- (void)dataWeatherReceivedSuccessfule:(CityWeatherEntity *)entity;
- (void)dataWeatherError:(NSError *)error;
@end