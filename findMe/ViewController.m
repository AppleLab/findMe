//
//  ViewController.m
//  findMe
//
//  Created by Ramil Garaev on 12.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "ViewController.h"
#import "VKontakteViewController.h"
#import "MapViewController.h"
#import "CheckUsers.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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
        UIViewController *yourViewController = [storyboard instantiateViewControllerWithIdentifier:@"NavigControl"];
        [self presentViewController:yourViewController animated:YES completion:nil];

        
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
        
        [self.loginTextfield resignFirstResponder];
        [self.passwordTextfield resignFirstResponder];
    
    }
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MapViewController *viewMap = [segue destinationViewController];
    
    
}

- (IBAction)enterButton:(id)sender {
    BOOL AuthenticationResult = [CheckUsers checkLogin: self.loginTextfield.text andPassword:
                                 self.passwordTextfield.text];
    if ( AuthenticationResult == YES ){
        
    }
    else{
        
    }
}
@end
