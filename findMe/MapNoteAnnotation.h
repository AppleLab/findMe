//
//  MapNoteAnnotation.h
//  findMe
//
//  Created by user on 17.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapNoteAnnotation : NSObject <MKAnnotation>

@property CLLocationCoordinate2D location;
@property (strong, atomic) NSString* title;
@property (strong, atomic) NSString* subtitle;

- (id)initWithLocation: (CLLocationCoordinate2D) l;
- (id) initWithDictionary: (NSDictionary*)dict;
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate;
- (MKMapItem*)mapItem;

@end