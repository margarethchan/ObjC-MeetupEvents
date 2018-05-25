//
//  EventService.m
//  2018_05_24-ObjC-MeetupEvents
//
//  Created by C4Q on 5/24/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EventService.h"
#import "Event.h"

@implementation EventService
+ (NSArray *)fetchEvents {
    NSMutableArray <Event *> *events= [[NSMutableArray alloc] init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"events" ofType:@"json" inDirectory:nil];
    if (path) {
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSError *error;
        if (data) {
            NSArray *jsonObjects = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            if (error) {
                NSLog(@"serialization error: %@", error.localizedDescription);
            } else {
                for (NSDictionary *dict in jsonObjects) {
                    Event *event = [[Event alloc] initWithDict:dict];
                    [events addObject:event];
                }
            }
        } else {
            NSLog(@"data at file %@ is nil", path);
        }
    } else {
        NSLog(@"Path NOT FOUND");
    }
    return events;
}
    @end

