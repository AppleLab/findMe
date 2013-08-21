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
    map.userInteractionEnabled = YES;
    map.userTrackingMode = MKUserTrackingModeFollowWithHeading;
    map.delegate = self;


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
    locationManager.distanceFilter = 0.2;
    locationManager.headingFilter = 5;
   
    [locationManager startUpdatingHeading];
    [locationManager startUpdatingLocation];
    //[self didToLocation:locationManager.location];
    
    
    
    

self.map.userTrackingMode = MKUserTrackingModeFollowWithHeading;
map.delegate = self;

    
    // Задаются координаты для области поиска
    CLLocationCoordinate2D commuterLotCoords[4]={
        CLLocationCoordinate2DMake(41.0037,-104.0556),
        CLLocationCoordinate2DMake(44.9949,-104.0584),
        CLLocationCoordinate2DMake(44.9998,-111.0539),
        CLLocationCoordinate2DMake(41.0037,-104.0556)};
    
    //Вызывается прорисовка границ по координатам
    MKPolygon *commuterPoly1 = [MKPolygon polygonWithCoordinates:commuterLotCoords count:4];
    [self.map addOverlay:commuterPoly1];
    

    
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
  
    NSLog(@"Location array %@",[locations lastObject]);
    
   CLLocation *currentLocation = [locations lastObject];
////    userCoordinate.text = [NSString stringWithFormat:
////                           @"latitude %+.6f,\n longitude %+.6f\n",
////                           currentLocation.coordinate.latitude,
////                           currentLocation.coordinate.longitude];
////    [userCoordinate sizeToFit];
//    
//    MapTrackingAnnotation* pin = [[MapTrackingAnnotation alloc] initWithLocation:currentLocation.coordinate];
//    [self.map addAnnotation:pin];

    
    // прорисовка круга-трекера
    MKCircle *circle = [MKCircle circleWithCenterCoordinate:currentLocation.coordinate radius:9];
    [self.map addOverlay:circle];
    

}


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
    [map regionThatFits:mylocation];
   
}



-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id < MKOverlay> )overlay{
    if([overlay isKindOfClass:[MKPolygon class]]){
        MKPolygonView *view = [[[MKPolygonView alloc] initWithOverlay:overlay] init];
        view.lineWidth=20;
        view.strokeColor=[UIColor blueColor];
        view.fillColor=[[UIColor blueColor] colorWithAlphaComponent:0.5];
        return view;
    }
    MKCircleView *circleView = [[MKCircleView alloc] initWithCircle:(MKCircle *)overlay];
        circleView.fillColor = [UIColor greenColor];
        circleView.alpha = 0.4;
        circleView.strokeColor = [UIColor greenColor];
        circleView.lineWidth = 1;
    
        return circleView;
}


- (IBAction)location:(id)sender {
    
    [self coordinatesForNORMMyLocation];

    }

- (IBAction)pinpin:(id)sender {
   // MKUserLocation *userLocation;
   // CLLocation *userLocation = [location lastObject];
   //     MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([self getLocation], coordinate.latitude, coordinate.longitude);
    //[self.map setRegion:[self.map regionThatFits:region] animated:YES];
    
    [self coordinatesForNORMMyLocation];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coordinate;
    point.title = @"Where am I?";
    point.subtitle = @"I'm here!!!";
    
    [self.map addAnnotation:point];
}


@end
