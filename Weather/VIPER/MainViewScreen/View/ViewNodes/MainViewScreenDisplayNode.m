//
//  MainViewScreenMainViewScreenDisplayNode.m
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <Texture/AsyncDisplayKit/AsyncDisplayKit.h>
#import <ReactiveCocoa/RACSignal+Operations.h>
#import "MainViewScreenDisplayNode.h"
#import "MainViewScreenViewModel.h"
#import "NSObject+RACPropertySubscribing.h"
#import "ReactiveCocoa/RACEXTScope.h"
#import "RACSignal.h"

@interface MainViewScreenDisplayNode ()

@property(nonatomic, strong) ASVideoPlayerNode  *videoNodeBackground;
@property(nonatomic, strong) ASTextNode         *cityTitleLabel;
@property(nonatomic, strong) ASNetworkImageNode *weatherIconImage;
@property(nonatomic, strong) ASTextNode         *temperatureLabel;
@property(nonatomic, strong) ASTextNode         *mainStatusString;
@property(nonatomic, strong) ASTextNode         *descriptionFullWeather;
@end

@implementation MainViewScreenDisplayNode {

}

- (id)init {
  self = [super init];
  if (self) {
    [self setAutomaticallyManagesSubnodes:YES];

    self.videoNodeBackground                  = [[ASVideoPlayerNode alloc] init];
    self.videoNodeBackground.shouldAutoPlay   = YES;
    self.videoNodeBackground.shouldAutoRepeat = YES;
    self.videoNodeBackground.controlsDisabled = YES;

    [self.videoNodeBackground setAssetURL:[NSURL URLWithString:@"https://media.gettyimages.com/videos/supercell-hurricane-or-tornado-seen-from-space-by-satellite-video-id106657487"]];
    self.videoNodeBackground.userInteractionEnabled = NO;
    self.videoNodeBackground.style.preferredSize    = [UIScreen mainScreen].bounds.size;
    self.videoNodeBackground.style.flexGrow         = YES;
    self.videoNodeBackground.gravity                = AVLayerVideoGravityResizeAspectFill;

    self.cityTitleLabel         = [ASTextNode new];
    self.temperatureLabel       = [ASTextNode new];
    self.weatherIconImage       = [[ASNetworkImageNode alloc] initWithCache:[ASPINRemoteImageDownloader sharedDownloader] downloader:[ASPINRemoteImageDownloader sharedDownloader]];
    self.mainStatusString       = [ASTextNode new];
    self.descriptionFullWeather = [ASTextNode new];
  }
  return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
  ASInsetLayoutSpec   *videoSpec        = [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsZero child:self.videoNodeBackground];
  ASStackLayoutSpec   *verticaleSpec    = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:8 justifyContent:ASStackLayoutJustifyContentCenter alignItems:ASStackLayoutAlignItemsCenter children:@[
      self.cityTitleLabel,
      self.temperatureLabel,
      self.weatherIconImage,
      self.mainStatusString,
      self.descriptionFullWeather
  ]];
  ASOverlayLayoutSpec *overlayMainStack = [ASOverlayLayoutSpec overlayLayoutSpecWithChild:videoSpec overlay:verticaleSpec];

  return overlayMainStack;
}

- (void)setupViewModel:(MainViewScreenViewModel *)viewModel {
  @weakify(self);
  [[RACObserve(viewModel, urlVideoStock) ignore:nil] subscribeNext:^(NSURL *urlAsset) {
    @strongify(self);
    [self.videoNodeBackground setAssetURL:urlAsset];
  }];

  [[[[RACObserve(viewModel, cityName) ignore:nil] distinctUntilChanged] deliverOnMainThread] subscribeNext:^(NSString *cityName) {
    @strongify(self);
    self.cityTitleLabel.attributedText = [[NSAttributedString alloc] initWithString:cityName attributes:self.generalStyleText];
  }];

  [[RACObserve(viewModel, iconURLString) ignore:nil] subscribeNext:^(NSString *urlIconString) {
    @strongify(self);
    NSURL *urlFromString = [NSURL URLWithString:urlIconString];
    if (urlFromString) {
      [self.weatherIconImage setURL:urlFromString];
    }
  }];

  [[[[RACObserve(viewModel, temperature) ignore:nil] distinctUntilChanged] deliverOnMainThread] subscribeNext:^(NSNumber *temperature) {
    @strongify(self);
    self.temperatureLabel.attributedText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ ℃", temperature] attributes:self.generalStyleText];
  }];
  [[[[RACObserve(viewModel, mainStatusString) ignore:nil] distinctUntilChanged] deliverOnMainThread] subscribeNext:^(NSString *mainStatus) {
    @strongify(self);
    self.mainStatusString.attributedText = [[NSAttributedString alloc] initWithString:mainStatus attributes:self.generalStyleText];
  }];
  [[[[RACObserve(viewModel, descriptionWeatherString) ignore:nil] distinctUntilChanged] deliverOnMainThread] subscribeNext:^(NSString *fullDescriptionString) {
    @strongify(self);
    self.descriptionFullWeather.attributedText = [[NSAttributedString alloc] initWithString:fullDescriptionString attributes:self.generalStyleText];
  }];
}

- (NSDictionary *)generalStyleText {
  return @{
      NSForegroundColorAttributeName: [UIColor whiteColor],
      NSFontAttributeName: [UIFont systemFontOfSize:24]
  };
}
@end