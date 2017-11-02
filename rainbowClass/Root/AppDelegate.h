//
//  AppDelegate.h
//  rainbowClass
//
//  Created by 张佳伟 on 16/1/4.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 *  appDelegate.allowRotation = 1;              横屏
 *
 *  返回时要 appDelegate.allowRotation = 0;     恢复竖屏
 */
@property(nonatomic,assign)NSInteger allowRotation;

@end

