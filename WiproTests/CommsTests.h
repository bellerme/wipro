//
//  Comms.h
//  

#import <Foundation/Foundation.h>

@interface Comms : NSObject

+ (nonnull instancetype) defaultInstance;
- (void) fetchWeatherWithCompletionHandler:(void(^ _Nullable)(NSMutableDictionary* _Nullable dict, NSError* _Nullable error)) comp;
- (void) requestWithURL:(nonnull NSString*)url completion:(void(^ _Nullable)(NSMutableDictionary* _Nullable dict, NSError* _Nullable error)) comp;
- (void) sendAsynchronousRequest:(nonnull NSMutableURLRequest*) request
                      completion:(void(^ _Nullable)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)) comp;

@end
