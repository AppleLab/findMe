//
//  Registr.m
//  По следам
//
//  Created by user on 19.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import "Registr.h"

@implementation Registr
+(BOOL)checkLogin: (NSString *)login andPassword:(NSString *)password andEmail:(NSString *)email confirmPassword:(NSString *)confirmpassword{
    BOOL b = false;
    if([password isEqual: confirmpassword]){
        NSError *error = NULL;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9A-Za-z]*?"
                                                                               options:NSRegularExpressionCaseInsensitive
                                                                                 error:&error];
        NSUInteger numberOfMatches = [regex numberOfMatchesInString:login
                                                            options:0
                                                              range:NSMakeRange(0, [login length])];
            
        if(numberOfMatches>0){
            NSError *error = NULL;
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[0-9A-Za-z]*?"
                                                                                   options:NSRegularExpressionCaseInsensitive
                                                                                     error:&error];
            NSUInteger numberOfMatchespsw = [regex numberOfMatchesInString:password
                                                                options:0
                                                                  range:NSMakeRange(0, [password length])];
            if(numberOfMatchespsw>0){
                NSError *error = NULL;
                NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[-0-9A-Za-z]*?@[0-9A-Za-z]*?\\.[0-9A-Za-z]*?"
                                                                                       options:NSRegularExpressionCaseInsensitive
                                                                                         error:&error];
                NSUInteger numberOfMatchesemail = [regex numberOfMatchesInString:email
                                                                       options:0
                                                                         range:NSMakeRange(0, [email length])];
                if(numberOfMatchesemail>0){
                b=true;
                    return  b;
                }
                else{
                    return b;
                }
                
            }
            else{
                return b;
            }
            
        }
        else{
            return b;
        }
        
        
    }
    else{
        return b;
    }
    
}
@end
