//
// Created by Maxim Bunkov on 04/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Typhoon/TyphoonAssembly.h>
#import <RamblerTyphoonUtils/RamblerInitialAssembly.h>
#import "ApplicationAssembly.h"
#import "RamblerInitialAssembly.h"
#import "TyphoonAssembly.h"
#import "RamblerAppDelegateProxy.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "MainViewScreenAssembly.h"
#import "ApplicationsStatusDelegate.h"
#import "GeolocationServiceProtocol.h"
#import "GeolocationService.h"

@interface ApplicationAssembly ()

@property(nonatomic, strong, readonly) MainViewScreenAssembly *mainViewScreenAssembly;

@end

@implementation ApplicationAssembly {

}

- (RamblerAppDelegateProxy *)applicationDelegateProxy {
  return [TyphoonDefinition withClass:[RamblerAppDelegateProxy class]
                        configuration:^(TyphoonDefinition *definition) {
                          [definition injectMethod:@selector(addAppDelegates:)
                                        parameters:^(TyphoonMethod *method) {
                                          [method injectParameterWith:@[
                                              [self appDelegateAssembly],
                                              [self appStatusDelegate]
                                          ]];
                                        }];
                        }];
}

- (ApplicationsStatusDelegate *)appStatusDelegate {
  return [TyphoonDefinition withClass:[ApplicationsStatusDelegate class] configuration:^(TyphoonDefinition *definition) {
    [definition injectProperty:@selector(geolocationService) with:[self geolocationService]];
  }];
}

- (AppDelegate *)appDelegateAssembly {
  return [TyphoonDefinition withClass:[AppDelegate class]
                        configuration:^(TyphoonDefinition *definition) {
                          [definition injectProperty:@selector(rootViewController) with:[self rootViewController]];
                        }];
}

- (id)rootViewController {
  return [TyphoonDefinition withFactory:self.mainViewScreenAssembly.factoryMainViewScreenModule selector:@selector(instantiateModuleTransitionHandler)];
}

- (id <GeolocationServiceProtocol>)geolocationService {
  return [TyphoonDefinition withClass:[GeolocationService class]
                        configuration:^(TyphoonDefinition *definition) {
                          [definition useInitializer:@selector(sharedInstance)];
                          definition.scope = TyphoonScopeSingleton;
                        }];
}
@end