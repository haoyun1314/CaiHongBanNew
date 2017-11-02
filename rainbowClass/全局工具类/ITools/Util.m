//
//  Util.m
//  bumeng
//
//  Created by cashyoon on 15/3/26.
//  Copyright (c) 2015年 GUWH. All rights reserved.
//

#import "Util.h"

@implementation Util





//截取标题长度
+ (NSString *)getSubStringFromString:(NSString *)string byLength:(NSInteger)length
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    if (screenWidth < 375) {
        length -= 2;
    } else if(screenWidth > 375) {
        length +=2;
    }
    if (string.length > length) {
        return [string substringToIndex:length];
    }
    return string;
}

+ (void)setView:(UIView *)view toSizeWidth:(CGFloat)width
{
    CGRect frame = view.frame;
    frame.size.width = width;
    view.frame = frame;
}

+ (void)setView:(UIView *)view toOriginX:(CGFloat)x
{
    CGRect frame = view.frame;
    frame.origin.x = x;
    view.frame = frame;
}

+ (void)setView:(UIView *)view toOriginY:(CGFloat)y
{
    CGRect frame = view.frame;
    frame.origin.y = y;
    view.frame = frame;
}

+ (void)setView:(UIView *)view toOrigin:(CGPoint)origin
{
    CGRect frame = view.frame;
    frame.origin = origin;
    view.frame = frame;
}



//16进制颜色(html颜色值)字符串转为UIColor
+(UIColor *) hexStringToColor: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

+ (NSMutableAttributedString *)createAttributedText:(NSString *)text Range:(NSRange)range DefaultColor:(UIColor *)defaultColor SpecialColor:(UIColor *)specialColor
{
    NSDictionary * defaultDict=[NSDictionary dictionaryWithObject:defaultColor forKey:NSForegroundColorAttributeName];
    NSDictionary * specialDict=[NSDictionary dictionaryWithObject:specialColor forKey:NSForegroundColorAttributeName];
    NSAttributedString * attributedString_str_atts2 = [[NSAttributedString alloc] initWithString:text attributes:defaultDict];
    
    //转成NSMutableAttributeString
    NSMutableAttributedString *mutable_attributeString_str_atts2=[[NSMutableAttributedString alloc] initWithAttributedString:attributedString_str_atts2];
    
    //设置开始编辑属性
    [mutable_attributeString_str_atts2  beginEditing];
    
    //在这里编辑属性
    //添加属性
    [mutable_attributeString_str_atts2 addAttributes:specialDict range:range];
    
    //设置结束编辑
    [mutable_attributeString_str_atts2 endEditing];
    
    return mutable_attributeString_str_atts2;
    
}

+ (NSMutableAttributedString *)createSpaceAttributedText:(NSString *)text Num:(CGFloat)number
{
    
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:number];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [text length])];
    
    return attributedString1;
    
}


+(BOOL)valueNotNilAndNull:(id)object
{
    if (object && ![object isMemberOfClass:[NSNull class]])
    {
        return YES;
    }
    
    return NO;
}


+(BOOL)valueNotNilAndNullAndStringNil:(id)object
{
    if (object && ![object isMemberOfClass:[NSNull class]]) {
        
        if ([object isKindOfClass:[NSString class]]) {
            NSString *str = (NSString *)object;
            return ![str isEqualToString:@""];
        }
    }
    return NO;
}

/**
 * 计算指定时间与当前的时间差
 * @param compareDate   某一指定时间
 * @return 多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */
+(NSString *) compareCurrentTime:(NSDate*) compareDate
{
    NSTimeInterval  timeInterval = [compareDate timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分前",temp];
    }
    
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小前",temp];
    }
    
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    
    return  result;
}




////md5加密
//+ (NSString *)md5:(NSString *)password
//{
//    const char *original_str = [password UTF8String];
//    unsigned char result[CC_MD5_DIGEST_LENGTH];
//    CC_MD5(original_str, strlen(original_str), result);
//    NSMutableString *hash = [NSMutableString string];
//    for (int i = 0; i < 16; i++)
//    {
//        [hash appendFormat:@"%02X", result[i]];
//    }
//    NSString *mdfiveString = [hash lowercaseString];
//    
//    //    NSLog(@"Encryption Result = %@",mdfiveString);
//    return mdfiveString;
//    
//}

+ (void)createAppStartNotification:(NSNumber *)accountId
{
    
    NSDictionary * dict = @{@"AppStart": accountId};
    //创建一个通知
    NSNotification * nf = [NSNotification notificationWithName:@"AppStart" object:nil userInfo:dict];
    //第二个参数表示接收对象，传nil表示群发
    //第三个参数是信息
    
    //用通知中心发送
    [[NSNotificationCenter defaultCenter] postNotification:nf];
}



//JSON解析
+ (NSDictionary *)objectJSONData:(id)data
{
    NSDictionary * dict = nil;
    if ([data isKindOfClass:[NSDictionary class]] == YES) {
        dict = data;
    }else {
        dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    }
    return dict;
}



#pragma mark - 上传图片
//按宽度压缩图片!
+ (UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth{
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = defineWidth;
    CGFloat targetHeight = height / (width / targetWidth);
    CGSize size = CGSizeMake(targetWidth, targetHeight);
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if(CGSizeEqualToSize(imageSize, size) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        if(widthFactor > heightFactor){
            scaleFactor = widthFactor;
        }
        else{
            scaleFactor = heightFactor;
        }
        scaledWidth = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        if(widthFactor > heightFactor){
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }else if(widthFactor < heightFactor){
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    UIGraphicsBeginImageContext(size);
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil){
        NSLog(@"scale image fail");
    }
    
    UIGraphicsEndImageContext();
    return newImage;
}

+ (NSString *)getCompressAndBase64EncodeWithImage:(UIImage *)imageBeforeCompress
{
    
    
    //压缩图片
    UIImage *imageAfterCompress = [self imageCompressForWidth:imageBeforeCompress targetWidth:1280.f];
    //    NSLog(@"图像长和宽%@",NSStringFromCGSize(imageAfterCompress.size));
    NSData *imageDataBf = UIImageJPEGRepresentation(imageAfterCompress, 0.1f);
    NSString * pictureDataString = [imageDataBf base64Encoding];
    return pictureDataString;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
