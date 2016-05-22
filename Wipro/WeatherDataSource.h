//
//  WeatherDataSource.h
//  Wipro
//
//  Created by Michael Bellerby on 21/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * _Nonnull const kWeatherCell = @"WeatherCell";

@class WeatherModel;
@interface WeatherDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong, nullable) NSArray<WeatherModel*> *weatherList;

@end
