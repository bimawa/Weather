//
// Created by Maxim Bunkov on 05/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSubject;


@interface GeolocationService : NSObject

@property(nonatomic, strong, readonly) RACSubject *forecastUpdateSubject;

- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

+ (instancetype)sharedInstance;

@end