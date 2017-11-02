//
//  SeeBeforeVedioVC.h
//  rainbowClass
//
//  Created by cashyoon on 16/2/26.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "RootViewController.h"

@interface SeeBeforeVedioVC : RootViewController
@property (weak, nonatomic) IBOutlet UIView *backGroundView;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundViewImage;
@property (weak, nonatomic) IBOutlet UIImageView *ContentImgeView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
//@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
//@property (weak, nonatomic) IBOutlet UIView *contentInBackGroundView;
//@property (weak, nonatomic) IBOutlet UIView *firstView;

@property(nonatomic,strong) UIScrollView * scrollView;





@property (nonatomic,assign) CGFloat viewWidth;


@property(nonatomic,strong)UILabel * teacherNameLabel;
@property (nonatomic,strong)UILabel * coureseFunctionLabel;
@property (nonatomic,strong)UILabel * coureseIntroduce;


@property (nonatomic,strong)UILabel * taskNeedLabel;



@property (nonatomic,strong)UIImageView *  teacherHeadImageView;
@property (nonatomic,strong)UILabel *  teacherName;
@property (nonatomic,strong)UILabel * teacherIntroduceContent;




@property (weak, nonatomic) IBOutlet UIButton *goToCourseBtn;


@end
