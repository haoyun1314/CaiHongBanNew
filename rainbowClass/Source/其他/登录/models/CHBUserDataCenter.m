//
//  CHBUserDataCenter.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/18.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBUserDataCenter.h"

@implementation CHBUserDataCenter

+ (CHBUserDataCenter *)sharedInstance {
    static dispatch_once_t s_once;
    static id s_instance;
    dispatch_once(&s_once, ^{
        s_instance = [self new];
    });
    return s_instance;
}

#pragma mark -
- (BOOL)isLoggedIn
{
    NSString *uid = [CHBUserDataCenter sharedInstance].uid;
    
    if (uid && uid.length > 0)
    {
        return YES;
    }
    
    if([[CHBUserDataCenter sharedInstance].loginType intValue] > 0)
    {
        return YES;
    }
    
    return NO;
}

@end
