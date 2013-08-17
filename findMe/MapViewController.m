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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    map = [[MKMapView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:map];
}

@end
