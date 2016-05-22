//
//  WeatherViewController.m
//  Wipro
//
//  Created by Michael Bellerby on 18/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import "DaysViewController.h"
#import "DaysDataSource.h"

@implementation DaysViewController

- (instancetype)initWithDataSource:(DaysDataSource *) daysDataSource
{
    self = [super init];
    if (self == nil) {
        return nil;
    }
    _daysDataSource = daysDataSource;
    self.tableView.dataSource = daysDataSource;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
}

- (void) refresh {
    [self.tableView reloadData];
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Push the view controller.
    [self.navigationController pushViewController:[self.daysDataSource viewControllerForIndexPath:indexPath] animated:YES];
}

@end
