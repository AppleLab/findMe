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
#import "AddDescriptionController.h"

@interface MapViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate,ADCDelegate,UITabBarControllerDelegate> {
    MKMapView *mkMapView;
    CLLocationManager *locationManager;
    CLLocationCoordinate2D coordinate;
    
}
@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property CLLocationCoordinate2D coordinate;
@property CLLocationCoordinate2D coordinateForPin;
@property(readonly, nonatomic) CLLocation *location;
- (IBAction)location:(id)sender;
- (IBAction)pinpin:(id)sender;
-(void) coordinatesForNORMMyLocation;

@end

