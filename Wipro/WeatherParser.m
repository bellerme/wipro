//
//  WeatherParser.m
//  Wipro
//
//  Created by Michael Bellerby on 18/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import "WeatherParser.h"
#import "DayModel.h"
#import "WeatherModel.h"
#import "Constants.h"

@implementation WeatherParser

- (NSArray *) parseWeatherDictionary:(NSDictionary*) weatherDictionary {
    NSMutableArray *daysList = [NSMutableArray array];
    DayModel *day = nil;
    NSArray *list = weatherDictionary[kList];
    for (NSDictionary *weatherItem in list) {
        NSArray *dateComponents = [self dateComponentsFromDictionary:weatherItem];
        NSString *date = [dateComponents firstObject];
        NSString *time = [dateComponents lastObject];
        NSString *weatherDescription = [self weatherDescriptionFromDictionary:weatherItem];
        if (day == nil || ![date isEqualToString:day.date]) {
            day = [[DayModel alloc] initWithDate:date];
            [daysList addObject:day];
        }
        [day addWeatherItem:[[WeatherModel alloc] initWithTime:time description:weatherDescription]];
    }
    return [daysList copy];
}

- (NSArray*) dateComponentsFromDictionary:(NSDictionary*) weatherItem {
    id dateObj = weatherItem[kDateText];
    if ([dateObj isKindOfClass:[NSString class]]) {
        NSString *dateText = dateObj;
        NSArray *dateComponents = [dateText componentsSeparatedByString:@" "];
        return dateComponents;
    }
    return nil;
}

- (NSString *) weatherDescriptionFromDictionary:(NSDictionary*) weatherItem {
    id weatherObj = weatherItem[kWeather];
    if ([weatherObj isKindOfClass:[NSArray class]]) {
        NSArray *weatherList = (NSArray*)weatherObj;
        id weatherDefinitionObj = [weatherList firstObject];
        if ([weatherDefinitionObj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *weatherDefinitionDict = (NSDictionary*) weatherDefinitionObj;
            id weatherDescriptionObj = weatherDefinitionDict[kdescription];
            if ([weatherDescriptionObj isKindOfClass:[NSString class]]) {
                return (NSString*) weatherDescriptionObj;
            }
        }
    }
    return nil;
}

@end
