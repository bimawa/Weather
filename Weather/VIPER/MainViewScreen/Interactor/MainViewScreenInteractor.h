//
//  MainViewScreenMainViewScreenInteractor.h
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//
#import "MainViewScreenInteractorInput.h"

@class RACSubject;
@protocol MainViewScreenInteractorOutput;

@interface MainViewScreenInteractor : NSObject <MainViewScreenInteractorInput>

@property(nonatomic, weak) id <MainViewScreenInteractorOutput> output;

@end

@protocol MainViewScreenInteractorOutput;

