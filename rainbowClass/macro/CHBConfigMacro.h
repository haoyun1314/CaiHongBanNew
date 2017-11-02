//
//  CHBConfigMacro.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#ifndef CHBConfigMacro_h
#define CHBConfigMacro_h

// 颜色值
// 主色
#define COLOR_MAIN [[UIColor alloc]initWithRed:0x15/255.f green:0x71/255.f blue:0xe5/255.f alpha:1]
// 辅助色
#define COLOR_MINOR [[UIColor alloc]initWithRed:0xf7/255.f green:0x41/255.f blue:0x1d/255.f alpha:1]
//深灰-字体
#define COLOR_GRAY_0 [[UIColor alloc]initWithRed:0x33/255.f green:0x33/255.f blue:0x33/255.f alpha:1]
// 中灰-字体
#define COLOR_GRAY_1 [[UIColor alloc]initWithRed:0x66/255.f green:0x66/255.f blue:0x66/255.f alpha:1]
// 浅灰-字体
#define COLOR_GRAY_2 [[UIColor alloc]initWithRed:0x99/255.f green:0x99/255.f blue:0x99/255.f alpha:1]
// 弱浅-灰导航栏底线
#define COLOR_GRAY_3 [[UIColor alloc]initWithRed:0xd8/255.f green:0xd8/255.f blue:0xd8/255.f alpha:1]
// 弱灰-分割线
#define COLOR_GRAY_4 [[UIColor alloc]initWithRed:0xe5/255.f green:0xe5/255.f blue:0xe5/255.f alpha:1]
// 白灰-背景色
#define COLOR_GRAY_5 [[UIColor alloc]initWithRed:0xf7/255.f green:0xf9/255.f blue:0xfa/255.f alpha:1]
// 灰蓝-其他
#define COLOR_GRAY_6 [[UIColor alloc]initWithRed:0xd0/255.f green:0xe3/255.f blue:0xfa/255.f alpha:1]

// 字体值
typedef enum {
    CCWFontSize18 = 18, // 导航栏字体
    CCWFontSize16 = 16, // 内容标题字体
    CCWFontSize15 = 15, // 内容正文字体
    CCWFontSize14 = 14, // 聊天内容字体
    CCWFontSize13 = 13, // 说明介绍字体
    CCWFontSize12 = 12  // 分类介绍、辅助说明、次要信息字体
}CCWFontSize;

//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]
#define IOS_VERSION_7_OR_ABOVE (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? (YES):(NO))

/*
 *屏幕宽度
 */
#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)

/*
 *屏幕高度
 */

#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)

/*
 *状态条高度
 */
#define STATUSBAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height)


#endif /* CHBConfigMacro_h */
