//
//  CHBNoLineNavigationBar.m
//  rainbowClass
//
//  Created by WangYu on 24/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBNoLineNavigationBar.h"

@implementation CHBNoLineNavigationBar

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self reDrawNaviBar];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self reDrawNaviBar];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self reDrawNaviBar];
    }
    return self;
}

- (void)reDrawNaviBar
{
    for (UIView *parentView in self.subviews) {
        for (UIView *childView in parentView.subviews) {
            if ([childView isKindOfClass:[UIImageView class]]) {
                [childView removeFromSuperview];
            }
        }
    }
}
@end
