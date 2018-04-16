//
//  MainViewScreenMainViewScreenViewController.h
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Texture/AsyncDisplayKit/ASViewController.h>
#import "MainViewScreenViewInput.h"

@protocol MainViewScreenViewOutput;

@interface MainViewScreenViewController : ASViewController <MainViewScreenViewInput>

@property (nonatomic, strong) id<MainViewScreenViewOutput> output;

@end
