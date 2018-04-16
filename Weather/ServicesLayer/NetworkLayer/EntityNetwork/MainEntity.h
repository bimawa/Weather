//
// Created by Maxim Bunkov on 06/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"


@interface MainEntity : JSONModel

@property(nonatomic, strong) NSNumber *temp;
@property(nonatomic, strong) NSNumber *pressure;
@property(nonatomic, strong) NSNumber *humidity;
@property(nonatomic, strong) NSNumber *temp_min;
@property(nonatomic, strong) NSNumber *temp_max;
@end