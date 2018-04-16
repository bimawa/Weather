//
// Created by Maxim Bunkov on 05/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol WeatherEntity
@end

@interface WeatherEntity : JSONModel

@property(nonatomic, strong) NSNumber *itemId;
@property(nonatomic, strong) NSString *main;
@property(nonatomic, strong) NSString *itemDescription;
@property(nonatomic, strong) NSString *icon;

@end