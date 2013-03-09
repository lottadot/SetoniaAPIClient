//
//  LDTSetoniaAPIClient.m
//  LDTSetoniaAPIClient
//
//  Created by Shane Zatezalo on 3/4/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import "LDTSetoniaAPIClient.h"
#import "LDTSetoniaHTTPClient.h"
#import "AFJSONRequestOperation.h"
#import "NSMutableURLRequest+SetoniaUtil.h"
#import "LDTSetoniaJSONRequestOperation.h"
#import "UIImageView+AFNetworking.h"
#import "LDTSetoniaJSONRequestOperation.h"

#define kSetoniaAPIURL @"http://setonia.com/V1/"

@implementation LDTSetoniaAPIClient


#pragma mark - Initialization


+ (LDTSetoniaAPIClient *)sharedClient {
    static LDTSetoniaAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LDTSetoniaAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kSetoniaAPIURL]];
    });
    
    return _sharedClient;
}


- (id)initWithBaseURL:(NSURL *)url {
    NSParameterAssert(url);
    
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }

//    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    [self registerHTTPOperationClass:[LDTSetoniaJSONRequestOperation class]];    
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	//[self setDefaultHeader:@"Accept" value:@"application/json"];
    [self setDefaultHeader:@"Accept" value:@"application/html"];
    [self setDefaultHeader:@"Accept-Charset" value:@"utf-8"];
    return self;
}


#pragma mark - Obtain Movies Results


+ (void)loadMoviesFromQuery:(NSString *)query withBlock:(void (^)(NSArray *serviceDictionaries, NSError *error))block {
    NSParameterAssert(query);
    
    NSDictionary *params = @{ @"q" : query };
    // http://setonia.com/V1/movies.php?q={QUERY}&limit={number of results you want to see}
    
    //[[LDTSetoniaAPIClient sharedClient] setParameterEncoding:AFJSONParameterEncoding];
    [[LDTSetoniaAPIClient sharedClient] getPath:@"/V1/movies.php"
                                    parameters:params
                                       success:^(AFHTTPRequestOperation *operation, id responseData){
                                             
                                           NSArray *results = nil;
                                           NSError *jsonConversionError = nil;
                                           
                                           if (![responseData isKindOfClass:[NSArray class]]) {
                                               results = [NSJSONSerialization JSONObjectWithData:responseData
                                                                                         options:0
                                                                                           error:&jsonConversionError];
                                           } else {
                                               results = (NSArray *)responseData;
                                           }

                                           if (block) {
                                               block(results, jsonConversionError);
                                           }
                                           
                                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                           NSURL *url = [[operation request] URL];
                                           NSLog(@"fromQuery:error:%@ url:%@",
                                                 [error localizedDescription],
                                                 [url absoluteString]);
                                           if (block) {
                                               block([NSArray array], error);
                                           }
                                       }];
}


#pragma mark - Obtain Search Results


+ (void)loadSearchFromQuery:(NSString *)query withBlock:(void (^)(NSArray *serviceDictionaries, NSError *error))block {
    NSParameterAssert(query);
    
    NSDictionary *params = @{ @"q" : query };
    
    // http://setonia.com/V1/search.php?q=Browns
    
    // http://setonia.com/V1/search.php?q={QUERY}&limit={number of results you want to see}
    
    [[LDTSetoniaAPIClient sharedClient] getPath:@"/V1/search.php"
                                    parameters:params
                                        success:^(AFHTTPRequestOperation *operation, id responseData){
                                            
                                            NSArray *results = nil;
                                            NSError *jsonConversionError = nil;
                                            
                                            if (![responseData isKindOfClass:[NSArray class]]) {
                                                results = [NSJSONSerialization JSONObjectWithData:responseData
                                                                                          options:0
                                                                                            error:&jsonConversionError];
                                            } else {
                                                results = (NSArray *)responseData;
                                            }
                                            
                                            if (block) {
                                                block(results, jsonConversionError);
                                            }
                                            
                                        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                            NSURL *url = [[operation request] URL];
                                            NSLog(@"fromQuery:error:%@ url:%@",
                                                  [error localizedDescription],
                                                  [url absoluteString]);
                                            if (block) {
                                                block([NSArray array], error);
                                            }
                                        }];
}


#pragma mark - Obtain Sports Results


+ (void)loadSportsFromQuery:(NSString *)query withBlock:(void (^)(NSArray *serviceDictionaries, NSError *error))block {
    NSParameterAssert(query);
    
    NSDictionary *params = @{ @"q" : query };
    
    // http://setonia.com/V1/sports.php?q={QUERY}&limit={number of results you want to see} 
    
    [[LDTSetoniaAPIClient sharedClient] getPath:@"/V1/sports.php"
                                    parameters:params
                                        success:^(AFHTTPRequestOperation *operation, id responseData){
                                            
                                            NSArray *results = nil;
                                            NSError *jsonConversionError = nil;
                                            
                                            if (![responseData isKindOfClass:[NSArray class]]) {
                                                results = [NSJSONSerialization JSONObjectWithData:responseData
                                                                                          options:0
                                                                                            error:&jsonConversionError];
                                            } else {
                                                results = (NSArray *)responseData;
                                            }
                                            
                                            if (block) {
                                                block(results, jsonConversionError);
                                            }
                                            
                                        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                            NSURL *url = [[operation request] URL];
                                            NSLog(@"fromQuery:error:%@ url:%@",
                                                  [error localizedDescription],
                                                  [url absoluteString]);
                                            if (block) {
                                                block([NSArray array], error);
                                            }
                                        }];
}


#pragma mark - Util

/**
 This overrides AFNetworking's `AFHTTPClient` so that we can accept `text/html`.
 
 @discussion AFNetworking expects a response with a mime type of application/json when registerHTTPOperationClass is used to register `AFJSONRequestOperation`. When the received response's type is not in acceptableContentTypes AFNetworking will fail the request.
 */
//- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
//                                      path:(NSString *)path
//                                parameters:(NSDictionary *)parameters {
//    NSParameterAssert(method);
//    NSParameterAssert(path);
//        
//    [super setParameterEncoding:AFJSONParameterEncoding];
//    NSMutableURLRequest *request = [super requestWithMethod:method path:path parameters:parameters];
//    //[request LDTSetoniaPrepForIrregularHTMLReturnType];
//	return request;
//}


#pragma mark - Product Image


- (UIImageView *)imageViewWithURL:(NSURL *)url {
    NSParameterAssert(url);
    UIImageView *iv = [[UIImageView alloc] init];
    if (url) {
        //[iv setImageWithURL:url];
        [iv setImageWithURL:url
           placeholderImage:[UIImage imageNamed:@"profile-image-placeholder"]];
    }
    return iv;
}


@end
