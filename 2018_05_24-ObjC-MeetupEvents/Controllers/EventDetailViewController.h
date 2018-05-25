//
//  EventDetailViewController.h
//  2018_05_24-ObjC-MeetupEvents
//
//  Created by C4Q on 5/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventDetailViewController : UIViewController

    @property (nonatomic) Event* event;
//    @property (strong, nonatomic) UIImage *eventImage;
//    @property (strong, nonatomic) UILabel *eventName;
//    @property (strong, nonatomic) UILabel *groupName;
//    @property (strong, nonatomic) UILabel *eventDate;
//    @property (strong, nonatomic) UILabel *eventDescription;
//    @property (strong, nonatomic) UILabel *rsvpCount;
    
    -(instancetype)initWithEvent: (Event*) event;
    
    - (void)configureViewWithEvent:(Event *)event;
    
@end
