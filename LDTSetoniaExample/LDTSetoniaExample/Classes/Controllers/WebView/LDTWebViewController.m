//
//  LDTWebViewController.m
//  LDTSetoniaExample
//
//  Created by Shane Zatezalo on 3/9/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import "LDTWebViewController.h"

@interface LDTWebViewController ()

@end

@implementation LDTWebViewController


- (id)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated {
	_webView.delegate = self;	// setup the delegate as the web view is shown
    
    if (_url == nil && _content == nil) {
		_url = [NSURL URLWithString:@"http://lottadot.com/"];
		[_webView loadRequest:[NSURLRequest requestWithURL:_url]];
	} else if (_content != nil && self.content != nil) {
		[_webView loadHTMLString:self.content baseURL:_url];
	} else {
        NSLog(@"will load:%@", _url);
		[_webView loadRequest:[NSURLRequest requestWithURL:_url]];
	}
}


- (void)setUrl:(NSURL *)url {
    _url = [url copy];
}


#pragma mark - UIWebViewDelegate


- (void)webViewDidStartLoad:(UIWebView *)webView {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
	NSString* errorString = [NSString stringWithFormat:
							 @"<html><center><font size=+5 color='red'>An error occurred:<br>%@</font></center></html>",
							 error.localizedDescription];
	[_webView loadHTMLString:errorString baseURL:nil];
}


@end
