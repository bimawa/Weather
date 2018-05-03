//
//  MainViewScreenMainViewScreenPresenter.m
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "MainViewScreenPresenter.h"

#import "MainViewScreenViewInput.h"
#import "MainViewScreenInteractorInput.h"
#import "MainViewScreenRouterInput.h"
#import "MainViewScreenViewModel.h"
#import "CityWeatherEntity.h"
#import "WeatherEntity.h"
#import "MainEntity.h"

@interface MainViewScreenPresenter ()

@property(nonatomic, strong) MainViewScreenViewModel *viewModel;
@end

@implementation MainViewScreenPresenter

#pragma mark - Методы ModuleOutput

#pragma mark - Методы MainViewScreenModuleInput

#pragma mark - Методы MainViewScreenViewOutput

- (void)didTriggerViewReadyEvent {
  [self.interactor startLocation];
}

//Actions

- (void)a_openHistory {
  [self.router openHistoryModule];
}

#pragma mark - Методы MainViewScreenInteractorOutput

- (void)dataWeatherReceivedSuccessfule:(CityWeatherEntity *)cityWeatherEntity {
  self.viewModel.cityWeatherData = cityWeatherEntity;
  if (cityWeatherEntity.weather.count > 0) {
    WeatherEntity *weatherEntity = cityWeatherEntity.weather[0];
    if (weatherEntity.itemId) {
      NSURL *urlVideoStock = [self.interactor getVideostockURLFromCodeOfWeather:weatherEntity.itemId];
      if (urlVideoStock) {
        [self.viewModel update:^(MainViewScreenViewModel *builder) {
          builder.urlVideoStock            = urlVideoStock;
          builder.mainStatusString         = weatherEntity.main;
          builder.descriptionWeatherString = weatherEntity.itemDescription;
          builder.temperature              = cityWeatherEntity.main.temp;
          builder.iconURLString            = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", weatherEntity.icon];
          builder.cityName                 = cityWeatherEntity.name;
        }];
      }
    }
  }
}

- (void)dataWeatherError:(NSError *)error {
  NSLog(@"Error request: %@", error);
}

@end