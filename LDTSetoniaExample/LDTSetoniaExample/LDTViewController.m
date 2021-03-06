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


#pragma mark - View Lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"Search", @"Search")];
    [_searchTextField setText:@"Browns"];
    NSAssert(nil != self.navigationController, @"navigationController nil");
}


#pragma mark - Actions


- (IBAction)generalSearchButtonTapped:(id)sender {
    [self searchTextFieldShouldDisappear];
    [LDTSetoniaDataManager searchWithQuery:[_searchTextField text] withCompletion:^(NSArray *searchResults, NSError *error) {

        if (nil == error) {
            [self processResults:searchResults];
        } else {
            // TODO (szatezalo, 2013-03-09) UIAlert for error
            NSLog(@"searchWithQuery:Erro:%@", [error localizedDescription]);
        }
        
    } withProgress:^(NSString *progressInfo) {
        // TODO (szatezalo, 2013-03-09) Something GUI for progress here
    }];
}


- (IBAction)moviesSearchButtonTapped:(id)sender {
    [self searchTextFieldShouldDisappear];
    [LDTSetoniaDataManager moviesWithQuery:[_searchTextField text] withCompletion:^(NSArray *searchResults, NSError *error) {

        if (nil == error) {
            [self processResults:searchResults];
        } else {
            // TODO (szatezalo, 2013-03-09) UIAlert for error
            NSLog(@"searchWithQuery:Erro:%@", [error localizedDescription]);
        }
        
    } withProgress:^(NSString *progressInfo) {
        // TODO (szatezalo, 2013-03-09) Something GUI for progress here
    }];
}


- (IBAction)sportsSearchButtonTapped:(id)sender {
    [self searchTextFieldShouldDisappear];
    [LDTSetoniaDataManager sportsWithQuery:[_searchTextField text] withCompletion:^(NSArray *searchResults, NSError *error) {

        if (nil == error) {
            [self processResults:searchResults];
        } else {
            // TODO (szatezalo, 2013-03-09) UIAlert for error
            NSLog(@"searchWithQuery:Erro:%@", [error localizedDescription]);
        }
        
    } withProgress:^(NSString *progressInfo) {
        // TODO (szatezalo, 2013-03-09) Something GUI for progress here
    }];
}


- (void)processResults:(NSArray *)searchResults {
    
    bool haveResults = (nil != searchResults && [searchResults count]);
    if (haveResults) {
        LDTResultsListViewController *resultsVC = [[LDTResultsListViewController alloc] init];
        [resultsVC setResults:searchResults];
        [resultsVC setTitle:NSLocalizedString(@"Search Results", @"Search Results")];
        [self.navigationController pushViewController:resultsVC animated:YES];
    } else {
        // TODO (szatezalo, 2013-03-09) UIAlert for no results found.
        NSLog(@"NO RESULTS FOUND");
    }
}


- (IBAction)searchTextFieldTapped:(id)sender {
    
}


- (void)searchTextFieldShouldDisappear {
    [_searchTextField resignFirstResponder];
}


#pragma mark - Touches


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self searchTextFieldShouldDisappear];
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
    [self searchTextFieldShouldDisappear];
    return YES;
}


- (void)textFieldDidEndEditing:(UITextField *)textField {
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    // return NO to not change text
    return YES;
}


- (BOOL)textFieldShouldClear:(UITextField *)textField {
    // called when clear button pressed. return NO to ignore (no notifications)
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // called when 'return' key pressed. return NO to ignore.
    [self searchTextFieldShouldDisappear];
    return YES;
}


@end
