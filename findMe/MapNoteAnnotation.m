//
//  MapNoteAnnotation.m
//  findMe
//
//  Created by user on 17.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "MapNoteAnnotation.h"

@implementation MapNoteAnnotation

@synthesize title = _title;
@synthesize subtitle = _subtitle;

- (id)initWithLocation: (CLLocationCoordinate2D) l
{
    self = [super init];
    if (self) {
        self.location = l;
        self.title = @"Your Location";
        self.subtitle = @"Was once your location";
    }
    return self;
}

-(id) initWithDictionary: (NSDictionary*)dict {
    self = [super init];
    if(self) {
        CLLocationCoordinate2D the_location;
        the_location.latitude = [dict[@"latitude"] doubleValue];
        the_location.longitude = [dict[@"longitude"] doubleValue];
        self.location = the_location;
        self.title = dict[@"title"];
        self.subtitle = dict[@"subtitle"];
    }
    return self;
}

- (CLLocationCoordinate2D)coordinate;
{
    return self.location;
}

- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate
{
    self.location = newCoordinate;
}

- (MKMapItem*)mapItem {
    NSDictionary *addressDict = @{};
    
    MKPlacemark *placemark = [[MKPlacemark alloc]
                              initWithCoordinate:self.coordinate
                              addressDictionary:addressDict];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = self.title;
    
    return mapItem;
}

@end

