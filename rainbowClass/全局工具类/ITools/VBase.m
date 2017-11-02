//
//  VBase.m
//  bumeng
//
//  Created by WangYu on 16/7/15.
//  Copyright (c) 2015年 GUWH. All rights reserved.
//

#import "VBase.h"

@implementation VBase

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//UIImageView初始化
+ (UIImageView *)UIImageViewWithFrame:(CGRect)rect AndImageName:(NSString *)name AndbackgroundColor:(UIColor *)color AndSuperView:(UIView *)superView{
    UIImageView *view = [[UIImageView alloc] initWithFrame:rect];
    view.image = [UIImage imageNamed:name];
    view.backgroundColor = color;
    [superView addSubview:view];
    return view;
}

//UIView
+ (UIView *)UIViewWithFrame:(CGRect)rect Andalpha:(CGFloat)alpha AndborderWidth:(CGFloat)borderWidth AndborderColor:(UIColor *)borderColor AndbackgroundColor:(UIColor *)bgColor AndSuperView:(UIView *)superView{
    UIView *view = [[UIView alloc] initWithFrame:rect] ;
    view.layer.borderWidth = borderWidth;
    view.layer.borderColor = [borderColor CGColor];
    view.alpha = alpha;
    view.backgroundColor = bgColor;
    [superView addSubview:view];
    return view;
}

//UILabel初始化
+ (UILabel *)UILabelWithFrame:(CGRect)rect AndText:(NSString *)text AndtextColor:(UIColor *)color AndSuperView:(UIView *)superView
{
    
    UILabel *label = [[UILabel alloc ] initWithFrame:rect];
    
    label.text = text;
    label.textColor = color;
    [superView addSubview:label];
    return label;
}

//UIButton初始化
+ (UIButton *)UIButtonWithFrame:(CGRect)rect AndBackgroundImageName:(NSString *)ImageName AndTitle:(NSString *)TitleName AndTitleColor:(UIColor *)TitleColor AndSuperView:(UIView *)superView{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    [button setBackgroundImage:[UIImage imageNamed:ImageName] forState:UIControlStateNormal];
    [button setTitleColor:TitleColor forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:14];
    [button setTitle:TitleName forState:UIControlStateNormal];
    [superView addSubview:button];
    return button;
}

//UIScrollView初始化
+ (UIScrollView *)UIScrollViewWithFrame:(CGRect)rect Delegate:(id)delegate PagingEnabled:(BOOL)Enabled Bounces:(BOOL)bounces ContentSize:(CGSize)size showsHorizontalScrollIndicator:(BOOL)show SuperView:(UIView *)superView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:rect];
    scrollView.delegate = delegate;
    scrollView.contentSize = size;
    scrollView.pagingEnabled = Enabled;
    scrollView.bounces = bounces;
    scrollView.showsHorizontalScrollIndicator = show;
    [superView addSubview:scrollView];
    return scrollView;
}

//UIPageControl初始化
+ (UIPageControl *)UIPageControlWithFrame:(CGRect)rect NumberOfPages:(NSInteger)number PageIndicatorTintColor:(UIColor *)TintColor currentPageIndicatorTintColor:(UIColor *)currentColor SuperView:(UIView *)superView{
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:rect];
    pageControl.numberOfPages = number;
    pageControl.currentPageIndicatorTintColor = currentColor;
    pageControl.pageIndicatorTintColor = TintColor;
    [superView addSubview:pageControl];
    return  pageControl;
}

@end
