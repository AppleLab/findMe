//
//  Registruser.m
//  По следам
//
//  Created by user on 19.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "Registruser.h"
#import "Registr.h"

@interface Registruser ()

@end

@implementation Registruser


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
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.login resignFirstResponder];
    [self.password resignFirstResponder];
    [self.email resignFirstResponder];
    [self.confirmpassword resignFirstResponder];
    
}
- (IBAction)reg:(id)sender {
    NSString *email=self.email.text;
    NSString *login=self.login.text;
    NSString *password = self.password.text;
    NSString *confirmpassword =self.confirmpassword.text;
    BOOL b=[Registr  checkLogin: (NSString *)login andPassword:(NSString *)password andEmail:(NSString *)email confirmPassword:(NSString *)confirmpassword];
    UIStoryboard *strb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if(b == true){
        UIViewController *vc = [strb instantiateViewControllerWithIdentifier:@"MainView"];
        [self presentViewController:vc animated:YES completion:nil];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"users1" ofType:@"txt"];
        
        NSString *string =[NSString stringWithFormat:login, @"|",password, @"|", email];
        
        NSError *error;
        NSLog(@"%@", string);
        BOOL ok = [string writeToFile:path atomically:YES
                   
                             encoding:NSUnicodeStringEncoding error:&error];
        
        if (!ok) {
            
            
            
            NSLog(@"Error writing file at %@\n%@",
                  
                  path, [error localizedFailureReason]);
        }
    }
    else{
        UIViewController *vc = [strb instantiateViewControllerWithIdentifier:@"errorRegist"];
        
        [self presentViewController:vc animated:YES completion:nil];
    }
    
 }
@end
