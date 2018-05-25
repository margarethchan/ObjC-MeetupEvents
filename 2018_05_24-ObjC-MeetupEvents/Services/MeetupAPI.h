//
//  MeetupAPI.h
//  2018_05_24-ObjC-MeetupEvents
//
//  Created by C4Q on 5/24/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

#import "Event.h"

@interface MeetupAPI: NSObject
    
    // [MeetupAPI searchEventWithKeyword:]
+ (void)searchEventWithKeyword:(NSString *)keyword completionHandler:(void(^)(NSError *error, NSArray <Event *> *events))completion;
    
    @end
