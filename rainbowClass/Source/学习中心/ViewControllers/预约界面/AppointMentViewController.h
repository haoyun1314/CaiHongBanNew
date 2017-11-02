//
//  AppointMentViewController.h
//  rainbowClass
//
//  Created by cashyoon on 16/2/23.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "RootViewController.h"

@interface AppointMentViewController : RootViewController
@property (weak, nonatomic) IBOutlet UIView *backGroundView;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImageView;
@property (weak, nonatomic) IBOutlet UIView *ContentView;
@property (weak, nonatomic) IBOutlet UIImageView *ContentBackGoundImageView;

//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong)UIScrollView * scrollView;

@property (nonatomic,assign) CGFloat viewWidth;


@property(nonatomic,strong)UILabel * teacherNameLabel;
@property (nonatomic,strong)UILabel * coureseFunctionLabel;
@property (nonatomic,strong)UILabel * coureseIntroduce;


@property (nonatomic,strong)UILabel * taskNeedLabel;



@property (nonatomic,strong)UIImageView *  teacherHeadImageView;
@property (nonatomic,strong)UILabel *  teacherName;
@property (nonatomic,strong)UILabel * teacherIntroduceContent;


//@property (nonatomic,strong)UIImageView *  pushTeacherHomePageImageView;

@property (weak, nonatomic) IBOutlet UIButton *goBack;

@property (weak, nonatomic) IBOutlet UIButton *pushToTeacherBtn;

@end
