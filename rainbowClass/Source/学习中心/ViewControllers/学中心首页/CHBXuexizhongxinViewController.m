//
//  CHBXuexizhongxinViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBXuexizhongxinViewController.h"
#import "CHBLoginViewController.h"
#import "CHBUserDataCenter.h"
#import "LiveCourseCell.h"
#import "MeCourseCell.h"
#import "GBPathImageView.h"
#import "MCBarChartView.h"
#import "CHBMessagesViewController.h"  // 消息


#import "MusicTableViewCell.h"
#import "MistakesTableViewCell.h"


@interface CHBXuexizhongxinViewController ()<MCBarChartViewDataSource, MCBarChartViewDelegate>
{

}

@property (nonatomic,strong)NSMutableDictionary *  mutableDic;


@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (strong, nonatomic) MCBarChartView *barChartView;

@property (strong, nonatomic) NSArray *titles2;
@property (strong, nonatomic) NSMutableArray *dataSource2;
@property (strong, nonatomic) MCBarChartView *barChartView2;
@end

@implementation CHBXuexizhongxinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = [Util hexStringToColor:@"6dd6fe"];
    self.title = @"学习中心";
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.viewWidth = CGRectGetWidth(self.view.frame);
    
    
    self.mutableDic  = [[NSMutableDictionary alloc]initWithCapacity:1];
    
    [self initLearnCenterTableView];
}



-(void)viewWillAppear:(BOOL)animated
{

    self.navigationController.navigationBar.hidden = YES;


}



-(void)initLearnCenterTableView
{
    _learnCenterTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.bounds.origin.x,self.view.bounds.origin.y+20,self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _learnCenterTableView.backgroundColor = [Util hexStringToColor:@"6dd6fe"];
    _learnCenterTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _learnCenterTableView.delegate = self;
    _learnCenterTableView.dataSource = self;
    [self.view addSubview:_learnCenterTableView];
    
    
    [self reloadHeadView];
    
}




-(void)reloadHeadView
{
//    //-----头像------
//    @property (nonatomic,strong)UIImageView * personHeadImageView;
//    @property (nonatomic,strong)UILabel * nameLabel;
//    @property (nonatomic,strong)UIImageView * starImageView;
//    @property (nonatomic,strong)UILabel * GradeNumLabel;
//    
//    
//    
//    
//    //-------消息----
//    @property (nonatomic,strong)UIImageView * messageImageView;
//    @property (nonatomic,strong)UIImageView * messageStarImageView;


    
    

    self.headBackGroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 486)];
    _headBackGroundImageView.image = [UIImage imageNamed:@"yunceng_bg.png"];
    _headBackGroundImageView.userInteractionEnabled = YES;
    _learnCenterTableView.tableHeaderView = _headBackGroundImageView;
    
    
    
    self.personHeadImageView = [[GBPathImageView alloc] initWithFrame:CGRectMake(CScreenWidth / 2 - 57.5 * CEqualSixScale, 15 * CEqualSixScale, 115 * CEqualSixScale, 115 * CEqualSixScale) image:[UIImage imageNamed:@"headImage.png"]];
    _personHeadImageView.backgroundColor = [UIColor redColor];
    _personHeadImageView.layer.masksToBounds = YES;
    _personHeadImageView.layer.cornerRadius = 57.5*CEqualSixScale;
    [_headBackGroundImageView addSubview:_personHeadImageView];
    
    
    
    self.nameLabel = [VBase UILabelWithFrame:CGRectMake(133*CEqualSixScale,self.personHeadImageView.bottom+13*CEqualSixScale,53*CEqualSixScale, 20*CEqualSixScale) AndText:@"张晓明" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:_headBackGroundImageView];
    _nameLabel.font = [UIFont systemFontOfSize:16*CEqualSixScale];
    
    
    
    
    self.starImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.nameLabel.right, self.personHeadImageView.bottom+13*CEqualSixScale, 16*CEqualSixScale, 16*CEqualSixScale)];
    _starImageView.image = [UIImage imageNamed:@"xing.png"];
    [_headBackGroundImageView addSubview:_starImageView];
    
    
    
    self.GradeNumLabel = [VBase UILabelWithFrame:CGRectMake(_starImageView.right,self.personHeadImageView.bottom+13*CEqualSixScale,20*CEqualSixScale, 20*CEqualSixScale) AndText:@"96" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:_headBackGroundImageView];
    _GradeNumLabel.font = [UIFont systemFontOfSize:16*CEqualSixScale];
    
    
    self.messageImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.personHeadImageView.right+17.5*CEqualSixScale, 15 * CEqualSixScale, 26*CEqualSixScale, 21*CEqualSixScale)];
    _messageImageView.image = [UIImage imageNamed:@"huifu.png"];
    _messageImageView.userInteractionEnabled  = YES;
    [_headBackGroundImageView addSubview:_messageImageView];
    
    UITapGestureRecognizer * messageTap = [[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(messageTap)];
    [_messageImageView addGestureRecognizer:messageTap];
    
    
    self.messageStarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(18*CEqualSixScale, 0, 7*CEqualSixScale, 7*CEqualSixScale)];
    _messageStarImageView.image = [UIImage imageNamed:@"huifu_dian.png"];
    [_messageImageView addSubview:_messageStarImageView];
    [_messageImageView addGestureRecognizer:messageTap];
    
    
    
    
    [self reloadSegmentController];
    
    

}



