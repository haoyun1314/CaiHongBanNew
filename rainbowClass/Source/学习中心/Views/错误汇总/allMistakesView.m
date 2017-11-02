//
//  allMistakesView.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/22.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "allMistakesView.h"

@interface allMistakesView ()

@property (nonatomic, strong)UILabel *tipLabel;
@property (nonatomic, strong)UIImageView *iconView;
@property (nonatomic, strong)UILabel *errorTipLabel;

@end

@implementation allMistakesView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    self.tipLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    self.tipLabel.font = [UIFont systemFontOfSize:12];
    self.tipLabel.textColor = COLOR_GRAY_0;
    [self addSubview:self.tipLabel];
    
    self.iconView = [[UIImageView alloc]initWithFrame:CGRectZero];
    self.iconView.image = [UIImage imageNamed:@"signup_error"];
    [self addSubview:self.iconView];
    self.errorTipLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    [self addSubview:self.errorTipLabel];
    self.errorTipLabel.font = [UIFont systemFontOfSize:12];
    self.errorTipLabel.textColor = CTitle_Color;
    
    [self showErrorTip:NO];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.iconView.frame = CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height);
    self.errorTipLabel.frame = CGRectMake(self.bounds.size.height+3, 0, self.bounds.size.width-self.bounds.size.height-3, self.bounds.size.height);
    self.tipLabel.frame = self.errorTipLabel.frame;
}

#pragma mark -
- (void)setTipText:(NSString *)tipText
{
    self.tipLabel.text = tipText;
}

- (void)setErrorTipText:(NSString *)errorTipText iconImage:(NSString *)img
{
    self.errorTipLabel.text = errorTipText;
    self.iconView.image = [UIImage imageNamed:img];
}

- (void)setErrorTipText:(NSString *)errorTipText
{
    self.errorTipLabel.text = errorTipText;
}

- (void)showErrorTip:(BOOL)bShow
{
    self.iconView.hidden = !bShow;
    self.errorTipLabel.hidden = !bShow;
    self.tipLabel.hidden = bShow;
}


@end
