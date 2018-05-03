// Created by Maxim Bunkov on 03/05/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Texture/AsyncDisplayKit/ASCellNode.h>

@class HistoryDataViewScreenCellViewModel;
@class ASNetworkImageNode;

@interface HistoryDataViewScreenCellNode : ASCellNode

- (instancetype)initWithViewModel:(HistoryDataViewScreenCellViewModel *)viewModel;
@end