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
@property (weak, nonatomic) IBOutlet UITextField *marksTextfield;
@property (weak, nonatomic) IBOutlet UITextView *describeTextField;

- (IBAction)authVkButton:(id)sender;


@end
