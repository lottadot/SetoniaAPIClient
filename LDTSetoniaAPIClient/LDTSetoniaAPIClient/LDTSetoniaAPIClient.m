//
//  LDTSetoniaAPIClient.m
//  LDTSetoniaAPIClient
//
//  Created by Shane Zatezalo on 3/4/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import "LDTSetoniaAPIClient.h"
#import "LDTSetoniaHTTPClient.h"

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
    
    [[LDTSetoniaAPIClient sharedClient] getPath:@"/V1/movies.php"
                                    parameters:params
                                       success:^(AFHTTPRequestOperation *operation, id JSON){
                                           NSArray *response = (NSArray *)JSON;
                                           NSLog(@"response:%@", response);
                                           if (block) {
                                               block(response, nil);
                                           }
                                           
                                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                           NSURL *url = [[operation request] URL];
                                           NSLog(@"loadMoviesFromQuery:%@ url:%@",
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
                                           NSArray *response = (NSArray *)JSON;
                                           NSLog(@"response:%@", response);
                                           if (block) {
                                               block(response, nil);
                                           }
                                           
                                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                           NSURL *url = [[operation request] URL];
                                           NSLog(@"loadSearchFromQuery:%@ url:%@",
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
                                           NSArray *response = (NSArray *)JSON;
                                           NSLog(@"response:%@", response);
                                           if (block) {
                                               block(response, nil);
                                           }
                                           
                                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                           NSURL *url = [[operation request] URL];
                                           NSLog(@"loadSportsFromQuery:%@ url:%@",
                                                 [error localizedDescription],
                                                 [url absoluteString]);
                                           if (block) {
                                               block([NSArray array], error);
                                           }
                                       }];
}

@end
