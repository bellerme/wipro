//
//  AppDelegate.m
//  Wipro
//
//  Created by Michael Bellerby on 18/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import "AppDelegate.h"
#import "DaysViewController.h"
#import "Comms.h"
#import "WeatherParser.h"
#import "DaysDataSource.h"

@interface AppDelegate ()
@property (nonatomic, strong, nullable) DaysViewController *daysViewController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    __weak AppDelegate *weakSelf = self;
    [[Comms defaultInstance] fetchWeatherWithCompletionHandler:^(NSMutableDictionary *weatherDictionary, NSError *error) {
        NSArray *days = [[[WeatherParser alloc] init] parseWeatherDictionary:weatherDictionary];
        dispatch_async(dispatch_get_main_queue(), ^{
            AppDelegate *strongSelf = weakSelf;
            if (strongSelf != nil) {
                strongSelf.daysViewController.daysDataSource.weatherObjects = days;
                [strongSelf.daysViewController refresh];
            }
        });
    }];
    DaysDataSource *daysDataSource = [[DaysDataSource alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.daysViewController = [[DaysViewController alloc] initWithDataSource:daysDataSource];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.daysViewController];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
