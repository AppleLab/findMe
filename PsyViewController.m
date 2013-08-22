//
//  PsyViewController.m
//  findMe
//
//  Created by user on 22.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "PsyViewController.h"

@interface PsyViewController ()

@end

@implementation PsyViewController

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
	
    NSArray *im = @[@"win_1.png", @"win_2.png", @"win_3.png", @"win_4.png",
                    @"win_5.png", @"win_6.png", @"win_7.png", @"win_8.png",
                    @"win_9.png", @"win_10.png", @"win_11.png", @"win_12.png",
                    @"win_13.png", @"win_14.png", @"win_15.png", @"win_16.png"];
    
    
    NSMutableArray *imarr = [[NSMutableArray alloc] init];
    for (int i = 0; i < im.count; i++) {
        [imarr addObject:[UIImage imageNamed:[im objectAtIndex:i]]];
    }
    
        UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(115, 230, 96, 203)];
        animationImageView.animationImages = imarr;
        animationImageView.animationDuration = 0.8;
        
        [self.view addSubview:animationImageView];
        [animationImageView startAnimating];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
