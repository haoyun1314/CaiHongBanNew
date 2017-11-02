//
//  CHBLoginTipView.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHBLoginTipView : UIView

- (void)setTipText:(NSString *)tipText;
- (void)setErrorTipText:(NSString *)errorTipText iconImage:(NSString *)img; //设置错误提示
- (void)setErrorTipText:(NSString *)errorTipText;

- (void)showErrorTip:(BOOL)bShow;  //显示错误提示

@end
