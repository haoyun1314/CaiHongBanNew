//
//  scrollingMarqueeView.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/17.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface scrollingMarqueeView : UIView

@property (nonatomic,strong)UILabel *label;
@property (nonatomic,assign)CGSize labelsize;

- (id)initWithFrame:(CGRect)frame text:(NSString *)text duration:(NSTimeInterval)duration textColor:(UIColor *)textColor testFont:(CGFloat)textFont;
- (void)startAnimationDuration:(NSTimeInterval)duration;

@end