// 消息
-(void)messageTap
{
//    // 进入消息页面
    CHBMessagesViewController *messageVC = [CHBMessagesViewController new];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:messageVC];

//    [self.navigationController pushViewController:messageVC animated:YES];
    [self presentViewController:nav animated:YES completion:nil];
}


-(void)reloadSegmentController
{
    
    
    self.segmentedControl = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(0, 219, _viewWidth, 25)];
    self.segmentedControl.sectionTitles = @[@"点评记录", @"音乐素养", @"错误汇总"];
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.backgroundColor = CWhiteColor;
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [Util hexStringToColor:@"655241"],NSFontAttributeName:[UIFont systemFontOfSize:14]};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [Util hexStringToColor:@"70cbf2"]};
    self.segmentedControl.selectionIndicatorColor =[Util hexStringToColor:@"70cbf2"];
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentedControl.selectionIndicatorBoxOpacity = 0.01;
    self.segmentedControl.selectionIndicatorHeight = 0;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl.tag = 3;
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(weakSelf.viewWidth * index, 0, weakSelf.viewWidth, CSCREEN_HEIGHT-35) animated:YES];
    }];
    
    [_headBackGroundImageView addSubview:self.segmentedControl];
    [self reloadMeCourseUI:3];

    
}





-(void)reloadMeCourseUI:(NSInteger)numPage
{
    
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.segmentedControl.bottom, _viewWidth,234*CEqualSixScale)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(_viewWidth * numPage, 234*CEqualSixScale);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(0, 0, _viewWidth, 234*CEqualSixScale) animated:NO];
    [_headBackGroundImageView addSubview:self.scrollView];
    
    
    
    [self reloadNewScoreView];
    [self reloadMusicUI];
    [self relodAllMistakes];
    
    
    
    
}

-(void)reloadMusicUI{


    UIView * musicView = [[UIView alloc] initWithFrame:CGRectMake(_viewWidth, 0,_viewWidth,234*CEqualSixScale)];
    musicView.tag = 1003;
//    musicView.backgroundColor = [UIColor grayColor];
    [self.scrollView addSubview:musicView];
    
    
    
    self.musicTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 30*CEqualSixScale,_viewWidth,234*CEqualSixScale) style:UITableViewStylePlain];
//    _musicTableView.backgroundColor = [UIColor orangeColor];
    self.musicTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _musicTableView.delegate = self;
    _musicTableView.dataSource = self;
    [musicView addSubview:_musicTableView];


}




-(void)relodAllMistakes
{
    UIView * mistakeView = [[UIView alloc] initWithFrame:CGRectMake(_viewWidth*2, 0,_viewWidth,234*CEqualSixScale)];
    mistakeView.tag = 1003;
    mistakeView.backgroundColor = [UIColor lightGrayColor];
    [self.scrollView addSubview:mistakeView];
    
    
    
    // 类型
    UILabel * kindNameLabel = [VBase UILabelWithFrame:CGRectMake(10*CEqualSixScale,30*CEqualSixScale,40*CEqualSixScale, 20*CEqualSixScale) AndText:@"类型" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:mistakeView];
    kindNameLabel.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
    
    // 次数
    UILabel * frequencyName = [VBase UILabelWithFrame:CGRectMake(kindNameLabel.right + 40*CEqualSixScale,19*CEqualSixScale,40*CEqualSixScale, 20*CEqualSixScale) AndText:@"次数" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:mistakeView];
    //
    UILabel * mistakeLevelName = [VBase UILabelWithFrame:CGRectMake(frequencyName.right+40*CEqualSixScale,19*CEqualSixScale, 80*CEqualSixScale, 20*CEqualSixScale) AndText:@"错误程度" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:mistakeView];
    mistakeLevelName.font = [UIFont systemFontOfSize:16*CEqualSixScale];
    //
   UILabel * relatedTeachingName = [VBase UILabelWithFrame:CGRectMake(mistakeLevelName.right+40*CEqualSixScale,19*CEqualSixScale,80*CEqualSixScale, 20*CEqualSixScale) AndText:@"相关教学" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:mistakeView];
    relatedTeachingName.font = [UIFont systemFontOfSize:16*CEqualSixScale];

    
    
    self.mistakesTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 65*CEqualSixScale,_viewWidth,234*CEqualSixScale) style:UITableViewStylePlain];
