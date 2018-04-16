//
//  MainViewScreenMainViewScreenDisplayNode.h
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Texture/AsyncDisplayKit/ASDisplayNode.h>

@class MainViewScreenViewModel;

@interface MainViewScreenDisplayNode : ASDisplayNode

- (void)setupViewModel:(MainViewScreenViewModel *)viewModel;

@end