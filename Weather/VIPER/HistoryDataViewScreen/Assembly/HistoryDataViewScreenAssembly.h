//
//  HistoryDataViewScreenHistoryDataViewScreenAssembly.h
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

/**
 @author Maksim Bunkow

 HistoryDataViewScreen module
 */

@protocol RamblerViperModuleFactoryProtocol;
@interface HistoryDataViewScreenAssembly : TyphoonAssembly <RamblerInitialAssembly>

- (id <RamblerViperModuleFactoryProtocol>)factoryHistoryDataViewScreenModule;

@end
