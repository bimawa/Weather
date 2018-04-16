//
// Created by Maxim Bunkov on 05/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import "WeatherEntity.h"


@implementation WeatherEntity {

}

+ (JSONKeyMapper *)keyMapper {
  return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
      @"itemId": @"id",
      @"itemDescription": @"description"
  }];
}

@end