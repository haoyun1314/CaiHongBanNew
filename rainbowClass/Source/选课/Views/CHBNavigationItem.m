//
//  CHBNavigationItem.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBNavigationItem.h"

@implementation CHBNavigationItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:CGRectMake(0, 0, self.superview.bounds.size.width, self.superview.bounds.size.height)];
}

@end
