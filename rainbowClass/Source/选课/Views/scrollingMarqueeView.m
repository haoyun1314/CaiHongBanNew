//
//  scrollingMarqueeView.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/17.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "scrollingMarqueeView.h"

@implementation scrollingMarqueeView

- (id)initWithFrame:(CGRect)frame text:(NSString *)text duration:(NSTimeInterval)duration textColor:(UIColor *)textColor testFont:(CGFloat)textFont
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _label = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width, frame.origin.y, frame.size.width, frame.size.height)];
        _label.text = text;
        _label.textColor = textColor;
        _label.font = [UIFont systemFontOfSize:textFont];
        //计算UILabel 内容的size
        CGSize size = CGSizeMake(3000,100); //设置一个行高上限
        
        NSDictionary *attribute = @{NSFontAttributeName: _label.font};
        
        _labelsize = CGSizeZero;
        
        _labelsize = [_label.text boundingRectWithSize:size options:
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin   |
                      NSStringDrawingUsesFontLeading
                                               attributes:attribute context:nil].size;
        
        _label.frame = CGRectMake(frame.size.width, frame.origin.y, _labelsize.width, frame.size.height);
        
        [self addSubview:_label];
        
        //
        [UIView animateWithDuration:duration
                              delay:0
                            options:UIViewAnimationOptionRepeat //动画重复的主开关
                                   |UIViewAnimationOptionCurveLinear //动画的时间曲线，滚动字幕线性比较合理
         
                         animations:^{
                             
                             _label.transform = CGAffineTransformMakeTranslation(-_labelsize.width-CSCREEN_WIDTH , 0);
                         }
                         completion:^(BOOL finished) {
                             
                         }
         ];
    }
    return self;
}

- (void)startAnimationDuration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionRepeat //动画重复的主开关
     |UIViewAnimationOptionCurveLinear //动画的时间曲线，滚动字幕线性比较合理
     
                     animations:^{
                         _label.transform = CGAffineTransformMakeTranslation(-_labelsize.width-CSCREEN_WIDTH , 0);
                     }
                     completion:^(BOOL finished) {
                         
                     }
     ];
}


@end
