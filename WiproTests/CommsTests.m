//
//  CommsTests.m
//  Wipro
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "CommsTests.h"
#import "Constants.h"

@interface CommsTests : XCTestCase

@property (nonatomic, strong) Comms *comms;

@end

@implementation CommsTests

- (void)setUp {
    [super setUp];
    self.comms = [[Comms alloc] init];
}

- (void)tearDown {
    self.comms = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFetchWeather {
    id partialMock = OCMPartialMock(self.comms);
    OCMStub([partialMock sendAsynchronousRequest:[OCMArg any] completion:([OCMArg invokeBlockWithArgs:[@"{\"list\":[{\"weather\":[{\"description\":\"light rain\"}],\"dt_txt\":\"2016-05-22 00:00:00\"}]}" dataUsingEncoding:NSUTF8StringEncoding], [NSNull null], [NSNull null], nil])]);
    [partialMock fetchWeatherWithCompletionHandler:^(NSMutableDictionary *dict, NSError *error) {
        XCTAssert(dict[kList] != nil, @"fetch weather dictionary failed");
    }];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
