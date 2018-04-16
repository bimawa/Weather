//
// Created by Maxim Bunkov on 06/04/2018.
// Copyright (c) 2018 Bimawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YapDatabaseConnection;
@class YapDatabase;


@interface DatabaseService : NSObject

@property(nonatomic, strong, readonly) YapDatabase *yapDatabaseStorage;

/**
 * Singleton of database instance.
 * @return Database instance.
 */
+ (instancetype)sharedInstance;

/**
 * Get new unique connection for background readwrite access. Unique instance
 * @return YapDatabaseConnection instance.
 */
- (YapDatabaseConnection *)getBackgroundDatabaseConnection;

/**
 * Get new unique connection for main threads GUI access. Shared instance
 * @return YapDatabaseConnection instance.
 */
- (YapDatabaseConnection *)getUIDatabaseConnection;

@end