//
//  HistoryDataViewScreenHistoryDataViewScreenInteractor.h
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import "HistoryDataViewScreenInteractorInput.h"

@protocol HistoryDataViewScreenInteractorOutput;

@interface HistoryDataViewScreenInteractor : NSObject <HistoryDataViewScreenInteractorInput>

@property (nonatomic, weak) id<HistoryDataViewScreenInteractorOutput> output;

@end