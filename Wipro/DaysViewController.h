//
//  WeatherViewController.h
//  Wipro
//
//  Created by Michael Bellerby on 18/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DaysDataSource;
@interface DaysViewController : UITableViewController

@property (nonatomic, strong) DaysDataSource *daysDataSource;

- (instancetype)initWithDataSource:(DaysDataSource *) daysDataSource;
- (void) refresh;

@end
