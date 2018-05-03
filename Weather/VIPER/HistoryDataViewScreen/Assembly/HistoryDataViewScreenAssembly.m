//
//  HistoryDataViewScreenHistoryDataViewScreenAssembly.m
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "HistoryDataViewScreenAssembly.h"
#import "HistoryDataViewScreenViewController.h"
#import "HistoryDataViewScreenInteractor.h"
#import "HistoryDataViewScreenPresenter.h"
#import "HistoryDataViewScreenRouter.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation HistoryDataViewScreenAssembly

- (id <RamblerViperModuleFactoryProtocol>)factoryHistoryDataViewScreenModule
{
  return [TyphoonDefinition withClass:[RamblerViperModuleFactory class]
                        configuration:^(TyphoonDefinition *definition) {
                            [definition useInitializer:@selector(initWithViewHandler:)
                                        parameters:^(TyphoonMethod *initializer) {
                                          [initializer injectParameterWith:^id <RamblerViperModuleTransitionHandlerProtocol>(void) {
                                            return [self viewHistoryDataViewScreenModule];
                                          }];
                            }];             
  }];
}

- (HistoryDataViewScreenViewController *)viewHistoryDataViewScreenModule {
  return [TyphoonDefinition withClass:[HistoryDataViewScreenViewController class]
                        configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(output)
                                                  with:[self presenterHistoryDataViewScreenModule]];
                            [definition injectProperty:@selector(moduleInput)
                                                  with:[self presenterHistoryDataViewScreenModule]];
                        }];
}

- (HistoryDataViewScreenInteractor *)interactorHistoryDataViewScreenModule {
  return [TyphoonDefinition withClass:[HistoryDataViewScreenInteractor class]
                        configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(output)
                                                  with:[self presenterHistoryDataViewScreenModule]];
                        }];
}

- (HistoryDataViewScreenPresenter *)presenterHistoryDataViewScreenModule {
  return [TyphoonDefinition withClass:[HistoryDataViewScreenPresenter class]
                        configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(view)
                                                  with:[self viewHistoryDataViewScreenModule]];
                            [definition injectProperty:@selector(interactor)
                                                  with:[self interactorHistoryDataViewScreenModule]];
                            [definition injectProperty:@selector(router)
                                                  with:[self routerHistoryDataViewScreenModule]];
                        }];
}

- (HistoryDataViewScreenRouter *)routerHistoryDataViewScreenModule {
  return [TyphoonDefinition withClass:[HistoryDataViewScreenRouter class]
                        configuration:^(TyphoonDefinition *definition) {
                            [definition injectProperty:@selector(transitionHandler)
                                                  with:[self viewHistoryDataViewScreenModule]];
                        }];
}

@end
