//
//  MeCourseDetailFirstTableViewCell.h
//  rainbowClass
//
//  Created by cashyoon on 16/2/17.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeCourseDetailFirstTableViewCell : UITableViewCell


@property(nonatomic,assign)NSIndexPath  * indexPath;


@property (nonatomic,strong) UIImageView *  firstCellLine;

@property(nonatomic,strong)UIImageView * VideoImageView;
@property (nonatomic,strong) UILabel * courseNameLabel;
@property (nonatomic,strong) UILabel * livingLabel;
@property (nonatomic,strong) UILabel * teacherNameLabel;



@property (nonatomic,strong)UILabel * redLine;
@property (nonatomic,strong)UILabel * redSingContent;


@end
