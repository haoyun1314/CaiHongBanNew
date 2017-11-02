//
//  UIImageView+Cuotom.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/27.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "UIImageView+Cuotom.h"

@implementation UIImageView (Cuotom)

+ (UIImageView*)createImageView:(CGRect)frame image:(NSString *)image highlightedImage:(NSString *)highlightedImage
{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:image] highlightedImage:[UIImage imageNamed:highlightedImage]];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.frame = frame;
    return imageView;
    
}
+ (UIImageView*)createImageViewBySize:(NSString *)image highlightedImage:(NSString *)highlightedImage
{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:image] highlightedImage:[UIImage imageNamed:highlightedImage]];
    imageView.backgroundColor = [UIColor clearColor];
    [imageView sizeToFit];
    return imageView;
    
}

- (void)setImageURL:(NSString *)url  placeholderImage:(NSString*)placeholder
{
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholder]];
}



- (void)setImageURL:(NSString *)url placeholderImage:(NSString *)placeholder completed:(SDWebImageCompletionBlock)completedBlock
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:placeholder] completed:completedBlock];
}
@end
