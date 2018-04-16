//
//  MainViewScreenMainViewScreenViewModel.h
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MainViewScreenViewModel;
@class CityWeatherEntity;

typedef void (^MainViewScreenViewModelBuilderBlock)(MainViewScreenViewModel *builder);

@interface MainViewScreenViewModel : NSObject

@property(nonatomic, strong) CityWeatherEntity *cityWeatherData;
@property(nonatomic, strong) NSURL             *urlVideoStock;
@property(nonatomic, copy) NSString            *mainStatusString;
@property(nonatomic, copy) NSString            *descriptionWeatherString;
@property(nonatomic, strong) NSNumber          *temperature;
@property(nonatomic, copy) NSString            *iconURLString;
@property(nonatomic, copy) NSString            *cityName;
- (instancetype)initWithBlock:(MainViewScreenViewModelBuilderBlock)block;
+ (instancetype)initWithBlock:(MainViewScreenViewModelBuilderBlock)block;
- (instancetype)update:(MainViewScreenViewModelBuilderBlock)updateBlock;
@end
