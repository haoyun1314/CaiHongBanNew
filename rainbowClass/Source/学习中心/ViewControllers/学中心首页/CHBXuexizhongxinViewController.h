//
//  CHBXuexizhongxinViewController.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBBaseViewController.h"
#import "RootViewController.h"
#import "HMSegmentedControl.h"
@interface CHBXuexizhongxinViewController :RootViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{

    NSMutableArray * _dataArray;

}





@property(nonatomic,strong)UITableView * learnCenterTableView;
@property (nonatomic,strong)UIImageView * headBackGroundImageView;


//-----头像------
@property (nonatomic,strong)UIImageView * personHeadImageView;
@property (nonatomic,strong)UILabel * nameLabel;
@property (nonatomic,strong)UIImageView * starImageView;
@property (nonatomic,strong)UILabel * GradeNumLabel;




//-------消息----
@property (nonatomic,strong)UIImageView * messageImageView;
@property (nonatomic,strong)UIImageView * messageStarImageView;




@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl;
@property (nonatomic,assign) CGFloat viewWidth;



//-----成绩-----
@property (nonatomic,strong)UILabel * avgScoreColor;
@property (nonatomic,strong)UILabel * avgScoreName;
@property (nonatomic,strong)UILabel * meScoreColor;
@property (nonatomic,strong)UILabel * meScoreName;



//--------错误汇总－－－－

@property(nonatomic,strong)UITableView * mistakesTableView;

//--------音乐素养
@property(nonatomic,strong)UITableView * musicTableView;



@end
