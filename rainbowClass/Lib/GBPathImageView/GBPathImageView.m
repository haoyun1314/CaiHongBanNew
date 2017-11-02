//
//  GBPathImageView.m
//  GBControls
//
//  Created by Matteo Gobbi on 15/08/13.
//  Copyright (c) 2013 Matteo Gobbi. All rights reserved.
//


#define LINE_BORDER_WIDTH 1.0

#import "GBPathImageView.h"
#import "UIImageView+WebCache.h"

@interface GBPathImageView () {
    UIImage *originalImage;
}

@end


@implementation GBPathImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setDefaultParam];
        
        [self draw];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
        
        originalImage = image;
        
        
        [self setDefaultParam];
        
        [self draw];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame// add  by  dong
           urlNSURL:(NSURL *)url
{
    self = [super initWithFrame:frame];

    if (self) {
  
//        [self setImageWithURL:url refreshCache:NO placeholderImage:[UIImage imageNamed:@"defaulthead.png"]];
     
        
        
        
        [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"defaulthead.png"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (image) {
                originalImage = self.image;
                [self setDefaultParam];
                
                [self draw];
            } else {
                NSLog(@"%@",error);
            
            }
        }];
    }


    return self;

}

- (void)setURL:(NSURL *)url // add by  dong
{

//    [self setImageWithURL:url refreshCache:NO placeholderImage:[UIImage imageNamed:@"defaulthead.png"]];
//    __weak UIImage * _originalImage = originalImage;
    [self sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"xuanzhuan.png"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            originalImage = self.image;
            [self setDefaultParam];
            [self draw];
        } else {
            NSLog(@"%@",error);
                   }
    }];
    

}

- (void)setImageNew:(UIImage *)image// add by  dong
{
    originalImage = self.image;
    [self setDefaultParam];
    [self draw];

//        [self setImageWithURL:url refreshCache:NO placeholderImage:[UIImage imageNamed:@"defaulthead.png"]];
//    //    __weak UIImage * _originalImage = originalImage;
//    [self setImageWithURL:url placeholderImage:[UIImage imageNamed:@"defaulthead.png"] success:^(UIImage *image) {
//        originalImage = self.image;
//        [self setDefaultParam];
//        [self draw];
//    } failure:^(NSError *error) {
//        NSLog(@"%@",error);
//    }];
    
    
}



- (id)initWithFrame:(CGRect)frame
              image:(UIImage *)image
           pathType:(GBPathImageViewType)pathType
          pathColor:(UIColor *)pathColor
        borderColor:(UIColor *)borderColor
          pathWidth:(float)pathWidth
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        originalImage = image;
        _pathType = pathType;
        _pathColor = pathColor;
        _borderColor = borderColor;
        _pathWidth = pathWidth;
         
        [self draw];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    originalImage = self.image;
    
    [self setDefaultParam];
    
    [self draw];
}


-(void)draw {
    
    CGRect rect;
    rect.size = self.frame.size;
    rect.origin = CGPointMake(0, 0);
    
    CGRect rectImage = rect;
    rectImage.origin.x += _pathWidth;
    rectImage.origin.y += _pathWidth;
    rectImage.size.width -= _pathWidth*2.0;
    rectImage.size.height -= _pathWidth*2.0;
    
    
    UIGraphicsBeginImageContextWithOptions(rect.size,0,0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    switch (_pathType) {
        case GBPathImageViewTypeCircle:
            CGContextAddEllipseInRect(ctx, rect);
            break;
        case GBPathImageViewTypeSquare:
            CGContextAddRect(ctx, rect);
            break;
        default:
            break;
    }
    
    CGContextClip(ctx);
    [originalImage drawInRect:rectImage];
    
    
    
    //Add intern and extern line
    rectImage.origin.x -= _borderWidth/2.0;
    rectImage.origin.y -= _borderWidth/2.0;
    rectImage.size.width += _borderWidth;
    rectImage.size.height += _borderWidth;
    
    rect.origin.x += _borderWidth/2.0;
    rect.origin.y += _borderWidth/2.0;
    rect.size.width -= _borderWidth;
    rect.size.height -= _borderWidth;
    
    CGContextSetStrokeColorWithColor(ctx, [_borderColor CGColor]);
    CGContextSetLineWidth(ctx, _borderWidth);
    
    switch (_pathType) {
        case GBPathImageViewTypeCircle:
            CGContextStrokeEllipseInRect(ctx, rectImage);
            CGContextStrokeEllipseInRect(ctx, rect);
            break;
        case GBPathImageViewTypeSquare:
            CGContextStrokeRect(ctx, rectImage);
            CGContextStrokeRect(ctx, rect);
            break;
        default:
            break;
    }
    
    
    //Add center line
    float centerLineWidth = _pathWidth - _borderWidth*2.0;
    
    rectImage.origin.x -= _borderWidth/2.0+centerLineWidth/2.0;
    rectImage.origin.y -= _borderWidth/2.0+centerLineWidth/2.0;
    rectImage.size.width += _borderWidth+centerLineWidth;
    rectImage.size.height += _borderWidth+centerLineWidth;
    
    CGContextSetStrokeColorWithColor(ctx, [_pathColor CGColor]);
    CGContextSetLineWidth(ctx, centerLineWidth);
    
    switch (_pathType) {
        case GBPathImageViewTypeCircle:
            CGContextStrokeEllipseInRect(ctx, rectImage);
            break;
        case GBPathImageViewTypeSquare:
            CGContextStrokeRect(ctx, rectImage);
            break;
        default:
            break;
    }
    
    
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
}

-(void)setDefaultParam {
    _pathType = GBPathImageViewTypeCircle;
//    _pathColor = [UIColor whiteColor];
//    _borderColor = [UIColor darkGrayColor];
//    _pathWidth = 5.0;
//    _borderWidth = LINE_BORDER_WIDTH;
}


@end
