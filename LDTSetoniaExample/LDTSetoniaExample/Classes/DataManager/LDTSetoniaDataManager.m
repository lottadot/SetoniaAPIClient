//
//  LDTSetoniaDataManager.m
//  LDTSetoniaExample
//
//  Created by Shane Zatezalo on 3/4/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import "LDTSetoniaDataManager.h"

@implementation LDTSetoniaDataManager


+ (LDTSetoniaDataManager *)sharedClient {
    static LDTSetoniaDataManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LDTSetoniaDataManager alloc] init];
    });
    
    return _sharedClient;
}


@end
