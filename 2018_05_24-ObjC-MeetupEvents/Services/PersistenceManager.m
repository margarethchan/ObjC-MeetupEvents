//
//  PersistenceManager.m
//  2018_05_24-ObjC-MeetupEvents
//
//  Created by C4Q on 5/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersistenceManager.h"

@interface PersistenceManager ()

@property (strong, nonatomic) NSMutableArray *savedEvents;

@end

@implementation PersistenceManager

+ (instancetype)sharedManager {
    static PersistenceManager *persistenceManager;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        persistenceManager = [[PersistenceManager alloc] init];
    });
    return persistenceManager;
}


-(NSString *)documentsPath {
NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
NSString *documentsDirectory = paths.firstObject;
NSString *filename = @"filename.plist";
NSString *path = [documentsDirectory stringByAppendingPathComponent:filename];
    return path;
}

-(NSArray *)readEvents {
    NSArray <Event *> *events = [NSKeyedUnarchiver unarchiveObjectWithFile: [self documentsPath]];
    if(!events)
        NSLog(@"failed to unarchive events");
    return events;
}

-(void)saveEvent:(Event *)event {
    if (_savedEvents) {
        [self.savedEvents addObject:event];
    } else {
        _savedEvents = [NSMutableArray new];
    }
    
    BOOL archived = [NSKeyedArchiver archiveRootObject:self.savedEvents toFile: [self documentsPath]];
    if (!archived) {
        NSLog(@"failed to archive");
    } else {
        NSLog(@"events saved to documents path: %@", [self documentsPath]);
    }
}



@end
