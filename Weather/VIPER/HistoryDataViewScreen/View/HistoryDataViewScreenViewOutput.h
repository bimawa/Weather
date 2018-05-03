//
//  HistoryDataViewScreenHistoryDataViewScreenViewOutput.h
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HistoryDataViewScreenViewOutput <NSObject>

/**
 @author Maksim Bunkow

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

//Actions
- (void)a_selectedIndexPath:(NSIndexPath *)path;
@end