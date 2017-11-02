//
//  NSTimer+YYFounction.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "NSTimer+YYFounction.h"

@implementation NSTimer (YYFounction)
-(void)pauseTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}


-(void)resumeTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}
@end
