//
//  CHBLoginButton.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBLoginButton.h"

@interface CHBLoginButton ()<UITextFieldDelegate>

@property (nonatomic, strong)UIImageView *iconImageView;
@property (nonatomic, strong)UITextField *textField;

@property (nonatomic, strong)UIButton *passwdButton;

@property (nonatomic, copy)NSString *norImage;
@property (nonatomic, copy)NSString *selectImage;

@property (nonatomic, strong)UIColor *norBorderColor;
@property (nonatomic, strong)UIColor *selectBorderColor;
@property (nonatomic, strong)UIColor *errorBorderColor;

@property (nonatomic, assign)BOOL bLook;
@property (nonatomic, copy)NSString *hideImage;
@property (nonatomic, copy)NSString *lookImage;

@end

@implementation CHBLoginButton

- (instancetype)initWithFrame:(CGRect)frame Title:(NSString *)title
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self setupViewsTitle:title];
    }
    
    return self;
}

- (void)setupViewsTitle:(NSString *)title
{
    
    UILabel *userNamelbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, self.frame.size.height)];
    userNamelbl.text = title;
    [self addSubview:userNamelbl];

    _textField = [[UITextField alloc]initWithFrame:CGRectMake(userNamelbl.frame.size.width, 2, self.frame.size.width-60, userNamelbl.frame.size.height-2)];
    _textField.delegate = self;
    _textField.font = [UIFont systemFontOfSize:14];
    _textField.returnKeyType = UIReturnKeyDone;
    [self addSubview:_textField];

}

- (void)setIconImage:(NSString *)norImg selectImage:(NSString *)selectImg
{
    self.norImage = norImg;
    self.selectImage = selectImg;
    self.iconImageView.image = [UIImage imageNamed:self.norImage];
}

- (void)setPasswdHideImage:(NSString *)hideImage lookImage:(NSString *)lookImage
{
    self.hideImage = hideImage;
    self.lookImage = lookImage;
    [self.passwdButton setBackgroundImage:[UIImage imageNamed:self.hideImage] forState:UIControlStateNormal];
    [self.passwdButton setBackgroundImage:[UIImage imageNamed:self.hideImage] forState:UIControlStateSelected];
    [self.passwdButton setBackgroundImage:[UIImage imageNamed:self.hideImage] forState:UIControlStateHighlighted];
    
}

- (void)setBorderColor:(UIColor *)borderClr
{
    self.layer.borderColor = borderClr.CGColor;
}

- (void)setIconViewWithImageName:(NSString *)iconImg
{
    self.iconImageView.image = [UIImage imageNamed:iconImg];
}

- (void)setButtonState:(MSCLoginButtonState)buttonState
{
    if (buttonState == MSCLoginButtonStateNormal)
    {
        [self setBorderColor:self.norBorderColor];
        [self setIconViewWithImageName:self.norImage];
        
    }
    else if (buttonState == MSCLoginButtonStateSelected)
    {
        [self setBorderColor:self.selectBorderColor];
        [self setIconViewWithImageName:self.selectImage];
    }
    else if (buttonState == MSCLoginButtonStateError)
    {
        [self setBorderColor:self.errorBorderColor];
        [self setIconViewWithImageName:self.norImage];
    }
}

- (void)passwdButtonClicked:(UIButton *)btn
{
    if (self.bLook)
    {
        self.bLook = NO;
        
        [self.passwdButton setBackgroundImage:[UIImage imageNamed:self.hideImage] forState:UIControlStateNormal];
        [self.passwdButton setBackgroundImage:[UIImage imageNamed:self.hideImage] forState:UIControlStateSelected];
        [self.passwdButton setBackgroundImage:[UIImage imageNamed:self.hideImage] forState:UIControlStateHighlighted];
        self.textField.secureTextEntry = YES;
    }
    else
    {
        self.bLook = YES;
        
        [self.passwdButton setBackgroundImage:[UIImage imageNamed:self.lookImage] forState:UIControlStateNormal];
        [self.passwdButton setBackgroundImage:[UIImage imageNamed:self.lookImage] forState:UIControlStateSelected];
        [self.passwdButton setBackgroundImage:[UIImage imageNamed:self.lookImage] forState:UIControlStateHighlighted];
        self.textField.secureTextEntry = NO;
    }
}

#pragma mark - textfield delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self setButtonState:MSCLoginButtonStateSelected];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginButton:didEvent:)])
    {
        [self.delegate loginButton:self didEvent:MSCLoginButtonEventBeginEditing];
    }
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField.text length]>0)
    {
        [self setButtonState:MSCLoginButtonStateSelected];
    }
    else
    {
        [self setButtonState:MSCLoginButtonStateNormal];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(loginButton:didEvent:)])
    {
        [self.delegate loginButton:self didEvent:MSCLoginButtonEventEndEditing];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}


#pragma mark -
-(void)setBPassWd:(BOOL)bPassWd
{
    _bPassWd = bPassWd;
    
    if (_bPassWd)
    {
        self.passwdButton.hidden = NO;
        self.textField.secureTextEntry = YES;
    }
    else
    {
        self.passwdButton.hidden = YES;
        self.textField.secureTextEntry = NO;
    }
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    
    if (self.textField)
    {
        self.textField.placeholder = placeholder;
    }
}

- (UITextField *)editField
{
    return self.textField;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end

