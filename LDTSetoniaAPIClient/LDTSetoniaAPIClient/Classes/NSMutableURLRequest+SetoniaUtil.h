//
//  NSMutableURLRequest+SetoniaUtil.h
//  LDTSetoniaAPIClient
//
//  Created by Shane Zatezalo on 3/9/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 A class category on `NSMutableURLRequest` used when building the AFNetworking HTTP Request to inject an irrecular accept text-html.
 
 This is required because Setonia returns JSON with text/html:
 
 HTTP/1.1 200 OK
 Server: cloudflare-nginx
 Date: Sat, 09 Mar 2013 13:30:35 GMT
 Content-Type: text/html; charset=UTF-8
 Connection: close
 X-Powered-By: PHP/5.3.20
 CF-RAY: 4c81ed04729041e
 Transfer-Encoding: Identity
 */
@interface NSMutableURLRequest (SetoniaUtil)

- (void)LDTSetoniaPrepForIrregularHTMLReturnType;

@end
