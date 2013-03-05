//
//  LDTSetoniaAPIClient.h
//  LDTSetoniaAPIClient
//
//  Created by Shane Zatezalo on 3/4/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFJSONRequestOperation.h"
#import "LDTSetoniaHTTPClient.h"

@class LDTSetoniaHTTPClient;

@interface LDTSetoniaAPIClient : LDTSetoniaHTTPClient


+ (LDTSetoniaAPIClient *)sharedClient;


- (id)initWithBaseURL:(NSURL *)url;

/**
 Get Movies from Setonia
 
 @param query an `NSString` representing the query to use
 */
+ (void)loadMoviesFromQuery:(NSString *)query withBlock:(void (^)(NSArray *groups, NSError *error))block;


/**
 Get Search from Setonia
 
 @param query an `NSString` representing the query to use
 */
+ (void)loadSearchFromQuery:(NSString *)query withBlock:(void (^)(NSArray *groups, NSError *error))block;


/**
 Get Sports from Setonia
 
 @param query an `NSString` representing the query to use
 */
+ (void)loadSportsFromQuery:(NSString *)query withBlock:(void (^)(NSArray *groups, NSError *error))block;


@end

