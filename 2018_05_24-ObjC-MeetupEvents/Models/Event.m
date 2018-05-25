//
//  Event.m
//  2018_05_24-ObjC-MeetupEvents
//
//  Created by C4Q on 5/24/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"
#import "Constants.h"

// class extension
@interface Event ()
    // private properties and methods
    @end

@implementation Event
    
- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        // root level attributes
        if (dict[CREATED])
        _eventCreated = dict[CREATED];
        if (dict[ID])
        _eventId = dict[ID];
        if (dict[NAME])
        _eventName = dict[NAME];
        if (dict[RSVP_COUNT])
        _rsvpCount = [dict[RSVP_COUNT] integerValue];
        if (dict[LOCAL_DATE])
        _localDate = dict[LOCAL_DATE];
        if (dict[DESCRIPTION])
        _eventDescription = dict[DESCRIPTION];
        if (dict[FINDUS])
        _how_to_find_us = dict[FINDUS];
        
        
        // venue dictionary
        if (dict[VENUE]) {
            _venueDict = dict[VENUE];
            if (self.venueDict[ID])
            _venueId = self.venueDict[ID];
            if (self.venueDict[NAME])
            _venueName = self.venueDict[NAME];
            if (self.venueDict[LAT] && self.venueDict[LON]) {
                double lat = [self.venueDict[LAT] doubleValue];
                double lon = [self.venueDict[LON] doubleValue];
                _coordinate = CLLocationCoordinate2DMake(lat, lon);
            }
        }
        
        // group dictionary
        if (dict[GROUP]) {
            _groupDict = dict[GROUP];
            if (self.groupDict[CREATED])
            _groupCreated = self.groupDict[CREATED];
            if (self.groupDict[ID])
            _groupId = self.groupDict[ID];
            if (self.groupDict[URL_NAME])
            _groupURLName = self.groupDict[URL_NAME];
            if (self.groupDict[NAME])
            _groupName = self.groupDict[NAME];
            
            // photo dictionary
            if (self.groupDict[PHOTO]) {
                _photoDict = self.groupDict[PHOTO];
                if (self.photoDict[ID])
                _photoId = self.photoDict[ID];
                if (self.photoDict[HIGHEST_LINK])
                _highResLink = self.photoDict[HIGHEST_LINK];
            }
        }
    }
    return self;
}
    
    
    - (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
        [aCoder encodeObject:_eventCreated forKey:CREATED];
        [aCoder encodeObject:_eventId forKey:ID];
        [aCoder encodeObject:_eventName forKey:NAME];
        [aCoder encodeInteger:_rsvpCount forKey:RSVP_COUNT];
        [aCoder encodeObject:_eventDescription forKey:DESCRIPTION];
        [aCoder encodeObject:_how_to_find_us forKey:FINDUS];
    }
    
- (instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _eventCreated = [aDecoder decodeObjectForKey:CREATED];
        _eventId = [aDecoder decodeObjectForKey:ID];
        _eventName = [aDecoder decodeObjectForKey:NAME];
        _rsvpCount = [aDecoder decodeIntegerForKey:RSVP_COUNT];
        _eventDescription = [aDecoder decodeObjectForKey:DESCRIPTION];
        _how_to_find_us = [aDecoder decodeObjectForKey:FINDUS];
        
    }
    return self;
}
    
    
    
    @end
