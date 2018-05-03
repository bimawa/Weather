//
//  MainViewScreenMainViewScreenRouter.h
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "MainViewScreenRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;
@protocol RamblerViperModuleFactoryProtocol;

@interface MainViewScreenRouter : NSObject <MainViewScreenRouterInput>

@property(nonatomic, weak) id <RamblerViperModuleTransitionHandlerProtocol> transitionHandler;
@property(nonatomic, strong) id <RamblerViperModuleFactoryProtocol>         historyDataViewScreen;
@end