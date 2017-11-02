//
//  CHBXuankeViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBXuankeViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import "CHBCycleScrollView.h"
#import "masterClassCell.h"
#import "CHBNavigationItem.h"
#import "ROllLabel.h"                   //滚动字幕
#import "CHBTeacherHomePage.h"

#import "CHBPlayVideoViewController.h"
#import "CHBSearchViewController.h"     //搜索
#import "liveTrailerViewController.h"

#import "CourceListVC.h"
#import "ActivityListVC.h"
#import "StudentListVC.h"
#import "FamousTeacherListVC.h"
#import "LiveListVC.h"

#import "CHBSearchViewController.h"     // 搜索
#import "liveTrailerViewController.h"   // 直播
#import "CHBPlayVideoViewController.h"  // 点播详情
#import "CHBLoginViewController.h"      // 登录


@interface CHBXuankeViewController ()
@property (nonatomic,strong)UIView *subView;                        // headView
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UIView *functionalView;                 // 功能页面
@property (nonatomic,strong)UIView *learnMusicView;                 // 一键学音乐
@property (nonatomic,strong) CHBCycleScrollView *cycleScrollView;   // 跑马灯
@end

@implementation CHBXuankeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.layer.contents = (id) [UIImage imageNamed:@"homePage.png"].CGImage; //这样设置背景能减小内存消耗
    
    self.subView = [[UIView alloc]init];
    [self.view addSubview:_subView];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CSCREEN_WIDTH, CSCREEN_HEIGHT-64-49)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    [self createCycleScrollView];
    [self createFunctional];
    [self initNavigation];
    [self createYijianxueyinyue];
}
//首页轮播图
- (void)createCycleScrollView {
    _cycleScrollView = [[CHBCycleScrollView alloc] initWithFrame:CGRectMake(0, 0,CSCREEN_WIDTH, CSCREEN_WIDTH*0.653-64) animationDuration:3.0];
    NSMutableArray *viewArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++) {
        UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:_cycleScrollView.frame];
        tempImageView.image = [UIImage imageNamed:@"banner"];
        tempImageView.contentMode = UIViewContentModeScaleAspectFill;
        tempImageView.clipsToBounds = true;
        [viewArray addObject:tempImageView];
    }
    [_cycleScrollView setFetchContentViewAtIndex:^UIView *(NSInteger(pageIndex)) {
        return [viewArray objectAtIndex:pageIndex];
    }];
    [_cycleScrollView setTotalPagesCount:^NSInteger{
        return [viewArray count];
    }];
    [_cycleScrollView setTapActionBlock:^(NSInteger(pageIndex)) {
        NSLog(@"点击的相关的页面%ld",(long)pageIndex);
    }];
    [_cycleScrollView setTapActio:^(NSInteger(page)) {
        NSLog(@"page:%ld",(long)page);
    }];
    [_subView addSubview:_cycleScrollView];
}
//功能界面
- (void) createFunctional{
    //背景云
//    _functionalView = [[UIView alloc]initWithFrame:CGRectMake(0, _cycleScrollView.frame.size.height/24*17, CSCREEN_WIDTH, CSCREEN_WIDTH*0.858)];
//    _functionalView.layer.contents = (id) [UIImage imageNamed:@"home_functional_bg.png"].CGImage;       // 这样设置背景能减小内存消耗
//    [_subView addSubview:_functionalView];
//    
//    //名师
//    [self addFunctionalBtnCenter:CGPointMake(_functionalView.frame.size.width/2, _functionalView.frame.size.height/2) tag:101 NormalImg:@"home_famousTeacher_h" HighlightedImg:@"home_famousTeacher_h"];
//    
//    //学员榜
//    [self addFunctionalBtnCenter:CGPointMake(_functionalView.frame.size.width/2+15 * CEqualSixScale, _functionalView.frame.size.height/2 + _functionalView.frame.size.height/2/5*3 )  tag:102 NormalImg:@"home_studentsRanking_n" HighlightedImg:@"home_studentsRanking_h"];
//
//    //直播课
//    [self addFunctionalBtnCenter:CGPointMake(_functionalView.frame.size.width/2-CSCREEN_WIDTH*0.1139*2*1.25, _functionalView.frame.size.height/2 + _functionalView.frame.size.height/2/5*3 -25 * CEqualSixScale) tag:103 NormalImg:@"home_liveLesson_n" HighlightedImg:@"home_liveLesson_h"];
//    
//    //小提琴
//    [self addFunctionalBtnCenter:CGPointMake(CSCREEN_WIDTH/6, _functionalView.frame.size.height/2 -10 * CEqualSixScale) tag:104 NormalImg:@"home_violin_n" HighlightedImg:@"home_violin_h"];
//    
//    //钢琴
//    [self addFunctionalBtnCenter:CGPointMake(CSCREEN_WIDTH/2/3*2, _functionalView.frame.size.height/4) tag:105  NormalImg:@"home_piano_n" HighlightedImg:@"home_piano_h"];
//    
//    //唱歌
//    [self addFunctionalBtnCenter:CGPointMake(CSCREEN_WIDTH/2+CSCREEN_WIDTH/2/3*1,_functionalView.frame.size.height/4) tag:106 NormalImg:@"home_sing_n" HighlightedImg:@"home_sing_h"];
//    
//    //其他
//    [self addFunctionalBtnCenter:CGPointMake(CSCREEN_WIDTH/6*5, _functionalView.frame.size.height/2 - 10 * CEqualSixScale) tag:107  NormalImg:@"home_other_n" HighlightedImg:@"home_other_h"];
//    
    //活动
//    [self addFunctionalBtnCenter:CGPointMake(CSCREEN_WIDTH/4*3+10 * CEqualSixScale, _functionalView.frame.size.height/2 + _functionalView.frame.size.height/2/5*3 - 25 * CEqualSixScale) tag:108  NormalImg:@"home_activity_n" HighlightedImg:@"home_activity_h"];
}

