//
//  MapViewController.m
//  findMe
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize map;

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.map = nil;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    map.showsUserLocation = YES;
    [map setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    CLLocationCoordinate2D coordinate = [self getLocation];
    MKCoordinateRegion mylocation = { {0.0, 0.0} , {0.0, 0.0} };
    mylocation.center.latitude = coordinate.latitude;
    mylocation.center.longitude = coordinate.longitude;
    mylocation.span.longitudeDelta = 0.02f;
    mylocation.span.latitudeDelta = 0.02f;
    [map setRegion:mylocation animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    map = [[MKMapView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:map];
}
-(CLLocationCoordinate2D) getLocation{
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    CLLocation *location = [locationManager location];
    CLLocationCoordinate2D coordinate = [location coordinate];
    
    return coordinate;
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
