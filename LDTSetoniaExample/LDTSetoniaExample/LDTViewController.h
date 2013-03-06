//
//  LDTViewController.h
//  LDTSetoniaExample
//
//  Created by Shane Zatezalo on 3/4/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LDTResultsListViewController, Product, LDTSetoniaDataManager;

@interface LDTViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@property (weak, nonatomic) IBOutlet UIButton *generalSearchButton;

@property (weak, nonatomic) IBOutlet UIButton *moviesSearchButton;

@property (weak, nonatomic) IBOutlet UIButton *sportsSearchButton;

- (IBAction)generalSearchButtonTapped:(id)sender;

- (IBAction)moviesSearchButtonTapped:(id)sender;

- (IBAction)sportsSearchButtonTapped:(id)sender;

@end
