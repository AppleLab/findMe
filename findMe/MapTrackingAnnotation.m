//
//  MapTrackingAnotation.m
//  findMe
//
//  Created by User on 19.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "MapTrackingAnnotation.h"

@interface MapTrackingAnnotation ()

@end

@implementation MapTrackingAnnotation

- (id)initWithLocation: (CLLocationCoordinate2D) l
{
    self = [super init];
    if (self) {
        self.location = l;
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
