//
//  MainViewScreenMainViewScreenViewController.m
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <ViperMcFlurry/ViperMcFlurry.h>
#import "MainViewScreenViewController.h"
#import "MainViewScreenViewOutput.h"
#import "MainViewScreenDisplayNode.h"
#import "MainViewScreenViewModel.h"

@interface MainViewScreenViewController () <RamblerViperModuleTransitionHandlerProtocol>

@property(nonatomic, strong) MainViewScreenDisplayNode *viewNode;
@property(nonatomic, strong) MainViewScreenViewModel   *viewModel;
@end

@implementation MainViewScreenViewController

#pragma mark - Методы жизненного цикла

- (instancetype)init {
  MainViewScreenDisplayNode *viewNode = [[MainViewScreenDisplayNode alloc] init];
  self = [super initWithNode:viewNode];
  if (self) {
    self.viewNode = viewNode;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.viewNode setupViewModel:self.viewModel];
  [self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы MainViewScreenViewInput


@end
