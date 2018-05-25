//
//  EventDetailViewController.m
//  2018_05_24-ObjC-MeetupEvents
//
//  Created by C4Q on 5/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

#import "EventDetailViewController.h"
#import "Event.h"
#import "ImageCache.h"
#import "PersistenceManager.h"

@interface EventDetailViewController ()
//    @property (nonatomic) NSString *clean1str;
@property (nonatomic, weak) IBOutlet UIImageView *eventImage;
@property (nonatomic, weak) IBOutlet UILabel *eventName;
@property (nonatomic, weak) IBOutlet UILabel *groupName;
@property (nonatomic, weak) IBOutlet UILabel *eventDate;
@property (nonatomic, weak) IBOutlet UITextView *eventDescription;
@property (nonatomic, weak) IBOutlet UILabel *rsvpCount;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *favoriteEventButton;
@property (nonatomic) NSArray <Event *> *events;


@end

@implementation EventDetailViewController

-(instancetype)initWithEvent:(Event *)event {
    self = [super init];
    if (self) {
        _event = event;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViewWithEvent:self.event];
    [[self favoriteEventButton] initWithTitle:@"Favorite" style:UIBarButtonItemStylePlain target:self action:@selector(favoriteButtonClicked:)];
}

-(void)favoriteButtonClicked: (Event *)event {
    NSLog(@"Favorite button pressed");
    [PersistenceManager.sharedManager saveEvent:event];
}



- (void)configureViewWithEvent:(Event *)event {
    self.eventImage.image = [UIImage imageNamed:@"placeholder-image"];
    
    if (event.highResLink) {
        UIImage *image = [[ImageCache sharedManager] getImageForKey:event.highResLink];
        self.eventImage.image = image;
    }
    
    
    if (!event.eventName)
        self.eventName.text = @"No Name";
    else
        self.eventName.text = event.eventName;
    
    
    if (!event.groupName)
        self.groupName.text = @"No Name";
    else
        self.groupName.text = event.groupName;
    
    
    if (!event.localDate)
        self.eventDate.text = @"No Date";
    else
        self.eventDate.text = event.localDate;
    
    if (!event.description)
        self.eventDescription.text = @"No Description";
    else
        //        self.clean1str = [event.eventDescription stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
        //        self.eventDescription.text = [self.clean1str stringByReplacingOccurrencesOfString:@"<p>" withString:@" "];
//        self.eventDescription.text = [event.eventDescription stringByReplacingOccurrencesOfString:@"<p>" withString:@" "];
//    [self.event setValue:self.event.eventDescription forKey:@"contentToHTMLString"];
    [self.eventDescription setValue:self.event.eventDescription forKey:@"contentToHTMLString"];
    
    if (!event.rsvpCount)
        self.rsvpCount.text = @"No RSVP Info";
    else
        self.rsvpCount.text = [NSString stringWithFormat:@"RSVP YES: %ld", (long)event.rsvpCount];
    
    
    
    
}

@end
