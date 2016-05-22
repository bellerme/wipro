//
//  WeatherParserTests.m
//  Wipro
//
//  Created by Michael Bellerby on 21/05/2016.
//  Copyright © 2016 Michael Bellerby. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "WeatherParserTests.h"
#import "Constants.h"

@interface WeatherParserTests : XCTestCase

@property (nonatomic, strong) WeatherParser *parser;

@end

@implementation WeatherParserTests

- (void)setUp {
    [super setUp];
    self.parser = [[WeatherParser alloc] init];
}

- (void)tearDown {
    self.parser = nil;
    [super tearDown];
}

- (void)testDateParsing {
    NSArray *dateComponents = [self.parser dateComponentsFromDictionary:@{kDateText : @"2016-05-21 12:00:00"}];
    XCTAssert(dateComponents.count == 2, @"dateComponents count failed");
    XCTAssert([dateComponents[0] isEqualToString:@"2016-05-21"], @"Date string failed");
    XCTAssert([dateComponents[1] isEqualToString:@"12:00:00"], @"Time string failed");
}

- (void)testDescriptionParsing {
    NSString *description = [self.parser weatherDescriptionFromDictionary:@{kWeather : @[@{kdescription : @"broken clouds"}]}];
    XCTAssert([description isEqualToString:@"broken clouds"], @"description string failed");

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
