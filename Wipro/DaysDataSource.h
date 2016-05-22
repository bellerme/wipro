//
//  DaysDataSource.h
//  Wipro
//
//  Created by Michael Bellerby on 21/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const kCellIdentifier = @"weatherCell";

@interface DaysDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray *weatherObjects;

- (UIViewController *)viewControllerForIndexPath:(NSIndexPath *)indexPath;

@end
