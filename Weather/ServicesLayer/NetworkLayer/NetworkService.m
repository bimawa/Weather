//
// Created by Maxim Bunkov on 05/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import "NetworkService.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFURLRequestSerialization.h"
#import "AFURLResponseSerialization.h"
#import "RACTuple.h"
#import "RACAFNetworking.h"
#import "NetworkServiceProtocol.h"
#import "Constants.h"
#import "CityWeatherEntity.h"


@interface NetworkService () <NetworkServiceProtocol>
@end

@implementation NetworkService {

}

- (RACSignal *)getWeatherForCity:(NSString *)cityName {
  return [RACSignal createSignal:^RACDisposable *(id <RACSubscriber> subscriber) {
    NSURL *url = [NSURL URLWithString:kURLForecastService];

    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
    manager.requestSerializer  = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];

    NSDictionary *params = @{@"q": cityName, @"APPID": kURLForecastAPIKey, @"units": @"metric"};
    [[manager rac_GET:kURLForecastAPIVersion parameters:params] subscribeNext:^(RACTuple *JSONAndHeaders) {
      //Voila, a tuple with (JSON, HTTPResponse)
      NSDictionary      *dataJson = JSONAndHeaders.first;
      NSHTTPURLResponse *response = JSONAndHeaders.second;
      if (response.statusCode >= 200 && response.statusCode < 300) {
        NSError           *parserError       = nil;
        CityWeatherEntity *cityWeatherEntity = [[CityWeatherEntity alloc] initWithDictionary:dataJson error:&parserError];
        if (parserError == nil && cityWeatherEntity != nil) {
          [subscriber sendNext:cityWeatherEntity];
          [subscriber sendCompleted];
        } else if (parserError) {
          [subscriber sendError:parserError];
        }
      } else {
        [subscriber sendError:[NSError errorWithDomain:NSStringFromClass([self class]) code:1000 userInfo:nil]];
      }
    }];
    return nil;
  }];
}

@end