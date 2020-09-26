//
//  RATItemsViewController.m
//  Homepwner
//
//  Created by Artem Rakhmatulin on 16/09/2020.
//  Copyright © 2020 Rakhmatulin Artem Timurovich IP. All rights reserved.
//

#import "RATPlacesViewController.h"
#import "RATPlace.h"
#import "RATPlaceStore.h"
#import "RATDetailViewController.h"

@interface RATPlacesViewController ()

@end

@implementation RATPlacesViewController

#pragma mark - Initializers
// New designated initializer
- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        self.navigationItem.title = @"Home Page";
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewPlace:)];
        self.navigationItem.rightBarButtonItem = bbi;
        self.navigationItem.leftBarButtonItem = self.editButtonItem;
    }
    return self;
} //init

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
} //initWithStyle:

#pragma mark - View life cycle
- (void)viewDidLoad
{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
} //viewDidLoad

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
} //viewWillAppear

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return RATPlaceStore.sharedStore.allPlaces.count;
} //tableView:numberOfRowsInSection:

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    NSArray *items = RATPlaceStore.sharedStore.allPlaces;
    RATPlace *item = items[indexPath.row];
    cell.textLabel.text = [item description];
    return cell;
} //tableView:cellForRowsAtIndexPath:

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        NSArray *allPlaces = RATPlaceStore.sharedStore.allPlaces;
        RATPlace *place = allPlaces[indexPath.row];
        [RATPlaceStore.sharedStore removePlace:place];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
} //tableView:commitEditingStyle:forRowAtIndexPath:

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [RATPlaceStore.sharedStore movePlaceAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
} //tableView:moveRowAtIndexPath:toIndexPath:

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RATDetailViewController *detailViewController = [[RATDetailViewController alloc] init];
    RATPlace *place = RATPlaceStore.sharedStore.allPlaces[indexPath.row];
    detailViewController.place = place;
    [self.navigationController pushViewController:detailViewController animated:YES];
} //tableView:dedSelectRowAtIndexPath:

#pragma mark - Actions
- (void)addNewPlace:(id)sender
{
    RATPlace *newPlace = [RATPlaceStore.sharedStore createPlace];
    NSInteger newRowIndex = [RATPlaceStore.sharedStore.allPlaces indexOfObject:newPlace];
    NSIndexPath *newRowIndexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[newRowIndexPath] withRowAnimation:UITableViewRowAnimationTop];
} //addNewPlace:

@end
