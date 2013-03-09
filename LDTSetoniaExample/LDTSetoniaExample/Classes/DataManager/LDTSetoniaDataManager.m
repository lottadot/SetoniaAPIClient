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
//#import "UIImageView+AFNetworking.h"

@implementation LDTSetoniaDataManager


#pragma mark - Initialization


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
    NSParameterAssert(query);
    [LDTSetoniaAPIClient loadMoviesFromQuery:query withBlock:^(NSArray *serviceDictionaries,
                                                               NSError *error) {
        if (nil == error) {

            NSMutableArray *results = [[NSMutableArray alloc] init];
            
            if (nil != serviceDictionaries && [serviceDictionaries count]) {
                for (id obj in serviceDictionaries) {
                    NSDictionary *serviceDictionary = (NSDictionary *)obj;
                    Product *p = [Product instanceFromDictionary:serviceDictionary];
                    [results addObject:p];
                }
            }
            if (completion) {
                completion(results, nil);
            }
        } else {
            NSLog(@"moviesWithQuery:error:%@ error:%@", [error localizedDescription], error);
            if (completion) {
                completion(nil, error);
            }
        }
    }];
}


+ (void)sportsWithQuery:(NSString *)query
         withCompletion:(void (^)(NSArray *movies, NSError *error))completion
           withProgress:(void (^)(NSString *progressInfo))progress {
    NSParameterAssert(query);
    [LDTSetoniaAPIClient loadSportsFromQuery:query withBlock:^(NSArray *serviceDictionaries, NSError *error) {
        if (nil == error) {
            
            NSMutableArray *results = [[NSMutableArray alloc] init];
            
            if (nil != serviceDictionaries && [serviceDictionaries count]) {
                for (id obj in serviceDictionaries) {
                    NSDictionary *serviceDictionary = (NSDictionary *)obj;
                    Product *p = [Product instanceFromDictionary:serviceDictionary];
                    [results addObject:p];
                }
            }
            if (completion) {
                completion(results, nil);
            }
        } else {
            NSLog(@"sportsWithQuery:error:%@ error:%@", [error localizedDescription], error);
            if (completion) {
                completion(nil, error);
            }
        }
    }];
}


+ (void)searchWithQuery:(NSString *)query
         withCompletion:(void (^)(NSArray *movies, NSError *error))completion
           withProgress:(void (^)(NSString *progressInfo))progress {
    NSParameterAssert(query);
    [LDTSetoniaAPIClient loadSearchFromQuery:query withBlock:^(NSArray *serviceDictionaries, NSError *error) {
        if (nil == error) {

            NSMutableArray *results = [[NSMutableArray alloc] init];
            
            if (nil != serviceDictionaries && [serviceDictionaries count]) {
                for (id obj in serviceDictionaries) {
                    NSDictionary *serviceDictionary = (NSDictionary *)obj;
                    Product *p = [Product instanceFromDictionary:serviceDictionary];
                    [results addObject:p];
                }
            }
            if (completion) {
                completion(results, nil);
            }
        } else {
            NSLog(@"searchWithQuery:error:%@ error:%@", [error localizedDescription], error);
            if (completion) {
                completion(nil, error);
            }
        }
    }];
}


- (UIImageView *)imageViewForProduct:(Product *)product {
    NSParameterAssert(product);
    if ([product photoURL]) {
        NSURL *url = [NSURL URLWithString:[product photoURL]];
        return [[LDTSetoniaAPIClient sharedClient] imageViewWithURL:url];
    } else {
        return nil;
    }
}


@end