#pragma mark - 添加功能按钮
- (void)addFunctionalBtnCenter:(CGPoint)center tag:(NSInteger)tag NormalImg:(NSString *)imgNormal HighlightedImg:(NSString *)imgHighlighted{
    
    UIButton *functionalBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *Image = [UIImage imageNamed:imgNormal];
    functionalBtn.frame = CGRectMake(0, 0, Image.size.width*CEqualSixScale, Image.size.height*CEqualSixScale);

    functionalBtn.center = center;
    functionalBtn.tag = tag;
    [functionalBtn setImage:[UIImage imageNamed:imgNormal] forState:UIControlStateNormal];
    [functionalBtn setImage:[UIImage imageNamed:imgHighlighted] forState:UIControlStateHighlighted];
    [functionalBtn addTarget:self action:@selector(toFunctionalDetails:) forControlEvents:UIControlEventTouchUpInside];
    [_functionalView addSubview:functionalBtn];
}

/**
 * 跳转到功能详情页（名师、钢琴、唱歌、其他、活动、学员榜、直播课、小提琴）
 */
- (void)toFunctionalDetails:(UIButton *)sender {
    switch (sender.tag) {
        case 101:
        {
            FamousTeacherListVC *_lictVC = [[FamousTeacherListVC alloc] initWithNibName:@"FamousTeacherListVC" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:_lictVC animated:YES];
        }
            break;
        case 102:
        {
            StudentListVC *_lictVC = [[StudentListVC alloc] initWithNibName:@"StudentListVC" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:_lictVC animated:YES];
        }
            break;
        case 103:
        {
            LiveListVC *_lictVC = [[LiveListVC alloc] init];
            [self.navigationController pushViewController:_lictVC animated:YES];
        }
            break;
        case 107:
        {
            NSLog(@"其他");
        }
            break;
        case 108:
        {
            ActivityListVC *_lictVC = [[ActivityListVC alloc] initWithNibName:@"ActivityListVC" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:_lictVC animated:YES];
        }
            break;
            
        default:
        {
            CourceListVC *_lictVC = [[CourceListVC alloc] initWithNibName:@"CourceListVC" bundle:[NSBundle mainBundle]];
            [self.navigationController pushViewController:_lictVC animated:YES];
        }
            break;
    }
}
#pragma mark - 初始化导航
-(void)initNavigation
{
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];           // 去掉导航底部黑线

    UIButton *leftBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *leftImage = [UIImage imageNamed:@"home_logo"];
    leftBtn.frame = CGRectMake(0, 0, leftImage.size.width*CEqualSixScale, leftImage.size.height*CEqualSixScale);
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -12, 0, 12)];                           // 图片边距
    [leftBtn setImage:leftImage forState:UIControlStateNormal];
    [leftBtn setImage:leftImage forState:UIControlStateHighlighted];
    [leftBtn addTarget:self action:@selector(setButton1) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    UIButton *leftBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *leftImage2 = [UIImage imageNamed:@"home_searchbar"];
    leftBtn2.frame = CGRectMake(0, 0, leftImage2.size.width*CEqualSixScale, leftImage2.size.height*CEqualSixScale );
    [leftBtn2 setImageEdgeInsets:UIEdgeInsetsMake(0, -12, 0, 12)];                          // 图片边距
    [leftBtn2 setImage:leftImage2 forState:UIControlStateNormal];
    [leftBtn2 addTarget:self action:@selector(goeSarch) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem2 = [[UIBarButtonItem alloc] initWithCustomView:leftBtn2];

    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects: leftItem ,leftItem2 , nil];
}
#pragma - mark 搜索
- (void)goeSarch {
    NSLog(@"搜索");
    CHBSearchViewController *searchVC = [CHBSearchViewController new];
    [self.navigationController pushViewController:searchVC animated:YES];

}
#pragma mark - 点击Login
- (void)setButton1 {

    UIViewController *controller = [CHBLoginViewController loginViewContoller];
    
    [self presentViewController:controller animated:YES completion:nil];

}

