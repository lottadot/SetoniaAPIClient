//
//  LDTProductDetailViewController.h
//  LDTSetoniaExample
//
//  Created by Shane Zatezalo on 3/9/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Product;

@interface LDTProductDetailViewController : UIViewController
@property (strong, nonatomic) Product *product;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *productFeaturesLabel;
@property (weak, nonatomic) IBOutlet UIButton *viewOnWebButton;

- (IBAction)viewOnWebButtonTapped:(id)sender;

- (id)initWithProduct:(Product *)product;

@end
