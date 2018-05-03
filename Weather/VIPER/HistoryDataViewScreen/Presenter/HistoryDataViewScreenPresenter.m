//
//  HistoryDataViewScreenHistoryDataViewScreenPresenter.m
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "HistoryDataViewScreenPresenter.h"

#import "HistoryDataViewScreenViewInput.h"
#import "HistoryDataViewScreenViewModel.h"
#import "HistoryDataViewScreenInteractorInput.h"

@interface HistoryDataViewScreenPresenter ()

@property(nonatomic, strong) HistoryDataViewScreenViewModel *viewModel;
@end

@implementation HistoryDataViewScreenPresenter

#pragma mark - Методы ModuleOutput

#pragma mark - Методы HistoryDataViewScreenModuleInput

- (void)configureModule {
  // Стартовая конфигурация модуля, не привязанная к состоянию view
  HistoryDataViewScreenViewModel *viewModel = [[HistoryDataViewScreenViewModel alloc] initWithBlock:^(HistoryDataViewScreenViewModel *builder) {
    //Configure ViewModel with default params

  }];
  self.viewModel = viewModel;
}

#pragma mark - Методы HistoryDataViewScreenViewOutput

- (void)didTriggerViewReadyEvent {
  [self.view setupInitialState:self.viewModel];
  [self.interactor loadHistoryData];
}

- (void)a_selectedIndexPath:(NSIndexPath *)path {

}

#pragma mark - Методы HistoryDataViewScreenInteractorOutput


- (void)receivedData:(NSArray <CityWeatherEntity *> *)data {
  [self.viewModel receivedData:data];
  [self.view reloadData];
}

@end