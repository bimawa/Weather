//
// Created by Maxim Bunkov on 06/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import "DatabaseService.h"
#import "YapDatabaseConnection.h"
#import "YapDatabase.h"

@interface DatabaseService ()

@property(nonatomic, strong, readwrite) YapDatabase *yapDatabaseStorage;
@property(nonatomic, strong) YapDatabaseConnection  *bgDatabaseConnection;
@property(nonatomic, strong) YapDatabaseConnection  *uiDatabaseConnection;
@end

@implementation DatabaseService {

}

+ (instancetype)sharedInstance {
  static dispatch_once_t pred;
  static DatabaseService *singleton = nil;

  dispatch_once(&pred, ^{
    singleton = [[DatabaseService alloc] init];
  });
  return singleton;
}

+ (NSString *)databasePath {
  NSString *databaseName = @"Weather.sqlite";

  NSURL *baseURL = [[NSFileManager defaultManager] URLForDirectory:NSApplicationSupportDirectory
                                                          inDomain:NSUserDomainMask
                                                 appropriateForURL:nil
                                                            create:YES
                                                             error:NULL];

  NSURL *databaseURL = [baseURL URLByAppendingPathComponent:databaseName isDirectory:NO];

  return databaseURL.filePathURL.path;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    [self setupDatabase];

  }

  return self;
}

- (void)setupDatabase {
  NSString *databasePath = [[self class] databasePath];

  self.yapDatabaseStorage = [[YapDatabase alloc] initWithPath:databasePath serializer:[YapDatabase defaultSerializer] deserializer:[YapDatabase defaultDeserializer]];
}

- (YapDatabaseConnection *)getBackgroundDatabaseConnection {
  YapDatabaseConnection *bgDatabaseConnection = [self.yapDatabaseStorage newConnection];
  bgDatabaseConnection.objectCacheLimit     = 200;
  bgDatabaseConnection.metadataCacheEnabled = NO;

  return bgDatabaseConnection;
}

- (YapDatabaseConnection *)getUIDatabaseConnection {
  YapDatabaseConnection *uiDatabaseConnection = [self.yapDatabaseStorage newConnection];
  uiDatabaseConnection.objectCacheLimit     = 400;
  uiDatabaseConnection.metadataCacheEnabled = NO;
  return uiDatabaseConnection;
}

@end