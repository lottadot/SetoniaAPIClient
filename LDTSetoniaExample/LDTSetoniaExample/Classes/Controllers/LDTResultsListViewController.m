//
//  LDTResultsListViewController.m
//  LDTSetoniaExample
//
//  Created by Shane Zatezalo on 3/4/13.
//  Copyright (c) 2013 Lottadot LLC. All rights reserved.
//

#import "LDTResultsListViewController.h"
#import "Product.h"
#import "LDTSetoniaDataManager.h"
#import "LDTProductDetailViewController.h"

@interface LDTResultsListViewController ()
@property (nonatomic, strong) LDTProductDetailViewController *detailViewController;
@end

@implementation LDTResultsListViewController


#pragma mark - Initialization


- (id)initWithResults:(NSArray *)results {
    self = [super init];
    if (self) {
        _results = results;
    }
    return self;
}


#pragma mark - View Lifecycle


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_tableView reloadData];
}


#pragma mark - UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_results count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    [self configureCell:cell forRowAtIndexPath:indexPath];
    return cell;
}


#pragma mark - UITableView Delegate protocol


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Product *product = (Product *)[_results objectAtIndex:indexPath.row];
    if (nil == _detailViewController) {
        _detailViewController = [[LDTProductDetailViewController alloc] initWithProduct:product];
    } else {
        [_detailViewController setProduct:product];
    }
    [self.navigationController pushViewController:_detailViewController animated:YES];
}


- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    Product *product = (Product *)[_results objectAtIndex:indexPath.row];
    cell.textLabel.text = [product title];
    cell.detailTextLabel.text = [product title];
    cell.backgroundColor = [UIColor yellowColor];
    cell.detailTextLabel.textColor = [UIColor redColor];
}


@end
