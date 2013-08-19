//
//  hideKeyboardViewController.m
//  findMe
//
//  Created by user on 19.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "hideKeyboardViewController.h"
@implementation hideKeyboardViewController
@synthesize textField;
-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}
-(IBAction)backgroundTouched:(id)sender
{
    [textField resignFirstResponder];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
