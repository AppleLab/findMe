//
//  VKontakteViewController.h
//  findMe
//
//  Created by user on 17.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJSONDeserializer.h"
#import "APIDownload.h"

@interface VKontakteViewController : UIViewController <UIWebViewDelegate>
{
      UIStoryboard *Storyboard;
}

@property (nonatomic, retain) NSString *access_token;
@property (weak, nonatomic) IBOutlet UIWebView *web;

- (NSString*)stringBetweenString:(NSString*)start
                       andString:(NSString*)end
                     innerString:(NSString*)str;

@end
