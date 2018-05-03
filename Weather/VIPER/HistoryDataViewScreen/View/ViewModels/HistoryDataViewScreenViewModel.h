//
//  HistoryDataViewScreenHistoryDataViewScreenViewModel.h
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HistoryDataViewScreenViewModel;
@class CityWeatherEntity;
@class HistoryDataViewScreenCellViewModel;

typedef void (^HistoryDataViewScreenViewModelBuilderBlock)(HistoryDataViewScreenViewModel *builder);

@interface HistoryDataViewScreenViewModel : NSObject

- (instancetype)initWithBlock:(HistoryDataViewScreenViewModelBuilderBlock)block;
+ (instancetype)initWithBlock:(HistoryDataViewScreenViewModelBuilderBlock)block;
- (instancetype)update:(HistoryDataViewScreenViewModelBuilderBlock)updateBlock;
- (NSInteger)numberOfItems;
- (NSInteger)numberOfSections;
- (HistoryDataViewScreenCellViewModel *)cellModelForIndexPath:(NSIndexPath *)indexPath;
- (void)receivedData:(NSArray<CityWeatherEntity *> *)array;
@end
