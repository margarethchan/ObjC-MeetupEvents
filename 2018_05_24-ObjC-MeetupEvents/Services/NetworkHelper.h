//
//  NetworkHelper.h
//  2018_05_24-ObjC-MeetupEvents
//
//  Created by C4Q on 5/24/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

@interface NetworkHelper: NSObject
    
    // class method is denoted by a + symbol
+ (instancetype)sharedManager;
    
    // instance method is denoted by a - symbol
- (void)performRequestWithRequest:(NSURLRequest *)request completionHandler:(void(^)(NSError *error, NSData *data))completion;
    
    @end
