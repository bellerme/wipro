//
//  DaysDataSource.m
//  Wipro
//
//  Created by Michael Bellerby on 21/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import "DaysDataSource.h"
#import "DayModel.h"
#import "WeatherViewController.h"
#import "WeatherDataSource.h"

static NSInteger kNumberOfSections = 1;

@implementation DaysDataSource

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kNumberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _weatherObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    DayModel *day = _weatherObjects[indexPath.row];
    cell.textLabel.text = day.date;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate

- (UIViewController *)viewControllerForIndexPath:(NSIndexPath *)indexPath {
    DayModel *day = _weatherObjects[indexPath.row];
    WeatherDataSource *weatherDataSource = [[WeatherDataSource alloc] init];
    weatherDataSource.weatherList = day.weatherList;
    WeatherViewController *weatherViewController = [[WeatherViewController alloc] initWithDataSource:weatherDataSource];
    weatherViewController.title = day.date;
    weatherViewController.weatherList = day.weatherList;
    return weatherViewController;
}

@end
