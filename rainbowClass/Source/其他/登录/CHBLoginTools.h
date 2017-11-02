//
//  CHBLoginTools.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/18.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHBLoginTools : NSObject

// 验证用户名
+ (BOOL)validForUserName:(NSString *)userName;
// 验证密码
+ (BOOL)validForUserPwd:(NSString *)userPwd;
//
+ (BOOL)validForMobile:(NSString *)mobile;

@end
