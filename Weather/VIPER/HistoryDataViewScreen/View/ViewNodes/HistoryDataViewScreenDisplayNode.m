//
//  HistoryDataViewScreenHistoryDataViewScreenDisplayNode.m
//  Weather
//
//  Created by Maksim Bunkow on 24/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "HistoryDataViewScreenDisplayNode.h"

@interface HistoryDataViewScreenDisplayNode ()

@property(nonatomic, strong, readwrite) ASCollectionNode *collectionNode;
@end

@implementation HistoryDataViewScreenDisplayNode {

}

- (id)init {
  self = [super init];
  if (self) {
    [self setAutomaticallyManagesSubnodes:YES];

    UICollectionViewFlowLayout *collectionViewFlowLayout = [UICollectionViewFlowLayout new];
    collectionViewFlowLayout.minimumLineSpacing = 0;
    self.collectionNode                         = [[ASCollectionNode alloc] initWithCollectionViewLayout:collectionViewFlowLayout];
    self.collectionNode.backgroundColor         = [UIColor whiteColor];

  }
  return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {

  ASInsetLayoutSpec *insetLayoutSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) child:self.collectionNode];
  return insetLayoutSpec;
}

@end