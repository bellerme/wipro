//
//  Comms.h
//  

#import <Foundation/Foundation.h>

@interface Comms : NSObject

+ (nonnull instancetype) defaultInstance;
- (void) fetchWeatherWithCompletionHandler:(void(^ _Nullable)(NSMutableDictionary* _Nullable dict, NSError* _Nullable error)) comp;

@end
