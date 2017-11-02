//
//  searchViewCell.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface searchViewCell : UITableViewCell

@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UILabel *lblTitle;
@property (strong, nonatomic) UILabel *lblPrice;
@property (copy, nonatomic) NSString *videoType;

@property (strong, nonatomic) UIImageView *imgView2;
@property (strong, nonatomic) UILabel *lblTitle2;
@property (strong, nonatomic) UILabel *lblPrice2;
@property (copy, nonatomic) NSString *videoType2;

@end
