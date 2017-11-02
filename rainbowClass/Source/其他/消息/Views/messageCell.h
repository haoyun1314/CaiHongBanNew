//
//  messageCell.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/7.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface messageCell : UITableViewCell

@property (strong, nonatomic) UILabel *lblTitle;      // 标题
@property (strong, nonatomic) UILabel *lblDate;       // 日期
@property (strong, nonatomic) UILabel *lblUploadTime; // 上传时间
@property (strong, nonatomic) UILabel *lblSubject ;   // 课名
@property (strong, nonatomic) UILabel *lblTeacher;    // 老师

@property (strong, nonatomic) UIImageView *imgStar;   // 星星
@property (strong, nonatomic) UILabel *lblEnter;     // 进入

@end
