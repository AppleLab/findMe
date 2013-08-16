//
//  SearchTableViewController.h
//  findMe
//
//  Created by User on 16.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchTableViewController : UITableViewController{
    
    NSArray *people;
}

@property(nonatomic, retain) NSArray *people;
@end
