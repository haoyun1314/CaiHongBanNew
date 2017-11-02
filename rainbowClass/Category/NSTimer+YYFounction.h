//
//  NSTimer+YYFounction.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <Foundation/Foundation.h>
//轮播图片会用到
@interface NSTimer (YYFounction)
- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end
