//
//  HistoryDataViewScreenHistoryDataViewScreenViewController.m
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <ViperMcFlurry/ViperMcFlurry.h>
#import <Texture/AsyncDisplayKit/ASCollectionNode.h>
#import "HistoryDataViewScreenViewController.h"
#import "HistoryDataViewScreenViewOutput.h"
#import "HistoryDataViewScreenDisplayNode.h"
#import "HistoryDataViewScreenViewModel.h"
#import "HistoryDataViewScreenCellNode.h"
#import "HistoryDataViewScreenCellViewModel.h"

@interface HistoryDataViewScreenViewController () <RamblerViperModuleTransitionHandlerProtocol, ASCollectionDataSource, ASCollectionDelegate>

@property(nonatomic, strong) HistoryDataViewScreenDisplayNode *viewNode;
@property(nonatomic, strong) HistoryDataViewScreenViewModel   *viewModel;
@end

@implementation HistoryDataViewScreenViewController

#pragma mark - Методы жизненного цикла

- (instancetype)init {
  HistoryDataViewScreenDisplayNode *viewNode = [[HistoryDataViewScreenDisplayNode alloc] init];
  self = [super initWithNode:viewNode];
  if (self) {
    self.viewNode = viewNode;
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.viewNode.collectionNode setDelegate:self];
  [self.viewNode.collectionNode setDataSource:self];

  [self.output didTriggerViewReadyEvent];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:NO];
}

#pragma mark - Методы HistoryDataViewScreenViewInput

- (void)setupInitialState:(HistoryDataViewScreenViewModel *)viewModel {
  self.viewModel = viewModel;
}

- (void)reloadData {
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.viewNode.collectionNode reloadData];
  });
}

#pragma mark - ASCollectionDelegate

- (NSInteger)collectionNode:(ASCollectionNode *)collectionNode numberOfItemsInSection:(NSInteger)section {
  return [self.viewModel numberOfItems];
}

- (NSInteger)numberOfSectionsInCollectionNode:(ASCollectionNode *)collectionNode {
  return [self.viewModel numberOfSections];
}

- (ASCellNodeBlock)collectionNode:(ASCollectionNode *)collectionNode nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath {
  return ^ASCellNode * {
    return [[HistoryDataViewScreenCellNode alloc] initWithViewModel:[self.viewModel cellModelForIndexPath:indexPath]];
  };
}

- (void)collectionNode:(ASCollectionNode *)collectionNode didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
  [self.output a_selectedIndexPath:indexPath];
}


@end
