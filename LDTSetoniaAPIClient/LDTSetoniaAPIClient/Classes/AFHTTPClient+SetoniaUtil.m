//
//  AFHTTPClient+SetoniaUtil.m
//  LDTSetoniaAPIClient
//
//  Created by Shane Zatezalo on 3/9/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import "AFHTTPClient+SetoniaUtil.h"
#import "AFHTTPClient.h"

@implementation AFHTTPClient (SetoniaUtil)

// Clang will complain that this is a method within a category on a class that's a subclass. Left in for posterity.
//- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
//                                      path:(NSString *)path
//                                parameters:(NSDictionary *)parameters {
//    NSMutableURLRequest *request = [super requestWithMethod:method path:path
//                                                 parameters:parameters];
//    
//    [request setValue: @"text/xml" forHTTPHeaderField:@"Content-Type"];
//    [request setValue:@"text/xml" forHTTPHeaderField:@"Accept"];
//    
//	return request;
//}



@end
