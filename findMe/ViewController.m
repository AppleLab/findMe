//
//  ViewController.m
//  findMe
//
//  Created by Ramil Garaev on 12.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
	// Do any additional setup after loading the view, typically from a nib.
   //
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
}

- (IBAction)authVkButton:(id)sender {
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"]){
        
        [self performSegueWithIdentifier:@"logIn" sender:self];
        
    }
    else{
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *yourViewController = [storyboard instantiateViewControllerWithIdentifier:@"webViewVK"];
        [self presentViewController:yourViewController animated:YES completion:nil];

        
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
        
        [self.loginTextfield resignFirstResponder];
        [self.passwordTextfield resignFirstResponder];
        [self.marksTextfield resignFirstResponder];
        [self.describeTextField resignFirstResponder];
        
    }

@end
