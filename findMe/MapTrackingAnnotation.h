//
//  MapTrackingAnotation.h
//  findMe
//
//  Created by User on 19.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapTrackingAnnotation : NSObject <MKAnnotation>

@property CLLocationCoordinate2D location;
- (id)initWithLocation: (CLLocationCoordinate2D) l;
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;
- (MKMapItem*)mapItem;

@end
