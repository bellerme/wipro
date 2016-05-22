//
//  Comms.m
//  

#import "Comms.h"

static Comms *_Instance;

@implementation Comms {
    NSArray *_cookies;
}

+ (instancetype) defaultInstance {
    if (_Instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _Instance = [[Comms alloc] init];
        });
    }
    return _Instance;
}

- (void) fetchWeatherWithCompletionHandler:(void(^)(NSMutableDictionary* dict, NSError* error)) comp {
    NSString *url = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast?q=London,uk&mode=json&appid=602aa61712f147882d7db776c7c673b5"];
    [self requestWithURL:url
              completion:^(NSMutableDictionary* dict, NSError *error)
     {
         if (comp != nil) {
             comp(dict, error);
         }
     }];
}


- (void) requestWithURL:(NSString*)url completion:(void(^)(NSMutableDictionary* dict, NSError* error)) comp
{
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self sendAsynchronousRequest:req completion:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        id obj = nil;
        if (data.length > 0) {
            obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        }
        if ([obj isKindOfClass:[NSDictionary class]]) {
            if (nil != comp) {
                comp(obj, error);
            }
        } else {
            NSLog(@"No Dictionary");
        }
    }];
}


- (void) sendAsynchronousRequest:(NSMutableURLRequest*) request
                      completion:(void(^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)) comp 
{
    if (_cookies) {
        NSEnumerator *enumerator = [_cookies objectEnumerator];
        NSHTTPCookie *cookie;
        
        while (cookie = [enumerator nextObject]) {
            [request addValue:[cookie value] forHTTPHeaderField:@"Cookies"];
        }
    }
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request 
                                                                 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) 
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        
        // Check the status code and respond appropriately.
        switch ([httpResponse statusCode]) {
            case 200: {
                // Got a response so extract any cookies.  The array will be empty if there are none.
                NSDictionary *theHeaders = [httpResponse allHeaderFields];
                NSArray      *theCookies = [NSHTTPCookie cookiesWithResponseHeaderFields:theHeaders forURL:[response URL]];
                
                // Save any cookies
                if ([theCookies count] > 0) {
                    _cookies = [theCookies copy];
                }
                if (comp != nil) {
                    comp(data, response, error);
                }
                break;
            }
            
            default:
                if (comp != nil) {
                    comp(nil, response, error);
                }
                break;
        }
    }];
    [task resume];
}


@end
