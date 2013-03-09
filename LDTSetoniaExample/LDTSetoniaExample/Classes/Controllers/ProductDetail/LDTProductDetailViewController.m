//
//  LDTProductDetailViewController.m
//  LDTSetoniaExample
//
//  Created by Shane Zatezalo on 3/9/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import "LDTProductDetailViewController.h"
#import "Product.h"
#import "LDTSetoniaDataManager.h"
#import "LDTWebViewController.h"

@interface LDTProductDetailViewController ()

@property (nonatomic, strong) LDTWebViewController *webViewController;

- (void)setProduct:(Product *)product;
- (void)updateViewForProduct:(Product *)product;

@end

@implementation LDTProductDetailViewController


#pragma mark - Initialization


- (id)initWithProduct:(Product *)product {
    self = [super init];
    if (self) {
        _product = product;
    }
    return self;
}


#pragma mark - View Lifecycle


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)setProduct:(Product *)product {
    _product = product;
    [self updateViewForProduct:_product];
    [self.view setNeedsLayout];
}


- (void)updateViewForProduct:(Product *)product {
    if (product) {
        [_productTitleLabel setText:[_product title]];
        [_productFeaturesLabel setText:[_product features]];
        NSLog(@"product:%@", product);
//        _productImageView = [[LDTSetoniaDataManager sharedClient] imageViewForProduct:_product];
        UIImageView *iv = [[LDTSetoniaDataManager sharedClient] imageViewForProduct:_product];
        _productImageView.image = iv.image;
    }
}


- (IBAction)viewOnWebButtonTapped:(id)sender {
    NSURL *url = [NSURL URLWithString:[_product uRL]];
    if (nil != url) {
        if (nil == _webViewController) {
            _webViewController = [[LDTWebViewController alloc] initWithURL:url];
        }
        // [[UIApplication sharedApplication] openURL:url];
        [self.navigationController pushViewController:_webViewController animated:YES];
    }
}

@end