#pragma mark - 一键学音乐
- (void)createYijianxueyinyue {
    
    _learnMusicView = [[UIView alloc]initWithFrame:CGRectMake(0, _functionalView.frame.origin.y +_functionalView.frame.size.height, CSCREEN_WIDTH, CSCREEN_WIDTH*0.6986)];
    _learnMusicView.layer.contents = (id) [UIImage imageNamed:@"yijianxueyinyue"].CGImage; //这样设置背景能减小内存消耗
    [_subView addSubview:_learnMusicView];
    _subView.frame = CGRectMake(0, 0, CSCREEN_WIDTH, _learnMusicView.frame.origin.y + _learnMusicView.frame.size.height);
#pragma mark - 滚动字幕
    ROllLabel *roll = [[ROllLabel alloc]initWithFrame:CGRectMake(0, 20*CEqualSixScale, CSCREEN_WIDTH, 20*CEqualSixScale) withBgColor:[UIColor clearColor]];
    NSString *str = @"恭喜王晓明小朋友获得儿童大赛第一名！报名中...";
    [roll setTimeInterval:str.length*0.5];
    [roll setAnimationOption:UIViewAnimationOptionCurveLinear];
    [roll rollLabelTitle:str textcolor:[UIColor whiteColor] font:[UIFont systemFontOfSize:14 * CEqualSixScale] middleSpace:100*CEqualSixScale];
    [_learnMusicView addSubview:roll];
    
    // 图片
    UIScrollView *learnMusicSV = [[UIScrollView alloc]initWithFrame:CGRectMake(40 * CEqualSixScale, 154 * CEqualSixScale, CSCREEN_WIDTH - 85 * CEqualSixScale , 100 * CEqualSixScale)];
    
    // 设置scrollView一次滚动一页
    learnMusicSV.pagingEnabled = NO;
    [learnMusicSV setShowsHorizontalScrollIndicator:NO];
    learnMusicSV.contentSize = CGSizeMake(900 , 0);
    [_learnMusicView addSubview:learnMusicSV];
    for (int i = 0; i<6; i++) {
        UIButton *musicLessonsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        musicLessonsBtn.frame = CGRectMake(((CSCREEN_WIDTH-96.2*CEqualSixScale)/2+11.2*CEqualSixScale) * i , 0 , (CSCREEN_WIDTH-85*CEqualSixScale-11.2*CEqualSixScale)/2 , 72.3333*CEqualSixScale);
        [musicLessonsBtn setImage:[UIImage imageNamed:@"首页_03"] forState:UIControlStateNormal];

        musicLessonsBtn.tag = 100+i;
        [musicLessonsBtn.layer setCornerRadius:4.0];                        // 设置矩形四个圆角半径
        [musicLessonsBtn.layer setBorderWidth:2.0*CEqualSixScale];          // 边框宽度[[UIColorgreenColor]CGColor]
        [musicLessonsBtn.layer setBorderColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1].CGColor];
        musicLessonsBtn.layer.masksToBounds = YES;
        [learnMusicSV addSubview:musicLessonsBtn];
        
        UILabel *musicLessonsLbl = [[UILabel alloc]initWithFrame:CGRectMake(musicLessonsBtn.frame.origin.x, musicLessonsBtn.frame.size.height, musicLessonsBtn.frame.size.width, learnMusicSV.frame.size.height-musicLessonsBtn.frame.size.height)];
        musicLessonsLbl.text = @"钢琴提高班1999元";
        musicLessonsLbl.font = [UIFont systemFontOfSize:14*CEqualSixScale];
        musicLessonsLbl.textColor = [UIColor lightGrayColor];
        musicLessonsLbl.textAlignment = NSTextAlignmentCenter;
        [learnMusicSV addSubview:musicLessonsLbl];
    }

    _tableView.tableHeaderView = _subView;

}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    masterClassCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[masterClassCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.imgView.image = [UIImage imageNamed:@"首页_10"];
    cell.lblTitle.text = @"奥尔夫教学法";
    cell.lblPrice.text = @"50";
    cell.lblName.text  = @"马秋华";
    cell.lblsubtitle.text = @"解放军艺术学院声乐系教授";
    
    if (indexPath.row % 3 == 0) {
        cell.backgroundColor = [UIColor colorWithRed:244/255.0 green:176/255.0 blue:169/255.0 alpha:1];
    }else if (indexPath.row % 3 ==1){
        cell.backgroundColor = [UIColor colorWithRed:241/255.0 green:212/255.0 blue:164/255.0 alpha:1];
    }else if (indexPath.row % 3 ==2){
        cell.backgroundColor = [UIColor colorWithRed:183/255.0 green:220/255.0 blue:189/255.0 alpha:1];
    }
    if (indexPath.row == 0) {
        
        cell.backgroundColor = [UIColor clearColor];
        cell.layer.contents = (id) [UIImage imageNamed:@"home_master_00"].CGImage;
        cell.imgView.frame = CGRectMake(20*CEqualSixScale, 30*CEqualSixScale + (CSCREEN_WIDTH*0.972 - 254*CEqualSixScale), CSCREEN_WIDTH-(20*CEqualSixScale*2),
                                        (CSCREEN_WIDTH-(20*CEqualSixScale*2))*0.562);
        cell.lblTitle.frame = CGRectMake(cell.imgView.frame.origin.x, cell.imgView.frame.origin.y+cell.imgView.frame.size.height, 90*CEqualSixScale, 34*CEqualSixScale);
        cell.lblPrice.frame = CGRectMake(cell.lblTitle.frame.origin.x + cell.lblTitle.frame.size.width , cell.lblTitle.frame.origin.y, 40*CEqualSixScale, 34*CEqualSixScale);
        cell.lblName.frame = CGRectMake(cell.lblPrice.frame.origin.x + cell.lblPrice.frame.size.width , cell.lblPrice.frame.origin.y, 40*CEqualSixScale, 34*CEqualSixScale);
        cell.lblsubtitle.frame = CGRectMake(cell.lblName.frame.origin.x + cell.lblName.frame.size.width + 5*CEqualSixScale, cell.lblName.frame.origin.y, 165 * CEqualSixScale, 34*CEqualSixScale);
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        return CSCREEN_WIDTH*0.972;
        
    }else {
        
        return 254*CEqualSixScale;
    }
}

#pragma -mark table view delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 1) {
        
        liveTrailerViewController *liveTrailerVC = [[liveTrailerViewController alloc]init];
        
        [self presentViewController:liveTrailerVC animated:YES completion:nil];
        
    }else {
        CHBPlayVideoViewController *playVideoVC = [[CHBPlayVideoViewController alloc]init];
        
        [self.navigationController pushViewController:playVideoVC animated:YES];
    }

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


@end
