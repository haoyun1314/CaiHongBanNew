//
//  MyStaticTextVC.h
//  rainbowClass
//
//  Created by WangYu on 26/1/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    MyStaticTextAboutCHB = 0,
    MyStaticTextServiceAgreement = 1,
    MyStaticTextPrivacyclause = 2,
    MyStaticTextCommonProblem = 4,
} MyStaticTextType;

@interface MyStaticTextVC : UIViewController

@property (nonatomic, assign) MyStaticTextType textContentType;
@property (nonatomic, strong) NSString *titleString;

@end
