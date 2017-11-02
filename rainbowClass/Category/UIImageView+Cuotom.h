//
//  UIImageView+Cuotom.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/27.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface UIImageView (Cuotom)
+ (UIImageView*)createImageView:(CGRect)frame image:(NSString *)image highlightedImage:(NSString *)highlightedImage;
+ (UIImageView*)createImageViewBySize:(NSString *)image highlightedImage:(NSString *)highlightedImage;

- (void)setImageURL:(NSString *)url  placeholderImage:(NSString*)placeholder;
- (void)setImageURL:(NSString *)url placeholderImage:(NSString *)placeholder completed:(SDWebImageCompletionBlock)completedBlock;
@end
