//
//  LDTSetoniaDataManager.h
//  LDTSetoniaExample
//
//  Created by Shane Zatezalo on 3/4/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^LDTSetoniaDataManagerProgressBlock) (NSString *progressInfo);
typedef void (^LDTSetoniaDataManagerCompletionBlock) (NSArray *results, NSError *error);

@interface LDTSetoniaDataManager : NSObject


+ (LDTSetoniaDataManager *)sharedClient;


+ (void)moviesWithQuery:(NSString *)query
         withCompletion:(void (^)(NSArray *movies, NSError *error))completion
           withProgress:(void (^)(NSString *progressInfo))progress;


+ (void)sportsWithQuery:(NSString *)query
         withCompletion:(void (^)(NSArray *movies, NSError *error))completion
           withProgress:(void (^)(NSString *progressInfo))progress;


+ (void)searchWithQuery:(NSString *)query
         withCompletion:(void (^)(NSArray *movies, NSError *error))completion
           withProgress:(void (^)(NSString *progressInfo))progress;

@end
