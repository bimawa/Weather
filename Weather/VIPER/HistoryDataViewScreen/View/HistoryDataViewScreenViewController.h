//
//  HistoryDataViewScreenHistoryDataViewScreenViewController.h
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Texture/AsyncDisplayKit/ASViewController.h>
#import "HistoryDataViewScreenViewInput.h"

@protocol HistoryDataViewScreenViewOutput;

@interface HistoryDataViewScreenViewController : ASViewController <HistoryDataViewScreenViewInput>

@property (nonatomic, strong) id<HistoryDataViewScreenViewOutput> output;

@end
