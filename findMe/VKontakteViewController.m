//
//  VKontakteViewController.m
//  findMe
//
//  Created by user on 17.08.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#define photoLink @"https://api.vk.com/method/photos.getAll?access_token=%@&count=100&offset=%i"
#define APIid @"Insert your APIid"

#import "VKontakteViewController.h"

@implementation VKontakteViewController

@synthesize web;
@synthesize access_token;

-(void) dealloc;
{
    self.web = nil;
    self.access_token = nil;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.web = nil;
}

- (NSString*)stringBetweenString:(NSString*)start
                       andString:(NSString*)end
                     innerString:(NSString*)str
{
    NSScanner* scanner = [NSScanner scannerWithString:str];
    [scanner setCharactersToBeSkipped:nil];
    [scanner scanUpToString:start intoString:NULL];
    if ([scanner scanString:start intoString:NULL]) {
        NSString* result = nil;
        if ([scanner scanUpToString:end intoString:&result]) {
            return result;
        }
    }
    return nil;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[self web] setDelegate:self];
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.access_token = [[NSUserDefaults standardUserDefaults] objectForKey:@"access_token"];
    
    if (!access_token) {
        NSString *authorizationLink = [NSString stringWithFormat:@"http://oauth.vk.com/authorize?client_id=3837709&scope=offline&redirect_uri=https://oauth.vk.com/blank.html&display=touch&response_type=token"];
        NSURL *url = [NSURL URLWithString:authorizationLink];
        web.hidden = NO;
        [web loadRequest:[NSURLRequest requestWithURL:url]];
    }
}


-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *recievedstring=[[[webView request] URL] absoluteString];
    self.access_token = [self stringBetweenString:@"access_token="
                                        andString:@"&"
                                      innerString:recievedstring];
    if (access_token) {
        [[NSUserDefaults standardUserDefaults] setObject:access_token forKey:@"access_token"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *yourViewController = [storyboard instantiateViewControllerWithIdentifier:@"NavigControl"];
        [self presentViewController:yourViewController animated:YES completion:nil];
    }
    else{
        NSString *error_reason=[self stringBetweenString:@"error_reason="
                                               andString:@"&"
                                             innerString:recievedstring];
        NSString *err=[self stringBetweenString:@"err="
                                      andString:@""
                                    innerString:recievedstring];
        
        if([error_reason isEqualToString:@"user_denied"]||[err isEqualToString:@"2"]){
            [[NSUserDefaults standardUserDefaults] setObject:access_token forKey:@"access_token"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            UIViewController *yourViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainView"];
            [self presentViewController:yourViewController animated:YES completion:nil];
        }
    }
}

@end



