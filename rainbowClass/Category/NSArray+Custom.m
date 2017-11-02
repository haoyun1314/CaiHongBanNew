//
//  NSArray+Custom.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "NSArray+Custom.h"

@implementation NSArray (Custom)
- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index>=self.count) {
        return nil;
    }
    return [self objectAtIndex:index];
}
@end
