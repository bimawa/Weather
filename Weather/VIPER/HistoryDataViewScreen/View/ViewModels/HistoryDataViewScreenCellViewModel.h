//
// Created by Maxim Bunkov on 03/05/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CityWeatherEntity;
@class HistoryDataViewScreenCellViewModel;

typedef void (^HistoryDataViewScreenCellViewModelBuilderBlock)(HistoryDataViewScreenCellViewModel *builder);

@interface HistoryDataViewScreenCellViewModel : NSObject

@property(nonatomic, strong) NSString          *iconURLString;
@property(nonatomic, strong) NSString          *title;
@property(nonatomic, strong) NSString          *subTitle;
@property(nonatomic, strong) CityWeatherEntity *dataModel;

- (instancetype)initWithBlock:(HistoryDataViewScreenCellViewModelBuilderBlock)block;
+ (instancetype)initWithBlock:(HistoryDataViewScreenCellViewModelBuilderBlock)block;
- (instancetype)update:(HistoryDataViewScreenCellViewModelBuilderBlock)updateBlock;
@end