//
//  teacherCoursesCell.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/18.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface teacherCoursesCell : UITableViewCell

@property (strong, nonatomic) UIImageView *imgView;
@property (strong, nonatomic) UILabel *lblTitle;
@property (strong, nonatomic) UILabel *lblPrice;
@property (copy, nonatomic) NSString *videoType;

@end
