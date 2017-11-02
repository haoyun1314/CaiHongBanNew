//
//  CHBHudCenter.h
//  rainbowClass
//
//  Created by 张佳伟 on 16/1/5.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHBHudCenter : NSObject

/**
 * gets singleton object.
 * @return singleton
 */
+ (CHBHudCenter*)sharedInstance;


+ (void)showLoadingWithMessage:(NSString*)message;
+ (void)cancleLoadingHud;

//+ (void)popMessage:(NSString *)message;       //iToast

@end
