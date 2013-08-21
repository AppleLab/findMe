//
//  MapViewController.m
//  findMe
//
//  Created by user on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "MapViewController.h"
#import "MapTrackingAnnotation.h"
#import "MapNoteAnnotation.h"


@interface MapViewController ()

@end

@implementation MapViewController

@synthesize map;
@synthesize locationManager;
@synthesize coordinate;
@synthesize location;

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
    [map setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    coordinate = [self getLocation];
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
    locationManager.distanceFilter = 10;
    [locationManager startUpdatingLocation];
    //[self didToLocation:locationManager.location];
    
}


//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
//   
//  
//    NSLog(@"Location array %@",[locations lastObject]);
//
//   CLLocation *currentLocation = [locations lastObject];
//////    userCoordinate.text = [NSString stringWithFormat:
//////                           @"latitude %+.6f,\n longitude %+.6f\n",
//////                           currentLocation.coordinate.latitude,
//////                           currentLocation.coordinate.longitude];
//////    [userCoordinate sizeToFit];
//    
//    MapTrackingAnnotation* pin = [[MapTrackingAnnotation alloc] initWithLocation:currentLocation.coordinate];
//    [self.map addAnnotation:pin];
//
//    
//    
//
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
}
-(CLLocationCoordinate2D) getLocation{
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    [locationManager startUpdatingLocation];
    location = [locationManager location];
    coordinate = [location coordinate];
    
    return coordinate;
}

-(void) coordinatesForNORMMyLocation{
    
    coordinate = [self getLocation];
    MKCoordinateRegion mylocation = { {0.0, 0.0} , {0.0, 0.0} };
    mylocation.center.latitude = coordinate.latitude;
    mylocation.center.longitude = coordinate.longitude;
    mylocation.span.longitudeDelta = 0.02f;
    mylocation.span.latitudeDelta = 0.02f;
    [map setRegion:mylocation animated:YES];

}

- (IBAction)location:(id)sender {
    
    [self coordinatesForNORMMyLocation];

    }

- (IBAction)pinpin:(id)sender {
  
    [self coordinatesForNORMMyLocation];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.map addAnnotation:point];
}


@end
