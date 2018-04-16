//
//  MainViewScreenMainViewScreenInteractorInput.h
//  Weather
//
//  Created by Maksim Bunkow on 04/04/2018.
//  Copyright 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MainViewScreenInteractorInput <NSObject>

- (void)startLocation;
- (NSURL *)getVideostockURLFromCodeOfWeather:(NSNumber *)codeWeather;

@end