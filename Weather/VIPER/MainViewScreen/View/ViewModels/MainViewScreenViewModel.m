//
//  MainViewScreenMainViewScreenViewModel.m
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "MainViewScreenViewModel.h"
#import "CityWeatherEntity.h"

@implementation MainViewScreenViewModel

+ (instancetype)initWithBlock:(MainViewScreenViewModelBuilderBlock)block
{
  return [[MainViewScreenViewModel alloc] initWithBlock:block];
}

- (instancetype)initWithBlock:(MainViewScreenViewModelBuilderBlock)block
{
  self = [super init];
  if (self) {
    //Place defaults params for props

    if (block)
      block(self);
  }
  return self;
}

- (instancetype)update:(MainViewScreenViewModelBuilderBlock)updateBlock
{
  updateBlock(self);
  return self;
}
@end
