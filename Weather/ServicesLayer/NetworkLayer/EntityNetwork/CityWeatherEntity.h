//
// Created by Maxim Bunkov on 06/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@class CoordEntity;
@protocol WeatherEntity;
@class MainEntity;
@class WindEntity;
@class CloudsEntity;


@interface CityWeatherEntity : JSONModel

@property(nonatomic, strong) CoordEntity             *coord;
@property(nonatomic, strong) NSArray <WeatherEntity> *weather;
@property(nonatomic, strong) NSString                *base;
@property(nonatomic, strong) MainEntity              *main;
@property(nonatomic, strong) NSNumber                *visibility;
@property(nonatomic, strong) WindEntity              *wind;
@property(nonatomic, strong) CloudsEntity            *clouds;
@property(nonatomic, strong) NSDate                  *dt;
@property(nonatomic, strong) NSNumber                *id;
@property(nonatomic, strong) NSString                *name;
@property(nonatomic, strong) NSNumber                *cod;
@end