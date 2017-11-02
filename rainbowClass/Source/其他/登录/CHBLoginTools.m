//
//  CHBLoginTools.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/18.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBLoginTools.h"

@implementation CHBLoginTools

+ (BOOL)validForUserName:(NSString *)userName
{
    userName = [userName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (userName.length < 3) {
        return NO;
    }
    
    if (userName.length >15) {
        return NO;
    }
    
    return YES;
}

+ (BOOL)validForUserPwd:(NSString *)userPwd
{
    if (userPwd.length<6) {
        return NO;
    }
    
    // 纯数字
    NSString *numRegular=@"^[0-9]+$";
    NSPredicate *numPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",numRegular];
    BOOL ret = [numPredicate evaluateWithObject:userPwd];
    
    if (ret) {
        return NO;
    }
    
    // 纯字母
    NSString *strRegular=@"^[A-Za-z]+$";
    NSPredicate *strPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",strRegular];
    ret = [strPredicate evaluateWithObject:userPwd];
    
    if (ret) {
        return NO;
    }
    
    // 字母和数字组合
    NSString *regular=@"^[A-Za-z0-9]+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regular];
    ret = [predicate evaluateWithObject:userPwd];
    
    if (ret) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)validForMobile:(NSString *)mobile
{
    if (mobile.length != 11) {
        return NO;
    }
    
    if (mobile.length > 0 && ![[mobile substringToIndex:1] isEqualToString:@"1"]) {
        return NO;
    }
    
    return YES;
}

@end
