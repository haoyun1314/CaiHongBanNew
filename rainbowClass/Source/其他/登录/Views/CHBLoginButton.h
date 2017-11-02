//
//  CHBLoginButton.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    MSCLoginButtonStateNormal = 1,
    MSCLoginButtonStateSelected,
    MSCLoginButtonStateError,
}MSCLoginButtonState;

typedef enum {
    MSCLoginButtonEventBeginEditing,
    MSCLoginButtonEventEndEditing,
    //    MSCLoginButtonEventChange,
}MSCLoginButtonEvent;

@class CHBLoginButton;
@protocol CHBLoginButtonDelegate <NSObject>
@optional
- (void)loginButton:(CHBLoginButton *)loginButton didEvent:(MSCLoginButtonEvent)event;

@end

//
@interface CHBLoginButton : UIView
@property (nonatomic, assign)NSString *placeholder;
@property (nonatomic, assign)BOOL bPassWd;
@property (nonatomic, weak)id <CHBLoginButtonDelegate> delegate;


- (UITextField *)editField;

- (void)setPasswdHideImage:(NSString *)hideImage lookImage:(NSString *)lookImage;
- (void)setIconImage:(NSString *)norImg selectImage:(NSString *)selectImg;
- (void)setBorderColor:(UIColor *)norClr selectColor:(UIColor *)selectClr errorColor:(UIColor *)errorClr;
- (void)setButtonState:(MSCLoginButtonState)buttonState;


- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title;

@end