//    _mistakesTableView.backgroundColor = [UIColor orangeColor];
    self.mistakesTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _mistakesTableView.delegate = self;
    _mistakesTableView.dataSource = self;
//    [mistakeView addSubview:self.mistakesTableView];
    



}













#pragma --mark-----
#pragma --mark-----直播课程成绩记录柱状图---------
-(void)reloadNewScoreView
{
    UIView * contentTableView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,_viewWidth,234*CEqualSixScale)];
    contentTableView.tag = 1000;
    [self.scrollView addSubview:contentTableView];
    
    
    
    self.avgScoreColor = [VBase UILabelWithFrame:CGRectMake(20*CEqualSixScale,30*CEqualSixScale,26*CEqualSixScale, 15*CEqualSixScale) AndText:nil AndtextColor:nil AndSuperView:contentTableView];
    _avgScoreColor.backgroundColor = [Util hexStringToColor:@"fe6626"];
    
    
    
    self.avgScoreName = [VBase UILabelWithFrame:CGRectMake(self.avgScoreColor.right+4,30*CEqualSixScale,50*CEqualSixScale, 15*CEqualSixScale) AndText:@"平均成绩" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:contentTableView];
    _avgScoreName.font = [UIFont systemFontOfSize:12];
    
    
    
    self.meScoreColor = [VBase UILabelWithFrame:CGRectMake(self.avgScoreName.right + 51*CEqualSixScale,30*CEqualSixScale,26*CEqualSixScale, 15*CEqualSixScale) AndText:nil AndtextColor:nil AndSuperView:contentTableView];
    _meScoreColor.backgroundColor = [Util hexStringToColor:@"86defd"];
    
    
    
    self.meScoreName = [VBase UILabelWithFrame:CGRectMake(self.meScoreColor.right+4,30*CEqualSixScale,50*CEqualSixScale, 15*CEqualSixScale) AndText:@"我的成绩" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:contentTableView];
    _meScoreName.font = [UIFont systemFontOfSize:12];
    

    
    _titles2 = @[@"1", @"2", @"3", @"4", @"5", @"6"];
    _dataSource2 = [NSMutableArray arrayWithArray:@[@[@10, @100], @[@100, @80], @[@100, @50], @[@100, @70], @[@100, @90], @[@100, @100]]];
    _barChartView2 = [[MCBarChartView alloc] initWithFrame:CGRectMake(0, self.meScoreName.bottom,_viewWidth,200*CEqualSixScale)];
    _barChartView.backgroundColor = [UIColor purpleColor];
    _barChartView2.tag = 222;
    _barChartView2.dataSource = self;
    _barChartView2.delegate = self;
    _barChartView2.maxValue = @100;
    _barChartView2.unitOfYAxis = @"";
    _barChartView2.numberOfYAxis = 4;
    _barChartView2.colorOfXAxis = [Util hexStringToColor:@"655241"];
    _barChartView2.colorOfXText = [Util hexStringToColor:@"655241"];
    _barChartView2.colorOfYAxis = [Util hexStringToColor:@"655241"];
    _barChartView2.colorOfYText = [Util hexStringToColor:@"655241"];
    [contentTableView addSubview:_barChartView2];
    [_barChartView2 reloadDataWithAnimate:NO];


}






- (void)refreshData {
    
    [_dataSource2 removeAllObjects];
    for (NSInteger i = 0; i < _titles2.count; i ++) {
        NSMutableArray *mutableArray = [NSMutableArray array];
        for (NSInteger i = 0; i < 2; i ++) {
            [mutableArray addObject:@(arc4random()%150)];
        }
        [_dataSource2 addObject:mutableArray];
    }
    [_barChartView2 reloadData];
}

