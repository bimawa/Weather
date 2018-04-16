//
// Created by Maxim Bunkov on 05/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSubject;

@protocol GeolocationServiceProtocol <NSObject>

@property(nonatomic, strong, readonly) RACSubject *forecastUpdateSubject;

- (void)startLocationForeground;
- (void)startLocationBackground;
- (void)stopLocationUpdate;
@end