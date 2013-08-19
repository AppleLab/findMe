//
//  hideKeyboardViewController.h
//  findMe
//
//  Created by user on 19.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface hideKeyboardViewController : UIViewController {
    UITextField    *textField;
}
@property (nonatomic, strong) IBOutlet UITextField *textField;

@end