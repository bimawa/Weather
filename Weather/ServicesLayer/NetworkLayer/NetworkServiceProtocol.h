//
// Created by Maxim Bunkov on 05/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;

@protocol NetworkServiceProtocol <NSObject>

- (RACSignal *)getWeatherForCity:(NSString *)cityName;

@end