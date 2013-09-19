//
//  CheckUsers.m
//  По следам
//
//  Created by user on 13.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "CheckUsers.h"

@implementation CheckUsers
+(BOOL) checkLogin: (NSString *)login andPassword:(NSString *) password{
    BOOL AuthenticationResult;
     //                                         Реализация через файл
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"txt"];
    NSError *error = nil;
    NSString *stringFromFileAtPath = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    AuthenticationResult = false;
    if (stringFromFileAtPath == nil){
        //Файл не найден
        NSLog (@"Error reading file %@", stringFromFileAtPath);
    }
    else{
        /*NSString *str = [NSString stringWithFormat:login, @"|", password, @"|"];
        NSRange range = [stringFromFileAtPath rangeOfString:str];
        if (range.length > 0){
            AuthenticationResult = YES;
        }*/
        //NSString *str = [NSString stringWithFormat:login, @" ", password, @" "];
        NSArray *myWords = [stringFromFileAtPath componentsSeparatedByCharactersInSet:
                            [NSCharacterSet characterSetWithCharactersInString:@"|\n"]];
        int ind = 0;
        while (ind < [myWords count]){
            NSLog(@"%d", ind);
            NSLog(@"%@", login);
            NSLog(@"%@", myWords);
            if([login  isEqual: myWords[ind]]){
            //if (myWords[ind] == login){
                NSLog(@"%d", 4);
                if ([password isEqual: myWords[ind + 1] ]){
                   AuthenticationResult = YES;
                    break;
                }
            }
            else{
                NSLog(@"%d", 3);
            }
            ind = ind + 3;
            
        }
    }
    return AuthenticationResult;
}
@end
