//
//  CHBBaseViewController.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHBBaseViewController : UIViewController

- (void)addNavBar;
// title
- (void)setNavTitle:(NSString *)title;
- (void)setNavTitleView:(UIView *)titleView;
// left button
- (void)setNavLeftBtn;//返回
- (void)setNavLeftBtnWithTitle:(NSString *)btnTitle;
- (void)setNavLeftItem:(UIBarButtonItem *)leftItem;
// rigth button
- (void)setNavRightBtnWithTitle:(NSString *)btnTitle;
- (void)setNavRightBtnWithImage:(NSString *)normalImg andSelectedImage:(NSString *)selectedImg;
- (void)setNavRightItem:(UIBarButtonItem *)rightItem;
- (void)setRightBarButtonItems:(UIBarButtonItem *)rightBarButtonItem other:(UIBarButtonItem *)rightBarButtonItem2;

// 可以重载(截获)以下消息
- (void)leftButtonClicked:(UIButton *)btn;
- (void)rightButtonClicked:(UIButton *)btn;


@end
