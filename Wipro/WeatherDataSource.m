//
//  WeatherDataSource.m
//  Wipro
//
//  Created by Michael Bellerby on 21/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import "WeatherDataSource.h"
#import "WeatherModel.h"

static NSInteger kNumberOfSections = 1;

@implementation WeatherDataSource

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kNumberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _weatherList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kWeatherCell forIndexPath:indexPath];
    WeatherModel *weather = _weatherList[indexPath.row];
    cell.textLabel.text = weather.time;
    cell.detailTextLabel.text = weather.weather;
    return cell;
}

@end
