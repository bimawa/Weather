//
// Created by Maxim Bunkov on 06/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SystemEntity : NSObject

@property(nonatomic, strong) NSNumber *type;
@property(nonatomic, strong) NSNumber *id;
@property(nonatomic, strong) NSNumber *message;
@property(nonatomic, strong) NSString *country;
@property(nonatomic, strong) NSNumber *sunrise;
@property(nonatomic, strong) NSNumber *sunset;

@end