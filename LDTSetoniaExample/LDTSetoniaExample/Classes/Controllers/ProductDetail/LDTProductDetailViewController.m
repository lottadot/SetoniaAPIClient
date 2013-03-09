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

@interface LDTProductDetailViewController ()

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
}


- (void)updateViewForProduct:(Product *)product {
    if (product) {
        [_productTitleLabel setText:[_product title]];
        [_productFeaturesLabel setText:[_product features]];
        
        _productImageView = [[LDTSetoniaDataManager sharedClient] imageViewForProduct:_product];
    }
}


- (IBAction)viewOnWebButtonTapped:(id)sender {
    NSURL *url = [NSURL URLWithString:[_product uRL]];
    [[UIApplication sharedApplication] openURL:url];
}

@end
