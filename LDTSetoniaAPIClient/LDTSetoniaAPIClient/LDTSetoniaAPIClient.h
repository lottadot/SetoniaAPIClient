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
#import <UIKit/UIKit.h>

@class LDTSetoniaHTTPClient;

/**
 `LDTSetoniaHTTPClient` communicates with the Setonia API.
 
  @warning This requires the `SystemConfiguration` framework (just like AFNetworking does).
 */
@interface LDTSetoniaAPIClient : LDTSetoniaHTTPClient


+ (LDTSetoniaAPIClient *)sharedClient;


- (id)initWithBaseURL:(NSURL *)url;

/**
 Get Movies from Setonia
 
 @param query an `NSString` representing the query to use
 */
+ (void)loadMoviesFromQuery:(NSString *)query withBlock:(void (^)(NSArray *serviceDictionaries, NSError *error))block;


/**
 Get Search from Setonia
 
 @param query an `NSString` representing the query to use
 */
+ (void)loadSearchFromQuery:(NSString *)query withBlock:(void (^)(NSArray *serviceDictionaries, NSError *error))block;


/**
 Get Sports from Setonia
 
 @param query an `NSString` representing the query to use
 */
+ (void)loadSportsFromQuery:(NSString *)query withBlock:(void (^)(NSArray *serviceDictionaries, NSError *error))block;


- (UIImageView *)imageViewWithURL:(NSURL *)url;


@end

