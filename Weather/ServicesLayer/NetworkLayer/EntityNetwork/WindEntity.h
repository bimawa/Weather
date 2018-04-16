//
// Created by Maxim Bunkov on 06/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"


@interface WindEntity : JSONModel

@property(nonatomic, strong) NSNumber *speed;
@property(nonatomic, strong) NSNumber *deg;

@end