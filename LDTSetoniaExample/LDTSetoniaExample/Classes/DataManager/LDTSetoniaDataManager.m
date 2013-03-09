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
    
    [LDTSetoniaAPIClient loadMoviesFromQuery:query withBlock:^(NSArray *serviceDictionaries,
                                                               NSError *error) {
        if (nil == error) {
            NSLog(@"moviesWithQuery has:%@", serviceDictionaries);
            NSAssert(nil != serviceDictionaries, @"serviceDictionaries is nil");
            NSMutableArray *results = [[NSMutableArray alloc] init];
            
            if (nil != serviceDictionaries && [serviceDictionaries count]) {
                for (id obj in serviceDictionaries) {
                    NSDictionary *serviceDictionary = (NSDictionary *)obj;
                    Product *p = [Product instanceFromDictionary:serviceDictionary];
                    NSLog(@"Product:%@", [p description]);
                    [results addObject:p];
                }
            }
            NSLog(@"moviesWithQuery:results:%@", results);
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

    [LDTSetoniaAPIClient loadSportsFromQuery:query withBlock:^(NSArray *serviceDictionaries, NSError *error) {
        if (nil == error) {
            NSLog(@"sportsWithQuery has:%@", serviceDictionaries);
            NSAssert(nil != serviceDictionaries, @"serviceDictionaries is nil");
            NSMutableArray *results = [[NSMutableArray alloc] init];
            
            if (nil != serviceDictionaries && [serviceDictionaries count]) {
                for (id obj in serviceDictionaries) {
                    NSDictionary *serviceDictionary = (NSDictionary *)obj;
                    Product *p = [Product instanceFromDictionary:serviceDictionary];
                    NSLog(@"Product:%@", [p description]);
                    [results addObject:p];
                }
            }
            NSLog(@"sportsWithQuery:results:%@", results);
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

    [LDTSetoniaAPIClient loadSearchFromQuery:query withBlock:^(NSArray *serviceDictionaries, NSError *error) {
        if (nil == error) {
            NSLog(@"searchWithQuery has:%@", serviceDictionaries);
            NSAssert(nil != serviceDictionaries, @"serviceDictionaries is nil");
            NSMutableArray *results = [[NSMutableArray alloc] init];
            
            if (nil != serviceDictionaries && [serviceDictionaries count]) {
                for (id obj in serviceDictionaries) {
                    NSDictionary *serviceDictionary = (NSDictionary *)obj;
                    Product *p = [Product instanceFromDictionary:serviceDictionary];
                    NSLog(@"Product:%@", [p description]);
                    [results addObject:p];
                }
            }
            NSLog(@"searchWithQuery:results:%@", results);
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


@end
