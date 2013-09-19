//
//  CheckUsers.h
//  По следам
//
//  Created by user on 13.09.13.
//  Copyright (c) 2013 Ramil Garaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckUsers : NSObject
+(BOOL) checkLogin: (NSString *)login andPassword:(NSString *) password;

@end
