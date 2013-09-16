//
//  CheckUsers.m
//  По следам
//
//  Created by user on 13.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "CheckUsers.h"

@implementation CheckUsers
+(BOOL *) checkLogin: (NSString *)login andPassword:(NSString *) password{
    BOOL *AuthenticationResult;
     //                                         Реализация через файл
    
    NSString *path = @"/File.strings";
    NSError *error;
    NSString *stringFromFileAtPath = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    AuthenticationResult = false;
    if (stringFromFileAtPath == nil){
        //Файл не найден
        NSLog (@"Error reading file %s", stringFromFileAtPath);
    }
    else{
        NSString *str = [NSString stringWithFormat:login, @" ", password];
        if([stringFromFileAtPath hasPrefix: str]){
            *AuthenticationResult = YES;
        }
    }
    return AuthenticationResult;
}
@end
