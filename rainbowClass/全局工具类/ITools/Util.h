//
//  Util.h
//  bumeng
//
//  Created by cashyoon on 15/3/26.
//  Copyright (c) 2015年 GUWH. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Util : UIView
@property(nonatomic,assign) int Num;

//16进制颜色(html颜色值)字符串转为UIColor
+(UIColor *) hexStringToColor: (NSString *) stringToConvert;

/***自定义String 的颜色*/
+ (NSMutableAttributedString *)createAttributedText:(NSString *)text Range:(NSRange)range DefaultColor:(UIColor *)defaultColor SpecialColor:(UIColor *)specialColor;
/***设置string的行间距*/
+ (NSMutableAttributedString *)createSpaceAttributedText:(NSString *)text Num:(CGFloat)number;

//判断值是否为nil NULL
+(BOOL)valueNotNilAndNull:(id)object;

//判断值是否为nil NULL @""
+(BOOL)valueNotNilAndNullAndStringNil:(id)object;




//解析JSON
+ (NSDictionary *)objectJSONData:(id)data;



/***压缩图片*/
+ (NSString *)getCompressAndBase64EncodeWithImage:(UIImage *)imageBeforeCompress;



//转化时间的显示形式
+(NSString *) compareCurrentTime:(NSDate*) compareDate;


//截取字符串
+(NSString *)getSubStringFromString:(NSString *)string
                           byLength:(NSInteger)length;

+ (void)setView:(UIView *)view toSizeWidth:(CGFloat)width;
+ (void)setView:(UIView *)view toOriginX:(CGFloat)x;
+ (void)setView:(UIView *)view toOriginY:(CGFloat)y;
+ (void)setView:(UIView *)view toOrigin:(CGPoint)origin;







@end
