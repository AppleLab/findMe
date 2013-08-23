//
//  MiniatureViewController.m
//  findMe
//
//  Created by user on 22.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "MiniatureViewController.h"

@interface MiniatureViewController ()

@end

@implementation MiniatureViewController

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
	
    NSArray *im = @[@"1.png", @"2.png", @"3.png", @"4.png",
                    @"5.png", @"6.png", @"7.png", @"8.png",
                    @"9.png", @"10.png", @"11.png", @"12.png",
                    @"13.png", @"14.png", @"15.png", @"16.png",
                    @"17.png", @"18.png", @"19.png", @"19.png",
                    @"19.png", @"19.png", @"19.png", @"19.png",
                    @"19.png", @"19.png", @"19.png", @"19.png",
                    @"19.png", @"19.png", @"19.png", @"19.png",
                    @"19.png", @"19.png", @"19.png", @"19.png" ];

    
    
    NSMutableArray *imarr = [[NSMutableArray alloc] init];
    for (int i = 0; i < im.count; i++) {
        [imarr addObject:[UIImage imageNamed:[im objectAtIndex:i]]];
    }
    
    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(-15, 105, 340, 220)];
    animationImageView.animationImages = imarr;
    animationImageView.animationDuration = 3.2;
    animationImageView.animationRepeatCount = 1;
    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
    [self performSelector:@selector(gotoStartPage) withObject:nil afterDelay:3.3];
}

-(void) gotoStartPage
{
    [self performSegueWithIdentifier:@"gotoStartPage" sender:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
