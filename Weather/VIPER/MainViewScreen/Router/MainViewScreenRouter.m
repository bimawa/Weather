//
//  MainViewScreenMainViewScreenRouter.m
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "MainViewScreenRouter.h"
#import "ViperMcFlurry/ViperMcFlurry.h"
#import "HistoryDataViewScreenModuleInput.h"

@implementation MainViewScreenRouter

#pragma mark - Методы MainViewScreenRouterInput

- (void)openHistoryModule {
  [[self.transitionHandler openModuleUsingFactory:[self historyDataViewScreen]
                              withTransitionBlock:^(UIViewController <RamblerViperModuleTransitionHandlerProtocol> *sourceModuleTransitionHandler, UIViewController <RamblerViperModuleTransitionHandlerProtocol> *destinationModuleTransitionHandler) {
                                [sourceModuleTransitionHandler.navigationController pushViewController:destinationModuleTransitionHandler animated:YES];
                              }] thenChainUsingBlock:(RamblerViperModuleLinkBlock) ^id <RamblerViperModuleOutput>(id <HistoryDataViewScreenModuleInput> moduleInput) {
    [moduleInput configureModule];
    return nil;
  }];
}

@end