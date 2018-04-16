//
//  main.m
//  Weather
//
//  Created by Maxim Bunkov on 04/04/2018.
//  Copyright © 2018 Bimawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "RamblerAppDelegateProxy.h"


int main(int argc, char *argv[]) {
  @autoreleasepool {
    [[RamblerAppDelegateProxy injector] setDefaultAppDelegate:[AppDelegate new]];
    return UIApplicationMain(argc, argv, nil, NSStringFromClass([RamblerAppDelegateProxy class]));
  }

}