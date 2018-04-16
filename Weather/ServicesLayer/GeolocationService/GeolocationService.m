//
// Created by Maxim Bunkov on 05/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "GeolocationService.h"
#import "UIKit/UIDevice.h"
#import "GeolocationServiceProtocol.h"
#import "RACSubject.h"
#import "RACSignal.h"
#import "RACSubject.h"

@interface GeolocationService () <CLLocationManagerDelegate, GeolocationServiceProtocol>

@property(nonatomic, strong) CLLocationManager     *locationManager;
@property(nonatomic, strong, readwrite) RACSubject *forecastUpdateSubject;

@property(nonatomic) BOOL deferringUpdates;
@property(nonatomic) BOOL isBackgroundMode;
@end

@implementation GeolocationService {

}

+ (instancetype)sharedInstance {
  static GeolocationService *shareInstance = nil;
  static dispatch_once_t    onceToken;
  dispatch_once(&onceToken, ^{
    shareInstance = [(GeolocationService *) [super alloc] initPrivate];
  });
  return shareInstance;
}


- (instancetype)initPrivate {
  self = [super init];
  if (self) {
    self.locationManager                 = [[CLLocationManager alloc] init];
    self.locationManager.delegate        = self;
    self.locationManager.distanceFilter  = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.forecastUpdateSubject           = [RACSubject subject];
  }

  return self;
}

#pragma mark - Public methods

- (void)startLocationBackground {
  self.isBackgroundMode = YES;
  [self.locationManager stopUpdatingLocation];
  [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
  [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
  self.locationManager.pausesLocationUpdatesAutomatically = NO;
  self.locationManager.activityType                       = CLActivityTypeAutomotiveNavigation;
  [self.locationManager startUpdatingLocation];
}

- (void)startLocationForeground {
  self.isBackgroundMode = NO;
  if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
    [self.locationManager requestAlwaysAuthorization];
  }
  self.locationManager.desiredAccuracy = 45;
  self.locationManager.distanceFilter  = 100;
  [self.locationManager startUpdatingLocation];
}

- (void)stopLocationUpdate {
  [self.locationManager stopUpdatingLocation];
}

#pragma mark - Delegates

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
  CLGeocoder *clGeocoder = [CLGeocoder new];
  [clGeocoder reverseGeocodeLocation:locations.firstObject completionHandler:^(NSArray<CLPlacemark *> *placemarks, NSError *error) {
    [self.forecastUpdateSubject sendNext:placemarks.firstObject];
  }];

  if (self.isBackgroundMode && !self.deferringUpdates) {
    self.deferringUpdates = YES;
    [self.locationManager allowDeferredLocationUpdatesUntilTraveled:CLLocationDistanceMax timeout:10];
  }
}

- (void)locationManager:(CLLocationManager *)manager didFinishDeferredUpdatesWithError:(nullable NSError *)error {
  self.deferringUpdates = NO;
}

@end