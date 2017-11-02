//
//  VBase.h
//  bumeng
//
//  Created by WangYu on 16/7/15.
//  Copyright (c) 2015年 GUWH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VBase : UIView

/**
 *  UIImageView初始化方法
 *
 *  @param rect      位置大小
 *  @param name      图片名称
 *  @param superView 所要添加到的父视图
 *
 *  @return UIImageView
 */
+ (UIImageView *)UIImageViewWithFrame:(CGRect)rect AndImageName:(NSString *)name AndbackgroundColor:(UIColor *)color AndSuperView:(UIView *)superView;

/**
 *  UIView带边框初始化方法
 *
 *  @param rect        位置大小
 *  @param alpha       透明度
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 *  @param bgColor       背景颜色
 *  @param superView   所要添加到的父视图
 *
 *  @return UIView
 */
+ (UIView *)UIViewWithFrame:(CGRect)rect Andalpha:(CGFloat)alpha AndborderWidth:(CGFloat)borderWidth AndborderColor:(UIColor *)borderColor AndbackgroundColor:(UIColor *)bgColor AndSuperView:(UIView *)superView;

/**
 *  UILabel初始化方法
 *
 *  @param rect      位置大小
 *  @param text      内容
 *  @param color     字体颜色
 *  @param superView 所要添加到的父视图
 *
 *  @return UILabel
 */
+ (UILabel *)UILabelWithFrame:(CGRect)rect AndText:(NSString *)text AndtextColor:(UIColor *)color AndSuperView:(UIView *)superView;

/**
 *  UIButton初始化方法
 *
 *  @param rect      大小位置
 *  @param ImageName 背景图片
 *  @param TitleName 标题
 *  @param TitleColor     标题颜色
 *  @param superView 所要添加到的父视图
 *
 *  @return UIButton
 */
+ (UIButton *)UIButtonWithFrame:(CGRect)rect AndBackgroundImageName:(NSString *)ImageName AndTitle:(NSString *)TitleName AndTitleColor:(UIColor *)TitleColor AndSuperView:(UIView *)superView;

/**
 *  UIScrollView初始化方法
 *
 *  @param rect      大小位置
 *  @param delegate  代理对象
 *  @param Enabled   是否分页
 *  @param bounces   弹性效果
 *  @param size      内部视图大小
 *  @param show      滚动条的显示
 *  @param superView 所要添加到的父视图
 *
 *  @return UIScrollView
 */
+ (UIScrollView *)UIScrollViewWithFrame:(CGRect)rect Delegate:(id)delegate PagingEnabled:(BOOL)Enabled Bounces:(BOOL)bounces ContentSize:(CGSize)size showsHorizontalScrollIndicator:(BOOL)show SuperView:(UIView *)superView;

/**
 *  UIPageControl初始化
 *
 *  @param rect         大小位置
 *  @param number       点的个数
 *  @param TintColor    默认颜色
 *  @param currentColor 当前选中颜色
 *  @param superView    所要添加到的父视图
 *
 *  @return UIPageControl
 */
+ (UIPageControl *)UIPageControlWithFrame:(CGRect)rect NumberOfPages:(NSInteger)number PageIndicatorTintColor:(UIColor *)TintColor currentPageIndicatorTintColor:(UIColor *)currentColor SuperView:(UIView *)superView;
@end
