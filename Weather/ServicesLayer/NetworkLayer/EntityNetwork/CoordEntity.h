//
// Created by Maxim Bunkov on 05/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"


@interface CoordEntity : JSONModel

@property(nonatomic, strong) NSNumber *lon;
@property(nonatomic, strong) NSNumber *lat;

@end