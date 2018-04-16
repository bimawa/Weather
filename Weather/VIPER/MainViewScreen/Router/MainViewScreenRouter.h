//
//  MainViewScreenMainViewScreenRouter.h
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "MainViewScreenRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface MainViewScreenRouter : NSObject <MainViewScreenRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end