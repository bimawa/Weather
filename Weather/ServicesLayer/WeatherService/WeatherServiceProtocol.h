//
// Created by Maxim Bunkov on 4/9/18.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WeatherServiceProtocol <NSObject>

- (NSURL *)weatherVideoFromCode:(NSNumber *)codeOfWeather;

@end