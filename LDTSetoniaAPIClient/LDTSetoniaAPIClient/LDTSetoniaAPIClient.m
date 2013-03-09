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

#define kSetoniaAPIURL @"http://setonia.com/V1/"

@implementation LDTSetoniaAPIClient


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

    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	//[self setDefaultHeader:@"Accept" value:@"application/json"];
    [self setDefaultHeader:@"Accept" value:@"application/html"];
    [self setDefaultHeader:@"Accept-Charset" value:@"utf-8"];
    return self;
}


+ (void)loadMoviesFromQuery:(NSString *)query withBlock:(void (^)(NSArray *groups, NSError *error))block {
    NSParameterAssert(query);
    
    NSDictionary *params = @{ @"q" : query };
    // http://setonia.com/V1/movies.php?q={QUERY}&limit={number of results you want to see}
    
    [[LDTSetoniaAPIClient sharedClient] setParameterEncoding:AFJSONParameterEncoding];
    [[LDTSetoniaAPIClient sharedClient] getPath:@"/V1/movies.php"
                                    parameters:params
                                       success:^(AFHTTPRequestOperation *operation, id JSON){
                                           
                                           NSLog(@"JSON:%@", JSON);
                                           NSLog(@"JSON class:%@", [JSON class]);
                                           
                                           NSArray *results = nil;
                                           NSError *jsonConversionError = nil;
                                           
                                           if (![JSON isKindOfClass:[NSArray class]]) {
                                               results = [NSJSONSerialization JSONObjectWithData:JSON options:0 error:&jsonConversionError];
                                           } else {
                                               results = (NSArray *)JSON;
                                           }

                                           NSLog(@"results class:%@", [results class]);
                                           NSLog(@"fromQuery:results:%@", results);
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


+ (void)loadSearchFromQuery:(NSString *)query withBlock:(void (^)(NSArray *groups, NSError *error))block {
    NSParameterAssert(query);
    
    NSDictionary *params = @{ @"q" : query };
    
    // http://setonia.com/V1/search.php?q=Browns
    
    // http://setonia.com/V1/search.php?q={QUERY}&limit={number of results you want to see}
    
    [[LDTSetoniaAPIClient sharedClient] getPath:@"/V1/search.php"
                                    parameters:params
                                        success:^(AFHTTPRequestOperation *operation, id JSON){
                                            
                                            NSLog(@"JSON:%@", JSON);
                                            NSLog(@"JSON class:%@", [JSON class]);
                                            
                                            NSArray *results = nil;
                                            NSError *jsonConversionError = nil;
                                            
                                            if (![JSON isKindOfClass:[NSArray class]]) {
                                                results = [NSJSONSerialization JSONObjectWithData:JSON options:0 error:&jsonConversionError];
                                            } else {
                                                results = (NSArray *)JSON;
                                            }
                                            
                                            NSLog(@"results class:%@", [results class]);
                                            NSLog(@"fromQuery:results:%@", results);
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


+ (void)loadSportsFromQuery:(NSString *)query withBlock:(void (^)(NSArray *groups, NSError *error))block {
    NSParameterAssert(query);
    
    NSDictionary *params = @{ @"q" : query };
    
    // http://setonia.com/V1/sports.php?q={QUERY}&limit={number of results you want to see} 
    
    [[LDTSetoniaAPIClient sharedClient] getPath:@"/V1/sports.php"
                                    parameters:params
                                        success:^(AFHTTPRequestOperation *operation, id JSON){
                                            
                                            NSLog(@"JSON:%@", JSON);
                                            NSLog(@"JSON class:%@", [JSON class]);
                                            
                                            NSArray *results = nil;
                                            NSError *jsonConversionError = nil;
                                            
                                            if (![JSON isKindOfClass:[NSArray class]]) {
                                                results = [NSJSONSerialization JSONObjectWithData:JSON options:0 error:&jsonConversionError];
                                            } else {
                                                results = (NSArray *)JSON;
                                            }
                                            
                                            NSLog(@"results class:%@", [results class]);
                                            NSLog(@"fromQuery:results:%@", results);
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


- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      path:(NSString *)path
                                parameters:(NSDictionary *)parameters {
    NSParameterAssert(method);
    NSParameterAssert(path);
        
    [super setParameterEncoding:AFJSONParameterEncoding];
    NSMutableURLRequest *request = [super requestWithMethod:method path:path parameters:parameters];
    [request LDTSetoniaPrepForIrregularHTMLReturnType];
    NSLog(@"%@", [request allHTTPHeaderFields]);

	return request;
}


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
