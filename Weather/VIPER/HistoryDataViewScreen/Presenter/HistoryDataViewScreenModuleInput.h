//
//  HistoryDataViewScreenHistoryDataViewScreenModuleInput.h
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HistoryDataViewScreenModuleInput <NSObject>

/**
 @author Maksim Bunkow

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end