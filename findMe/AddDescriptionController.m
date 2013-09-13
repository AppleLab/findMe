//
//  AddDescriptionController.m
//  findMe
//
//  Created by user on 22.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "AddDescriptionController.h"

@interface AddDescriptionController ()

@end

@implementation AddDescriptionController
@synthesize delegate;
@synthesize pinTitleField;
@synthesize pinSubtitleField;


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

- (IBAction)getDirection:(id)sender {
    [delegate createPinWithTitle:pinTitleField.text andWithSubtitle:pinSubtitleField.text];
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.marksTextfield resignFirstResponder];
    [self.describeTextField resignFirstResponder];
}

@end