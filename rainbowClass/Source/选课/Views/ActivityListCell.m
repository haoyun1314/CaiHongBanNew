//
//  ActivityListCell.m
//  rainbowClass
//
//  Created by WangYu on 2/3/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "ActivityListCell.h"

@implementation ActivityListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//黑色蒙灰点击消失的效果
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    _backgroudImage.hidden = YES;
}

//- (void)touchesCancelled:(nullable NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
//{
//    [super touchesCancelled:touches withEvent:event];
//    _backgroudImage.hidden = NO;
//}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    _backgroudImage.hidden = NO;
}
@end
