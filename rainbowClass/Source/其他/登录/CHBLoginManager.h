//
//  CHBLoginManager.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/18.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^successBlock)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^failureBlock)(AFHTTPRequestOperation *operation, NSError *error);
@interface CHBLoginManager : NSObject



 
// 用户名/手机号+密码登录
+ (void)loginHome:(NSString *)ccwUserName ccwPwd:(NSString *)ccwPwd success:(successBlock)success fail:(failureBlock)failure;

+ (NSString *)pwdToMD5:(NSString *)pwd;



@end
