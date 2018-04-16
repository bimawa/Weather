//
//  MainViewScreenMainViewScreenPresenter.h
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "MainViewScreenViewOutput.h"
#import "MainViewScreenInteractorOutput.h"

@protocol MainViewScreenViewInput;
@protocol MainViewScreenInteractorInput;
@protocol MainViewScreenRouterInput;

@interface MainViewScreenPresenter : NSObject <MainViewScreenViewOutput, MainViewScreenInteractorOutput>

@property (nonatomic, weak) id<MainViewScreenViewInput> view;
@property (nonatomic, strong) id<MainViewScreenInteractorInput> interactor;
@property (nonatomic, strong) id<MainViewScreenRouterInput> router;

@end