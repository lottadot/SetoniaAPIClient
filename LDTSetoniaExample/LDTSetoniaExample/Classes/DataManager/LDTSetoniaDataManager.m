//
//  LDTSetoniaDataManager.m
//  LDTSetoniaExample
//
//  Created by Shane Zatezalo on 3/4/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import "LDTSetoniaDataManager.h"
#import <LDTSetoniaAPIClient/LDTSetoniaAPIClient.h>
#import "Product.h"

@implementation LDTSetoniaDataManager


+ (LDTSetoniaDataManager *)sharedClient {
    static LDTSetoniaDataManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LDTSetoniaDataManager alloc] init];
    });
    
    return _sharedClient;
}


- (void)setApiClient:(LDTSetoniaAPIClient *)apiClient {
    _apiClient = apiClient;
    if (nil == _apiClient) {
        _apiClient = [LDTSetoniaAPIClient sharedClient];
    }
}


+ (void)moviesWithQuery:(NSString *)query
         withCompletion:(void (^)(NSArray *movies, NSError *error))completion
           withProgress:(void (^)(NSString *progressInfo))progress {
    
    [LDTSetoniaAPIClient loadMoviesFromQuery:query withBlock:^(NSArray *groups, NSError *error) {
        if (nil != error) {
            if (completion) {
                completion(groups, nil);
            }
        } else {
            if (completion) {
                completion(nil, error);
            }
        }
    }];
}


+ (void)sportsWithQuery:(NSString *)query
         withCompletion:(void (^)(NSArray *movies, NSError *error))completion
           withProgress:(void (^)(NSString *progressInfo))progress {

    [LDTSetoniaAPIClient loadSportsFromQuery:query withBlock:^(NSArray *groups, NSError *error) {
        if (nil != error) {
            if (completion) {
                completion(groups, nil);
            }
        } else {
            if (completion) {
                completion(nil, error);
            }
        }
    }];
}


+ (void)searchWithQuery:(NSString *)query
         withCompletion:(void (^)(NSArray *movies, NSError *error))completion
           withProgress:(void (^)(NSString *progressInfo))progress {

    [LDTSetoniaAPIClient loadSearchFromQuery:query
                                   withBlock:^(NSArray *groups, NSError *error) {
        if (nil != error) {
            if (completion) {
                completion(groups, nil);
            }
        } else {
            if (completion) {
                completion(nil, error);
            }
        }
    }];
}


@end
