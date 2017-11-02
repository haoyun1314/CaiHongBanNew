//
//  AppStartModel.h
//  bumeng
//
//  Created by cashyoon on 15/3/31.
//  Copyright (c) 2015年 GUWH. All rights reserved.
//



#import "AppModel.h"

@interface AppStartModel : AppModel

/*
 类功能:将用户的信息保存到NSUserDefaults中，
 */
// 广告
@property (nonatomic, copy) NSString*frontPage;
@property (nonatomic, copy) NSString*frontPageUrl;
@property (nonatomic, copy)NSString *Id;
@property (nonatomic, copy)NSString * type;

+(instancetype)defaultManager;
+ (AppStartModel *)sharedInstance;


@end
