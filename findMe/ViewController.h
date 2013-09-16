//
//  ViewController.h
//  findMe
//
//  Created by Ramil Garaev on 12.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *loginTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
- (IBAction)enterButton:(id)sender;

@property MKPointAnnotation *pinPoint;
@property CLLocationCoordinate2D coordPin;

- (IBAction)authVkButton:(id)sender;


@end
