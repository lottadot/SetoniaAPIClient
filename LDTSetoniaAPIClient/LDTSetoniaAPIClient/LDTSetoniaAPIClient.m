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
    
    self = [super init];
    if (!self) {
        _url = url;
        return nil;
    }

    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    [self setDefaultHeader:@"Accept-Charset" value:@"utf-8"];
    return self;
}


@end
