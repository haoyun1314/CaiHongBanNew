//
//  CHBUserDataCenter.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/18.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 类功能:将用户的信息保存到NSUserDefaults中，
 */
@interface CHBUserDataCenter : NSObject

@property (nonatomic, copy) NSString*uid;
@property (nonatomic, copy) NSString*username;
//
@property (nonatomic, copy) NSString *loginType; // 1--账号登录
@property (nonatomic, copy) NSString *loginName;
@property (nonatomic, copy) NSString *loginPwd;


+ (CHBUserDataCenter *)sharedInstance;
// 判读是否已登录
- (BOOL)isLoggedIn;


@end
