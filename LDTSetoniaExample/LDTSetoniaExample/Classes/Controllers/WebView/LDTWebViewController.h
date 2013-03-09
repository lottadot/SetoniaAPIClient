//
//  LDTWebViewController.h
//  LDTSetoniaExample
//
//  Created by Shane Zatezalo on 3/9/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDTWebViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, copy) NSString *content;

- (id)initWithURL:(NSURL *)url;

@end
