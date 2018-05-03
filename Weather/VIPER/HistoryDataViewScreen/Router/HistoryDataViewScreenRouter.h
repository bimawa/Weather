//
//  HistoryDataViewScreenHistoryDataViewScreenRouter.h
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "HistoryDataViewScreenRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface HistoryDataViewScreenRouter : NSObject <HistoryDataViewScreenRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end