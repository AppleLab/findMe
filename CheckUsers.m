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
        NSArray *myWords = [stringFromFileAtPath componentsSeparatedByCharactersInSet:
                            [NSCharacterSet characterSetWithCharactersInString:@"|\n"]];
        int ind = 0;
        while (ind < [myWords count]){
            if([login  isEqual: myWords[ind]]){
                NSLog(@"%d", 4);
                if ([password isEqual: myWords[ind + 1] ]){
                   AuthenticationResult = YES;
                    break;
                }
            }
            ind = ind + 3;
            
        }
    }
    return AuthenticationResult;
}
@end
