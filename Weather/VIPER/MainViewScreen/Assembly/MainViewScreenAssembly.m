//
//  MainViewScreenMainViewScreenAssembly.m
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "MainViewScreenAssembly.h"
#import "MainViewScreenViewController.h"
#import "MainViewScreenInteractor.h"
#import "MainViewScreenPresenter.h"
#import "MainViewScreenViewModel.h"
#import "MainViewScreenRouter.h"
#import "GeolocationServiceProtocol.h"
#import "GeolocationService.h"
#import "NetworkServiceProtocol.h"
#import "NetworkService.h"
#import "WeatherService.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation MainViewScreenAssembly

- (id <RamblerViperModuleFactoryProtocol>)factoryMainViewScreenModule {
  return [TyphoonDefinition withClass:[RamblerViperModuleFactory class]
                        configuration:^(TyphoonDefinition *definition) {
                          [definition useInitializer:@selector(initWithViewHandler:)
                                          parameters:^(TyphoonMethod *initializer) {
                                            [initializer injectParameterWith:^id <RamblerViperModuleTransitionHandlerProtocol>(void) {
                                              return [self viewMainViewScreenModule];
                                            }];
                                          }];
                        }];
}

- (MainViewScreenViewController *)viewMainViewScreenModule {
  return [TyphoonDefinition withClass:[MainViewScreenViewController class]
                        configuration:^(TyphoonDefinition *definition) {
                          [definition injectProperty:@selector(output)
                                                with:[self presenterMainViewScreenModule]];
                          [definition injectProperty:@selector(moduleInput)
                                                with:[self presenterMainViewScreenModule]];
                          [definition injectProperty:@selector(viewModel)
                                                with:[self viewModelMainViewScreenModule]];
                        }];
}

- (MainViewScreenInteractor *)interactorMainViewScreenModule {
  return [TyphoonDefinition withClass:[MainViewScreenInteractor class]
                        configuration:^(TyphoonDefinition *definition) {
                          [definition injectProperty:@selector(output)
                                                with:[self presenterMainViewScreenModule]];
                          [definition injectProperty:@selector(geolocationService)
                                                with:[self geolocationMainViewScreenModule]];
                          [definition injectProperty:@selector(networkService)
                                                with:[self networkServiceMainViewScreenModule]];
                          [definition injectProperty:@selector(weatherService)
                                                with:[self weatherServiceMainViewScreenModule]];
                        }];
}

- (MainViewScreenPresenter *)presenterMainViewScreenModule {
  return [TyphoonDefinition withClass:[MainViewScreenPresenter class]
                        configuration:^(TyphoonDefinition *definition) {
                          [definition injectProperty:@selector(view)
                                                with:[self viewMainViewScreenModule]];
                          [definition injectProperty:@selector(interactor)
                                                with:[self interactorMainViewScreenModule]];
                          [definition injectProperty:@selector(router)
                                                with:[self routerMainViewScreenModule]];
                          [definition injectProperty:@selector(viewModel)
                                                with:[self viewModelMainViewScreenModule]];
                        }];
}

- (MainViewScreenViewModel *)viewModelMainViewScreenModule {
  return [TyphoonDefinition withClass:[MainViewScreenViewModel class] configuration:^(TyphoonDefinition *definition) {
    definition.scope = TyphoonScopeSingleton;
  }];
}

- (MainViewScreenRouter *)routerMainViewScreenModule {
  return [TyphoonDefinition withClass:[MainViewScreenRouter class]
                        configuration:^(TyphoonDefinition *definition) {
                          [definition injectProperty:@selector(transitionHandler)
                                                with:[self viewMainViewScreenModule]];
                        }];
}

#pragma mark - Services

- (id <GeolocationServiceProtocol>)geolocationMainViewScreenModule {
  return [TyphoonDefinition withClass:[GeolocationService class]
                        configuration:^(TyphoonDefinition *definition) {
                          [definition useInitializer:@selector(sharedInstance)];
                          definition.scope = TyphoonScopeSingleton;
                        }];
}

- (id <NetworkServiceProtocol>)networkServiceMainViewScreenModule {
  return [TyphoonDefinition withClass:[NetworkService class]
                        configuration:^(TyphoonDefinition *definition) {
                          definition.scope = TyphoonScopeSingleton;
                        }];
}

- (id <WeatherServiceProtocol>)weatherServiceMainViewScreenModule{
  return [TyphoonDefinition withClass:[WeatherService class]];
}
@end
