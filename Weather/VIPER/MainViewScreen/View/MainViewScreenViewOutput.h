//
//  MainViewScreenMainViewScreenViewOutput.h
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MainViewScreenViewOutput <NSObject>

/**
 @author Maksim Bunkow

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

//Actions
- (void)a_openHistory;
@end