//
//  MapViewController.m
//  findMe
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "MapViewController.h"
#import "MapTrackingAnnotation.h"


@interface MapViewController ()

@end

@implementation MapViewController

@synthesize map;
@synthesize locationManager;

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.map = nil;
    self.locationManager = nil;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    map.showsUserLocation = YES;
    map.userInteractionEnabled = YES;
    map.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    map.delegate = self;


    [map setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    CLLocationCoordinate2D coordinate = [self getLocation];
    MKCoordinateRegion mylocation = { {0.0, 0.0} , {0.0, 0.0} };
    mylocation.center.latitude = coordinate.latitude;
    mylocation.center.longitude = coordinate.longitude;
    mylocation.span.longitudeDelta = 0.02f;
    mylocation.span.latitudeDelta = 0.02f;
    [map setRegion:mylocation animated:YES];

   
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 0.2;
    locationManager.headingFilter = 5;
    [locationManager startUpdatingHeading];
    [locationManager startUpdatingLocation];
    //[self didToLocation:locationManager.location];
    
    
    
    

self.map.userTrackingMode = MKUserTrackingModeFollowWithHeading;
map.delegate = self;

    
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
  
    NSLog(@"Location array %@",[locations lastObject]);
    
   CLLocation *currentLocation = [locations lastObject];
//    userCoordinate.text = [NSString stringWithFormat:
//                           @"latitude %+.6f,\n longitude %+.6f\n",
//                           currentLocation.coordinate.latitude,
//                           currentLocation.coordinate.longitude];
//    [userCoordinate sizeToFit];
    
//    MapTrackingAnnotation* pin = [[MapTrackingAnnotation alloc] initWithLocation:currentLocation.coordinate];
//    [self.map addAnnotation:pin];

    MKCircle *circle = [MKCircle circleWithCenterCoordinate:currentLocation.coordinate radius:9];
    [self.map addOverlay:circle];
    

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
}
-(CLLocationCoordinate2D) getLocation{
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
//    locationManager.delegate = self;
//    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
//    locationManager.distanceFilter = kCLDistanceFilterNone;
//    [locationManager startUpdatingLocation];
    CLLocation *location = [locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    
    return coordinate;
}


-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id < MKOverlay>)overlay
{
    MKCircleView *circleView = [[MKCircleView alloc] initWithCircle:(MKCircle *)overlay];
    circleView.fillColor = [UIColor greenColor];
    circleView.alpha = 0.4;
    circleView.strokeColor = [UIColor greenColor];
    circleView.lineWidth = 1;
    
    return circleView;
}



- (IBAction)location:(id)sender {

    CLLocationCoordinate2D coordinate = [self getLocation];
    MKCoordinateRegion mylocation = { {0.0, 0.0} , {0.0, 0.0} };
    mylocation.center.latitude = coordinate.latitude;
    mylocation.center.longitude = coordinate.longitude;
    mylocation.span.longitudeDelta = 0.02f;
    mylocation.span.latitudeDelta = 0.02f;
    [map setRegion:mylocation animated:YES];
}
@end
