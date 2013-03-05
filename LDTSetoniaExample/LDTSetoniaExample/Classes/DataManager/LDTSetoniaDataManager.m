//
//  LDTSetoniaDataManager.m
//  LDTSetoniaExample
//
//  Created by Shane Zatezalo on 3/4/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import "LDTSetoniaDataManager.h"
// TODO (szatezalo, 2013-03-04) import LDTSetoniaAPIClient
//#import <LDTSetoniaAPIClient/LDTSetoniaAPIClient.h>
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
    
//    LDTSetoniaDataManagerProgressBlock progress = ^(NSString *progressInfo){
//        if (progress) {
//            progress(progressInfo);
//        }
//    };
    
    LDTSetoniaDataManagerCompletionBlock completionBlock = ^(NSArray *results, NSError *error){
        if (nil == error) {
            if (nil != results) {
                NSMutableArray *serviceProducts = [[NSMutableArray alloc] initWithCapacity:[results count]];
                for (id obj in results) {
                    NSDictionary *serviceDict = (NSDictionary *)obj;
                    Product *product = [Product instanceFromDictionary:serviceDict];
                    [serviceProducts addObject:product];
                }
                
                if (completion) {
                    completion(serviceProducts, nil);
                }
            }
        } else {
            if (completion) {
                completion(nil, error);
            }
        }
 
    };
    
    //[[LDTSetoniaAPIClient sharedClient] load
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
