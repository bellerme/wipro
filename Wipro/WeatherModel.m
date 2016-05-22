//
//  WeatherModel.m
//  Wipro
//
//  Created by Michael Bellerby on 18/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import "WeatherModel.h"

@implementation WeatherModel

- (instancetype) initWithTime:(NSString*) time description:(NSString*) description {
    self = [super init];
    if (self == nil) {
        return nil;
    }
    _time = time;
    _weather = description;
    return self;
}

@end
