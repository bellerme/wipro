//
//  WeatherViewController.h
//  Wipro
//
//  Created by Michael Bellerby on 18/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeatherDataSource;
@interface WeatherViewController : UITableViewController

- (nonnull instancetype)initWithDataSource:(nonnull WeatherDataSource*) weatherDataSource;

@property (nonatomic, strong, nullable) NSArray *weatherList;

@end
