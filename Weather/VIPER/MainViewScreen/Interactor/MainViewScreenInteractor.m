//
//  MainViewScreenMainViewScreenInteractor.m
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "MainViewScreenInteractor.h"
#import "MainViewScreenInteractorOutput.h"
#import "GeolocationServiceProtocol.h"
#import "RACSubject.h"
#import "NetworkServiceProtocol.h"
#import "CityWeatherEntity.h"
#import "CityWeatherEntity+DatabaseService.h"
#import "WeatherServiceProtocol.h"

@interface MainViewScreenInteractor ()

@property(nonatomic, strong) id <GeolocationServiceProtocol> geolocationService;
@property(nonatomic, strong) id <NetworkServiceProtocol>     networkService;
@property(nonatomic, strong) id <WeatherServiceProtocol>     weatherService;
@property(nonatomic, strong) RACSubject                      *cityUpdateSubject;
@end

@implementation MainViewScreenInteractor


- (instancetype)init {
  self = [super init];
  if (self) {
    self.cityUpdateSubject = [RACSubject new];


    [[self.cityUpdateSubject distinctUntilChanged] subscribeNext:^(NSString *cityName) {
      [[self.networkService getWeatherForCity:cityName] subscribeNext:^(CityWeatherEntity *cityWeatherEntity) {
        [cityWeatherEntity saveToDataBase];
        [self.output dataWeatherReceivedSuccessfule:cityWeatherEntity];
      }                                                         error:^(NSError *error) {
        [self.output dataWeatherError:error];
      }];
    }];
  }

  return self;
}

#pragma mark - Методы MainViewScreenInteractorInput

- (void)startLocation {
  [self.geolocationService startLocationForeground];
  [[self.geolocationService.forecastUpdateSubject distinctUntilChanged] subscribeNext:^(CLPlacemark *placemark) {
//    NSLog(@"geocoder: %@", placemark.addressDictionary);
    if (placemark.addressDictionary[@"City"]) {
      [self.cityUpdateSubject sendNext:placemark.addressDictionary[@"City"]];
    }
  }];
}

- (NSURL *)getVideostockURLFromCodeOfWeather:(NSNumber *)codeWeather {
  return [self.weatherService weatherVideoFromCode:codeWeather];
}
@end