//
// Created by Maxim Bunkov on 03/05/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import "HistoryDataViewScreenCellViewModel.h"
#import "CityWeatherEntity.h"


@implementation HistoryDataViewScreenCellViewModel {

}

+ (instancetype)initWithBlock:(HistoryDataViewScreenCellViewModelBuilderBlock)block {
  return [[HistoryDataViewScreenCellViewModel alloc] initWithBlock:block];
}

- (instancetype)initWithBlock:(HistoryDataViewScreenCellViewModelBuilderBlock)block {
  self = [super init];
  if (self) {
    //Place defaults params for props

    if (block)
      block(self);
  }
  return self;
}

- (instancetype)update:(HistoryDataViewScreenCellViewModelBuilderBlock)updateBlock {
  updateBlock(self);
  return self;
}


@end