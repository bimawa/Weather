//
//  HistoryDataViewScreenHistoryDataViewScreenPresenter.h
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "HistoryDataViewScreenViewOutput.h"
#import "HistoryDataViewScreenInteractorOutput.h"
#import "HistoryDataViewScreenModuleInput.h"

@protocol HistoryDataViewScreenViewInput;
@protocol HistoryDataViewScreenInteractorInput;
@protocol HistoryDataViewScreenRouterInput;

@interface HistoryDataViewScreenPresenter : NSObject <HistoryDataViewScreenModuleInput, HistoryDataViewScreenViewOutput, HistoryDataViewScreenInteractorOutput>

@property (nonatomic, weak) id<HistoryDataViewScreenViewInput> view;
@property (nonatomic, strong) id<HistoryDataViewScreenInteractorInput> interactor;
@property (nonatomic, strong) id<HistoryDataViewScreenRouterInput> router;

@end