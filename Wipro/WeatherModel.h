//
//  WeatherModel.h
//  Wipro
//
//  Created by Michael Bellerby on 18/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModel : NSObject

@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *weather;

- (instancetype) initWithTime:(NSString*) time description:(NSString*) description;

@end