- (NSInteger)numberOfSectionsInBarChartView:(MCBarChartView *)barChartView {
   
        return [_dataSource2 count];
    
}

- (NSInteger)barChartView:(MCBarChartView *)barChartView numberOfBarsInSection:(NSInteger)section {
   
        return [_dataSource2[section] count];
}

- (id)barChartView:(MCBarChartView *)barChartView valueOfBarInSection:(NSInteger)section index:(NSInteger)index {
  
        return _dataSource2[section][index];
}

- (UIColor *)barChartView:(MCBarChartView *)barChartView colorOfBarInSection:(NSInteger)section index:(NSInteger)index {
   
        if (index == 0) {
            return [Util hexStringToColor:@"fe6626"];
        }
        return [Util hexStringToColor:@"86defd"];
}

- (NSString *)barChartView:(MCBarChartView *)barChartView titleOfBarInSection:(NSInteger)section {
    return _titles2[section];
}

//- (NSString *)barChartView:(MCBarChartView *)barChartView informationOfBarInSection:(NSInteger)section index:(NSInteger)index {
//
////        if ([_dataSource2[section] floatValue] >= 130) {
////            return @"优秀";
////        } else if ([_dataSource2[section] floatValue] >= 110) {
////            return @"良好";
////        } else if ([_dataSource2[section] floatValue] >= 90) {
////            return @"及格";
////        } else {
////            return @"不及格";
////        }
//
//}

- (CGFloat)barWidthInBarChartView:(MCBarChartView *)barChartView {
    if (barChartView.tag == 111) {
        return 26;
    } else {
        return 26;
    }
}

- (CGFloat)paddingForSectionInBarChartView:(MCBarChartView *)barChartView {
    if (barChartView.tag == 111) {
        return 24;
    } else {
        return 12;
    }
}










#pragma -----mark--
#pragma -----mark--tableViewDelegrate----------

//tableView 中区的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if (tableView == _learnCenterTableView) {
        return 1;

    }
    else if (tableView == _mistakesTableView)
    {
    
    
        return 1;

    }
    else
    {
    
        return 1;

    
    }
    
}
//每个区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView == _learnCenterTableView) {
        return 2;
        
    }
    else if (tableView == _musicTableView)
    {
        
        
        return 5;
        
    }
    else
    {
        
        return 5;
        
        
    }
    
    
    
}



//创建cell并向cell中传值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (tableView == _learnCenterTableView) {
        NSLog(@"indexPath.row = %ld",(long)indexPath.row);
        
        if (indexPath.row == 0)
        {
            static NSString *  CellIdentifier = @"liveCourseCell";
            LiveCourseCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil)
            {
                cell = [[LiveCourseCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                             reuseIdentifier:CellIdentifier];
            }
            
            
            
            //设置选中时的效果为None;
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
        }
        
        
        static NSString *  CellIdentifier = @"MeCourseCell";
        MeCourseCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            cell = [[MeCourseCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                       reuseIdentifier:CellIdentifier];
        }
        
        
        
        //设置选中时的效果为None;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
        
        
    }
    else if (tableView == _musicTableView)
    {
        
        
  
            static NSString *  CellIdentifier = @"MusicTabCell";
             MusicTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (cell == nil)
            {
                cell = [[MusicTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                             reuseIdentifier:CellIdentifier];
            }
            //设置选中时的效果为None;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            
        
    }
    else
    {
        
        static NSString *  CellIdentifier = @"mistakeCell";
        MistakesTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            cell = [[MistakesTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                          reuseIdentifier:CellIdentifier];
        }
//        cell.backgroundColor = [UIColor yellowColor];
        //设置选中时的效果为None;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
        
    }

    
}






//cell的自适应高度;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    if (tableView == _learnCenterTableView) {
        
        if (indexPath.row == 0) {
            return 186*CEqualSixScale;
            
        }
        else
        {
            return self.view.bounds.size.height-64;
            
        }
    }
    else if (tableView == _musicTableView)
    {
        return 58.5*CEqualSixScale;
    }
    else
    {
return 58.5*CEqualSixScale;    
    }
    
    
}




#pragma mark - 是否登录
- (BOOL)isLogined
{
    if (![[CHBUserDataCenter sharedInstance]isLoggedIn]) {
        UIViewController *controller = [CHBLoginViewController loginViewContoller];
        
        [self presentViewController:controller animated:YES completion:nil];
        
        return NO;
    }
    
    return YES;
}




- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld", (long)segmentedControl.selectedSegmentIndex);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    
    [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
