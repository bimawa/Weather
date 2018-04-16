//
//  MainViewScreenMainViewScreenAssembly.h
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

/**
 @author Maksim Bunkow

 MainViewScreen module
 */

@protocol RamblerViperModuleFactoryProtocol;
@interface MainViewScreenAssembly : TyphoonAssembly <RamblerInitialAssembly>

- (id <RamblerViperModuleFactoryProtocol>)factoryMainViewScreenModule;

@end
