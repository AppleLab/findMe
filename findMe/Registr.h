//
//  Registr.h
//  По следам
//
//  Created by user on 19.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Registr : NSObject
+(BOOL)checkLogin: (NSString *)login andPassword:(NSString *)password andEmail:(NSString *)email confirmPassword:(NSString *)confirmpassword;
    

@end
