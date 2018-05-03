//
// Created by Maxim Bunkov on 03/05/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import "HistoryDataViewScreenCellNode.h"
#import "HistoryDataViewScreenCellViewModel.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>


@interface HistoryDataViewScreenCellNode ()

@property(nonatomic, strong) HistoryDataViewScreenCellViewModel *currentViewModel;
@property(nonatomic, strong) ASNetworkImageNode                 *iconImageNode;
@property(nonatomic, strong) ASTextNode                         *titleTextNode;
@property(nonatomic, strong) ASTextNode                         *subTitleTextNode;
@property(nonatomic, strong) ASDisplayNode                      *separatorNode;
@end

@implementation HistoryDataViewScreenCellNode {

}

- (instancetype)initWithViewModel:(HistoryDataViewScreenCellViewModel *)viewModel {
  self = [super init];
  if (self) {
    self.currentViewModel = viewModel;
    [self setAutomaticallyManagesSubnodes:YES];

    self.iconImageNode = [[ASNetworkImageNode alloc] initWithCache:[ASPINRemoteImageDownloader sharedDownloader]
                                                        downloader:[ASPINRemoteImageDownloader sharedDownloader]];
    if (self.currentViewModel.iconURLString) {
      NSURL *iconURL = [NSURL URLWithString:self.currentViewModel.iconURLString];
      if (iconURL) {
        [self.iconImageNode setURL:iconURL];
      }
    }

    self.titleTextNode = [ASTextNode new];
    [self.titleTextNode setAttributedText:[[NSAttributedString alloc] initWithString:self.currentViewModel.title ?: @"" attributes:@{
        NSForegroundColorAttributeName: [UIColor blackColor],
        NSFontAttributeName: [UIFont systemFontOfSize:20]
    }]];

    self.subTitleTextNode = [ASTextNode new];
    [self.subTitleTextNode setAttributedText:[[NSAttributedString alloc] initWithString:self.currentViewModel.subTitle ?: @"" attributes:@{
        NSForegroundColorAttributeName: [UIColor blackColor],
        NSFontAttributeName: [UIFont systemFontOfSize:15]
    }]];

    self.separatorNode                 = [ASDisplayNode new];
    self.separatorNode.backgroundColor = [UIColor grayColor];
    [self.separatorNode styledWithBlock:^(__kindof ASLayoutElementStyle *style) {
      style.flexBasis = ASDimensionMakeWithPoints(1);
      style.flexGrow  = YES;
    }];
  }

  return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {

  [self.iconImageNode styledWithBlock:^(__kindof ASLayoutElementStyle *style) {
    style.preferredSize = CGSizeMake(50, 50);
  }];
  ASInsetLayoutSpec *iconInsetLayoutSpec = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(15, 15, 15, 15) child:self.iconImageNode];
  [iconInsetLayoutSpec styledWithBlock:^(__kindof ASLayoutElementStyle *style) {
    style.flexShrink = NO;
  }];

  ASStackLayoutSpec *verticaleTextsSpec  = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:5 justifyContent:ASStackLayoutJustifyContentCenter
                                                                                alignItems:ASStackLayoutAlignItemsStretch children:@[self.titleTextNode, self.subTitleTextNode]];
  ASStackLayoutSpec *horizontaleMainSpec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal spacing:0 justifyContent:ASStackLayoutJustifyContentStart
                                                                                alignItems:ASStackLayoutAlignItemsStretch children:@[iconInsetLayoutSpec, verticaleTextsSpec]];
  ASStackLayoutSpec *specForSeparator    = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:0 justifyContent:ASStackLayoutJustifyContentStart
                                                                                alignItems:ASStackLayoutAlignItemsStretch children:@[horizontaleMainSpec, self.separatorNode]];
  return specForSeparator;
}


@end