//
//  AddDescriptionController.h
//  findMe
//
//  Created by user on 22.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ADCDelegate

- (void)createPinWithTitle:(NSString *)pinTitle andWithSubtitle: (NSString *)pinSubtitle;

@end

@interface AddDescriptionController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *pinTitleField;
@property (weak, nonatomic) IBOutlet UITextView *pinSubtitleField;
@property (weak, nonatomic) IBOutlet UITextField *marksTextfield;
@property (weak, nonatomic) IBOutlet UITextView *describeTextField;
- (IBAction)getDirection:(id)sender;
@property id<ADCDelegate> delegate;
@end