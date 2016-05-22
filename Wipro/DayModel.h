//
//  DayModel.h
//  Wipro
//
//  Created by Michael Bellerby on 18/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherModel;
@interface DayModel : NSObject

@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong, readonly) NSMutableArray<WeatherModel*> *weatherList;

- (instancetype) initWithDate:(NSString*) dateString;
- (BOOL) addWeatherItem:(WeatherModel*) weatherItem;

@end
