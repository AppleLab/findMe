//
//  MapViewController.h
//  findMe
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface MapViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate> {
    MKMapView *mkMapView;
    CLLocationManager *locationManager;
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;

}
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property CLLocationCoordinate2D coordinate;
@property(readonly, nonatomic) CLLocation *location;
- (IBAction)location:(id)sender;
- (IBAction)pinpin:(id)sender;
-(void) coordinatesForNORMMyLocation;

@end

