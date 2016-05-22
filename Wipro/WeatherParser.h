//
//  WeatherParser.h
//  Wipro
//
//  Created by Michael Bellerby on 18/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherParser : NSObject

- (NSArray *) parseWeatherDictionary:(NSDictionary*) weatherDictionary;

@end
