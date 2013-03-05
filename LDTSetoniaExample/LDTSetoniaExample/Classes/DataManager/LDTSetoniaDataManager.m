//
//  LDTSetoniaDataManager.m
//  LDTSetoniaExample
//
//  Created by Shane Zatezalo on 3/4/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import "LDTSetoniaDataManager.h"
// TODO (szatezalo, 2013-03-04) import LDTSetoniaAPIClient
#import <LDTSetoniaAPIClient/LDTSetoniaAPIClient.h>

@implementation LDTSetoniaDataManager


+ (LDTSetoniaDataManager *)sharedClient {
    static LDTSetoniaDataManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LDTSetoniaDataManager alloc] init];
    });
    
    return _sharedClient;
}


+ (void)moviesWithQuery:(NSString *)query
         withCompletion:(void (^)(NSArray *movies, NSError *error))completion
           withProgress:(void (^)(NSString *progressInfo))progress {
    // TODO (szatezalo, 2013-03-04) moviesWithQuery
    NSAssert(NO,@"Not Implemented");
}


+ (void)sportsWithQuery:(NSString *)query
         withCompletion:(void (^)(NSArray *movies, NSError *error))completion
           withProgress:(void (^)(NSString *progressInfo))progress {
    // TODO (szatezalo, 2013-03-04) sportsWithQuery
    NSAssert(NO,@"Not Implemented");
}


+ (void)searchWithQuery:(NSString *)query
         withCompletion:(void (^)(NSArray *movies, NSError *error))completion
           withProgress:(void (^)(NSString *progressInfo))progress {
    // TODO (szatezalo, 2013-03-04) searchWithQuery
    NSAssert(NO,@"Not Implemented");
}


@end
