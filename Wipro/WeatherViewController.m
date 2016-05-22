//
//  WeatherViewController.m
//  Wipro
//
//  Created by Michael Bellerby on 18/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherCell.h"
#import "WeatherDataSource.h"

@interface WeatherViewController ()

@property (nonatomic, strong) WeatherDataSource *weatherDataSource;

@end

@implementation WeatherViewController

- (instancetype)initWithDataSource:(WeatherDataSource*) weatherDataSource
{
    self = [super init];
    if (self == nil) {
        return nil;
    }
    _weatherDataSource = weatherDataSource;
    self.tableView.dataSource = weatherDataSource;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[WeatherCell class] forCellReuseIdentifier:kWeatherCell];
}

@end
