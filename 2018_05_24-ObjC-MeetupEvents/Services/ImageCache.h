//
//  ImageCache.h
//  2018_05_24-ObjC-MeetupEvents
//
//  Created by C4Q on 5/24/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCache: NSObject
    
+ (id)sharedManager; // singleton
- (UIImage *)getImageForKey:(NSString *)key;
    
    @end
