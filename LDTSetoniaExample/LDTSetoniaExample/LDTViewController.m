//
//  LDTViewController.m
//  LDTSetoniaExample
//
//  Created by Shane Zatezalo on 3/4/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import "LDTViewController.h"
#import "LDTSetoniaDataManager.h"
#import "LDTResultsListViewController.h"
#import "Product.h"

@interface LDTViewController ()

@end

@implementation LDTViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [_searchTextField setText:@"Browns"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)generalSearchButtonTapped:(id)sender {

    [LDTSetoniaDataManager searchWithQuery:[_searchTextField text]
                            withCompletion:^(NSArray *searchResults, NSError *error) {
                                NSLog(@"searchResults:%@ error:%@", searchResults, [error localizedDescription]);
        if (nil != error) {
            
            LDTResultsListViewController *resultsVC = [[LDTResultsListViewController alloc] init];
            [resultsVC setResults:searchResults];
            [resultsVC setTitle:@"Search Results"];
            [self.navigationController pushViewController:resultsVC animated:YES];
        } else {
            // TODO Error
        }
        
    } withProgress:^(NSString *progressInfo) {
        // TODO
    }];
}


- (IBAction)moviesSearchButtonTapped:(id)sender {

    [LDTSetoniaDataManager moviesWithQuery:[_searchTextField text]
                            withCompletion:^(NSArray *searchResults, NSError *error) {
                                NSLog(@"searchResults:%@ error:%@", searchResults, [error localizedDescription]);
                                if (nil != error) {
                                    
                                    LDTResultsListViewController *resultsVC = [[LDTResultsListViewController alloc] init];
                                    [resultsVC setResults:searchResults];
                                    [resultsVC setTitle:@"Movie Results"];
                                    [self.navigationController pushViewController:resultsVC animated:YES];
                                } else {
                                    // TODO Error
                                }
                                
                            } withProgress:^(NSString *progressInfo) {
                                // TODO
                            }];
    
}


- (IBAction)sportsSearchButtonTapped:(id)sender {

    [LDTSetoniaDataManager sportsWithQuery:[_searchTextField text]
                            withCompletion:^(NSArray *searchResults, NSError *error) {
                                NSLog(@"searchResults:%@ error:%@", searchResults, [error localizedDescription]);
        if (nil != error) {
            
            LDTResultsListViewController *resultsVC = [[LDTResultsListViewController alloc] init];
            [resultsVC setResults:searchResults];
            [resultsVC setTitle:@"Sports Results"];
            [self.navigationController pushViewController:resultsVC animated:YES];
            
        } else {
            // TODO Error
        }
        
    } withProgress:^(NSString *progressInfo) {
        //
    }];
}


- (IBAction)searchTextFieldTapped:(id)sender {
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
	// return NO to disallow editing.
	return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
	// became first responder
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
	// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
	return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
	// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	// return NO to not change text
	return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
	// called when clear button pressed. return NO to ignore (no notifications)
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	// called when 'return' key pressed. return NO to ignore.
	return YES;
}



@end
