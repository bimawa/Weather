//
//  HistoryDataViewScreenHistoryDataViewScreenViewInput.h
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HistoryDataViewScreenViewModel;

@protocol HistoryDataViewScreenViewInput <NSObject>

/**
 @author Maksim Bunkow

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState:(HistoryDataViewScreenViewModel *)viewModel;
- (void)reloadData;
@end