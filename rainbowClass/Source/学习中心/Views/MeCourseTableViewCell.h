//
//  MeCourseTableViewCell.h
//  rainbowClass
//
//  Created by cashyoon on 16/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeCourseTableViewCell : UITableViewCell
{
}

@property(nonatomic,strong)UIImageView * LineImageView;
@property(nonatomic,strong)UIImageView * VideoImageView;
@property (nonatomic,strong) UILabel * courseNameLabel;
@property (nonatomic,strong) UILabel * livingLabel;
@property (nonatomic,strong) UILabel * teacherNameLabel;


@end
