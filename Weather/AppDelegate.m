//
//  AppDelegate.m
//  Weather
//
//  Created by Maxim Bunkov on 04/04/2018.
//  Copyright © 2018 Bimawa. All rights reserved.
//

#import <UserNotifications/UserNotifications.h>
#import "AppDelegate.h"
#import "RamblerInitialAssemblyCollector.h"

@interface AppDelegate ()

@property(nonatomic, strong) UIViewController *rootViewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  self.window                    = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:self.rootViewController];
  self.window.backgroundColor    = [UIColor whiteColor];
  [self.window makeKeyAndVisible];

  [UNUserNotificationCenter.currentNotificationCenter requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError *error) {

  }];

  return YES;
}


#pragma mark - Typhoon

- (NSArray *)initialAssemblies {
  RamblerInitialAssemblyCollector *collector = [RamblerInitialAssemblyCollector new];
  return [collector collectInitialAssemblyClasses];
}

@end