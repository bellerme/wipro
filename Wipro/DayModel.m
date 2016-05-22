//
//  DayModel.m
//  Wipro
//
//  Created by Michael Bellerby on 18/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import "DayModel.h"
#import "WeatherModel.h"

@implementation DayModel

- (instancetype) initWithDate:(NSString*) dateString {
    self = [super init];
    if (self == nil) {
        return nil;
    }
    _date = dateString;
    _weatherList = [NSMutableArray arrayWithCapacity:1];
    return self;
}

- (BOOL) addWeatherItem:(WeatherModel*) weatherItem {
    if (weatherItem == nil) {
        return NO;
    }
    [_weatherList addObject:weatherItem];
    return YES;
}

@end
