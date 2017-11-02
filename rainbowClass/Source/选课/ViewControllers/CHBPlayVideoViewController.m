//
//  CHBPlayVideoViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/24.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBPlayVideoViewController.h"
#import "YLImageView.h"
#import "YLGIFImage.h"
#import "HMSegmentedControl.h"
#import "classListCell.h"
#import "CHBTeacherHomePage.h"
#import "QCheckBox.h"               // 勾选框

@interface CHBPlayVideoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)YLImageView* imageView;
@property (strong, nonatomic) HMSegmentedControl *segmentedControl2;
@property (nonatomic,strong)UIScrollView * scrollView;
@property (nonatomic,strong)UIView *headView;
@property (nonatomic,strong)UITableView *classListTableView;//课时列表
@property(nonatomic,strong)UIImageView * LineImageView;
@property(nonatomic,strong)UIImageView * VideoImageView;
@property (nonatomic,strong) UILabel * courseNameLabel;
@property (nonatomic,strong) UILabel * livingLabel;
@property (nonatomic,strong) UILabel * teacherNameLabel;

@property (nonatomic,strong)UILabel * coureseFunctionLabel;
@property (nonatomic,strong)UILabel * coureseIntroduce;
@property (nonatomic,strong)UILabel * taskNeedLabel;

@property (nonatomic,strong)UIImageView *  teacherHeadImageView;
@property (nonatomic,strong)UIButton *  goTeacherPageBtn;
@property (nonatomic,strong)UILabel * teacherIntroduceContent;

@property (nonatomic,strong) UIView *viewBuy;                       // 购买蒙层
@property (nonatomic,strong) QCheckBox *check1;                    // 余额支付
@property (nonatomic,strong) QCheckBox *check2;                    // 微信支付
@property (nonatomic,strong) QCheckBox *check3;                    // 支付宝

@end

@implementation CHBPlayVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = CMAIN_Color;
    
    [self createheadImg];
    
    [self createInformation];
    
    [self createBuyView];
    
}
//头部
- (void)createheadImg {
    
    _imageView = [[YLImageView alloc] initWithFrame:CGRectMake(0, 20, CSCREEN_WIDTH, 211 * CEqualSixScale)];
    [self.view addSubview:_imageView];
    [_imageView setUserInteractionEnabled:YES];//使添加其上的button有点击事件
    _imageView.image = [YLGIFImage imageNamed:@"joy.gif"];
    
    //返回按钮
    UIButton *functionalBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *Image = [UIImage imageNamed:@"goBack"];
    functionalBtn.frame = CGRectMake(14 * CEqualSixScale, 34 * CEqualSixScale, Image.size.width*CEqualSixScale, Image.size.height*CEqualSixScale);
    [functionalBtn setImage:[UIImage imageNamed:@"goBack"] forState:UIControlStateNormal];
    [functionalBtn addTarget:self action:@selector(toBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:functionalBtn];
    
        [self addFunctionalBtnFrame:CGRectMake(162 * CEqualSixScale, 185 * CEqualSixScale, 50 * CEqualSixScale, 22 * CEqualSixScale) img:@"playVideo_collection" tag:1001];
        [self addFunctionalBtnFrame:CGRectMake(162 * CEqualSixScale + (50 * CEqualSixScale +1 * CEqualSixScale) * 1, 185 * CEqualSixScale, 50 * CEqualSixScale, 22 * CEqualSixScale) img:@"playVideo_share" tag:1002];
        [self addFunctionalBtnFrame:CGRectMake(162 * CEqualSixScale + (50 * CEqualSixScale +1 * CEqualSixScale)*2, 185 * CEqualSixScale, 50 * CEqualSixScale, 22 * CEqualSixScale) img:@"playVideo_audition" tag:1003];
        [self addFunctionalBtnFrame:CGRectMake(162 * CEqualSixScale + (50 * CEqualSixScale +1 * CEqualSixScale)*3, 185 * CEqualSixScale, 50 * CEqualSixScale, 22 * CEqualSixScale) img:@"playVideo_buy" tag:1004];
    
}

- (void)createInformation {
    //背景
    _headView = [[UIView alloc]initWithFrame:CGRectMake(0 , _imageView.frame.origin.y + _imageView.frame.size.height, 375 * CEqualSixScale, 189 * CEqualSixScale)];
    _headView.layer.contents = (id) [UIImage imageNamed:@"playVideo_bg"].CGImage; //这样设置背景能减小内存消耗
    [self.view addSubview:_headView];
    
    //头像
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(13.5 * CEqualSixScale, 213.5 * CEqualSixScale, 76 * CEqualSixScale, 76 * CEqualSixScale)];
    icon.image = [UIImage imageNamed:@"0012.jpg"];
    [icon.layer setMasksToBounds:YES];
    [icon.layer setCornerRadius:76 * CEqualSixScale / 2];//设置矩形四个圆角半径 professional
    [self.view addSubview:icon];
    //名字
    UILabel *nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(icon.frame.origin.x * 2 + icon.frame.size.width , 12 * CEqualSixScale, 60 * CEqualSixScale  , 20 * CEqualSixScale)];
    nameLbl.text = @"马秋华";
    nameLbl.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
    nameLbl.textColor = [UIColor whiteColor];
    [_headView addSubview:nameLbl];
    //professional
    UILabel *professionalLbl = [[UILabel alloc]initWithFrame:CGRectMake(nameLbl.frame.origin.x  + nameLbl.frame.size.width + 10 *CEqualSixScale , 12 * CEqualSixScale, 200 * CEqualSixScale  , 20 * CEqualSixScale)];
    professionalLbl.text = @"中国音乐学院声乐系教授";
    professionalLbl.font = [UIFont systemFontOfSize:14 *CEqualSixScale];
    professionalLbl.textColor = [UIColor whiteColor];
    [_headView addSubview:professionalLbl];
    //title
    UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(icon.frame.origin.x * 2 + icon.frame.size.width , 34 * CEqualSixScale, 160 * CEqualSixScale  , 20 * CEqualSixScale)];
    titleLbl.text = @"如何把握唱歌时的气息";
    titleLbl.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
    titleLbl.textColor = [UIColor whiteColor];
    [_headView addSubview:titleLbl];
    //price
    UILabel *priceLbl = [[UILabel alloc]initWithFrame:CGRectMake(titleLbl.frame.origin.x + titleLbl.frame.size.width , 34 * CEqualSixScale, 100 * CEqualSixScale  , 20 * CEqualSixScale)];
    priceLbl.text = @"500元";
    priceLbl.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
    priceLbl.textColor = [[UIColor alloc]initWithRed:255/255.f green:102/255.f blue:52/255.f alpha:1];
    [_headView addSubview:priceLbl];
    
    
    //本课知识
    _segmentedControl2 = [[HMSegmentedControl alloc]init];
    
    if (CSCREEN_WIDTH < 375) {
        UIImage *img1 = [UIImage imageNamed:@"320_playVideo_本课知识原始"];
        _segmentedControl2.frame = CGRectMake(34 * CEqualSixScale, titleLbl.bottom + 26 * CEqualSixScale, CSCREEN_WIDTH - 34 * CEqualSixScale * 2 + 10, img1.size.height);
        _segmentedControl2.sectionImages = @[[UIImage imageNamed:@"320_playVideo_本课知识原始"], [UIImage imageNamed:@"320_playVideo_课时列表原始"], [UIImage imageNamed:@"320_playVideo_老师介绍原始"]];
        _segmentedControl2.sectionSelectedImages = @[[UIImage imageNamed:@"320_playVideo_本课知识点击"], [UIImage imageNamed:@"320_playVideo_课时列表点击"], [UIImage imageNamed:@"320_playVideo_老师介绍点击"]];
    }else{
    UIImage *img1 = [UIImage imageNamed:@"playVideo_本课知识原始"];
    _segmentedControl2.frame = CGRectMake(34 * CEqualSixScale, titleLbl.bottom + 26 * CEqualSixScale, CSCREEN_WIDTH - 34 * CEqualSixScale * 2, img1.size.height);
    _segmentedControl2.sectionImages = @[[UIImage imageNamed:@"playVideo_本课知识原始"], [UIImage imageNamed:@"playVideo_课时列表原始"], [UIImage imageNamed:@"playVideo_老师介绍原始"]];
    _segmentedControl2.sectionSelectedImages = @[[UIImage imageNamed:@"playVideo_本课知识点击"], [UIImage imageNamed:@"playVideo_课时列表点击"], [UIImage imageNamed:@"playVideo_老师介绍点击"]];
    }
    _segmentedControl2.type = HMSegmentedControlTypeImages;
    _segmentedControl2.userInteractionEnabled = YES;
    _segmentedControl2.selectionIndicatorHeight = 0;
    _segmentedControl2.backgroundColor = [UIColor clearColor];
    _segmentedControl2.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _segmentedControl2.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    [_segmentedControl2 addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [_headView addSubview:_segmentedControl2];
    [self reloadMeCourseUI:3];
    
}

-(void)reloadMeCourseUI:(NSInteger)numPage{
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, _headView.bottom - 10 *CEqualSixScale , CSCREEN_WIDTH , CScreenHeight - _headView.bottom + 10 *CEqualSixScale )];
    _scrollView.contentSize = CGSizeMake(CSCREEN_WIDTH * numPage, CScreenHeight - _headView.bottom + 10 * CEqualSixScale);
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    __weak typeof(self) weakSelf = self;
    [_segmentedControl2 setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(self.scrollView.width * index , 0 , weakSelf.scrollView.width,weakSelf.scrollView.height) animated:YES];
    }];
    
    [self courseKnowledge];  //本课知识
    [self createClassList];  //课时列表
    [self teacherIntroduce]; //老师介绍
    
}
#pragma mark - 本课知识
-(void)courseKnowledge{
    UIScrollView * musicView1ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,self.scrollView.width, self.scrollView.height)];
    musicView1ScrollView.backgroundColor = [UIColor clearColor];
    musicView1ScrollView.showsHorizontalScrollIndicator = NO;
    musicView1ScrollView.showsVerticalScrollIndicator = NO;
    [_scrollView addSubview:musicView1ScrollView];

    self.teacherNameLabel = [VBase UILabelWithFrame:CGRectMake(0,0,self.scrollView.width, 20*CEqualSixScale) AndText:@"本课主讲马秋华" AndtextColor:[Util hexStringToColor:@"000000"] AndSuperView:musicView1ScrollView];
    self.teacherNameLabel.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    self.teacherNameLabel.textAlignment = NSTextAlignmentCenter;
    
    
    self.coureseFunctionLabel = [VBase UILabelWithFrame:CGRectMake(0,self.teacherNameLabel.bottom +8*CEqualSixScale,self.scrollView.width, 20*CEqualSixScale) AndText:@"如何锻炼孩子的基本能力" AndtextColor:[Util hexStringToColor:@"000000"] AndSuperView:musicView1ScrollView];
    self.coureseFunctionLabel.font = [UIFont systemFontOfSize:18 * CEqualSixScale];
    self.coureseFunctionLabel.textAlignment = NSTextAlignmentCenter;
    
    
    self.coureseIntroduce = [VBase UILabelWithFrame:CGRectMake(8 * CEqualSixScale,self.coureseFunctionLabel.bottom +10*CEqualSixScale,self.scrollView.width - 16 * CEqualSixScale, 20*CEqualSixScale) AndText:@"主要锻炼孩子们的基本能力" AndtextColor:[Util hexStringToColor:@"9f9f9f"] AndSuperView:musicView1ScrollView];
    self.coureseIntroduce.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    self.coureseIntroduce.numberOfLines = 0;
    
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont  systemFontOfSize:16*CEqualSixScale],NSFontAttributeName ,nil];
    
    NSString * str = @"音乐感受能力，包括音乐听觉和情绪感受两部分。如果先天缺乏听觉当然不可能有所感受。音乐感受能力，包括音乐听觉和情绪感受两部分。如果先天缺乏听觉当然不可能有所感受。音乐感受能力，包括音乐听觉和情绪感受两部分。如果先天缺乏听觉当然不可能有所感受。音乐感受能力，包括音乐听觉和情绪感受两部分。如果先天缺乏听觉当然不可能有所感受。包括音乐听觉和情绪感受两部分。如果先天缺乏听觉当然不可能有所感受。音乐感受能力，包括音乐听觉和情绪感受两部分。如果先天缺乏听觉当然不可能有所感受。";
    CGRect rect=  [str  boundingRectWithSize:CGSizeMake(self.scrollView.width - 16 * CEqualSixScale, 0) options:NSStringDrawingUsesLineFragmentOrigin  attributes:dic context:nil];
    self.coureseIntroduce.frame = CGRectMake(8 * CEqualSixScale,self.coureseFunctionLabel.bottom + 12*CEqualSixScale,self.scrollView.width-16*CEqualSixScale, rect.size.height);
    self.coureseIntroduce.text = str;
    musicView1ScrollView.contentSize = CGSizeMake(self.scrollView.width, _coureseIntroduce.bottom + 20*CEqualSixScale);
    
}

#pragma mark - 课时列表
-(void)createClassList{

    _classListTableView = [[UITableView alloc]initWithFrame:CGRectMake(self.scrollView.width, 5, self.scrollView.width, self.scrollView.height - 5)];
    _classListTableView.delegate = self;
    _classListTableView.dataSource = self;
    _classListTableView.showsVerticalScrollIndicator = NO;
    _classListTableView.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:_classListTableView];
    
}
//老师介绍
-(void)teacherIntroduce
{
    UIScrollView * musicView1ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(self.scrollView.width * 2,0,self.scrollView.width, self.scrollView.height)];
    musicView1ScrollView.backgroundColor = [UIColor clearColor];
    musicView1ScrollView.showsHorizontalScrollIndicator = NO;
    musicView1ScrollView.showsVerticalScrollIndicator = NO;
    [_scrollView addSubview:musicView1ScrollView];
    
    //老师头像
    _teacherHeadImageView = [VBase UIImageViewWithFrame:CGRectMake(113.5 * CEqualSixScale, 0, 149 * CEqualSixScale, 171.5 * CEqualSixScale) AndImageName:@"0012.jpg" AndbackgroundColor:[UIColor clearColor] AndSuperView:musicView1ScrollView];
    [_teacherHeadImageView.layer setMasksToBounds:YES];
    [_teacherHeadImageView.layer setCornerRadius:10.0];//设置矩形四个圆角半径
    //进入老师主页
    _goTeacherPageBtn = [VBase UIButtonWithFrame:CGRectMake(130.5 * CEqualSixScale, _teacherHeadImageView.bottom + 7.5 *CEqualSixScale, 113.5 * CEqualSixScale, 37 * CEqualSixScale) AndBackgroundImageName:@"playVideo_goTeacherPage" AndTitle:@"" AndTitleColor:nil AndSuperView:musicView1ScrollView];
    [_goTeacherPageBtn addTarget:self action:@selector(goTeacherPage) forControlEvents:UIControlEventTouchUpInside];
    //老师简介
    self.teacherIntroduceContent = [VBase UILabelWithFrame:CGRectMake(8 * CEqualSixScale,_goTeacherPageBtn.bottom + 16 * CEqualSixScale,self.scrollView.width - 16 * CEqualSixScale, 20*CEqualSixScale) AndText:@"" AndtextColor:[Util hexStringToColor:@"9f9f9f"] AndSuperView:musicView1ScrollView];
    self.teacherIntroduceContent.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    self.teacherIntroduceContent.numberOfLines = 0;
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont  systemFontOfSize:16*CEqualSixScale],NSFontAttributeName ,nil];
    NSString * str = @"音乐感受能力，包括音乐听觉和情绪感受两部分。如果先天缺乏听觉当然不可能有所感受。音乐感受能力，包括音乐听觉和情绪感受两部分。如果先天缺乏听觉当然不可能有所感受。音乐感受能力，包括音乐听觉和情绪感受两部分。如果先天缺乏听觉当然不可能有所感受。音乐感受能力，包括音乐听觉和情绪感受两部分。如果先天缺乏听觉当然不可能有所感受。";
    CGRect rect=  [str  boundingRectWithSize:CGSizeMake(self.scrollView.width - 16 * CEqualSixScale, 0) options:NSStringDrawingUsesLineFragmentOrigin  attributes:dic context:nil];
    self.teacherIntroduceContent.frame = CGRectMake(8 * CEqualSixScale,_goTeacherPageBtn.bottom + 16 * CEqualSixScale,self.scrollView.width - 16 * CEqualSixScale, rect.size.height);

    self.teacherIntroduceContent.text = str;
    musicView1ScrollView.contentSize = CGSizeMake(self.scrollView.width, _teacherIntroduceContent.bottom + 20*CEqualSixScale);
    
}
//进入老师主页
- (void)goTeacherPage {
    
    CHBTeacherHomePage * teacherVC = [[CHBTeacherHomePage alloc]init];
    
    [self.navigationController pushViewController:teacherVC animated:YES];

}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld", (long)segmentedControl.selectedSegmentIndex);
}

#pragma mark - UIScrollViewDelegate
 - (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
     if (scrollView==self.scrollView) {

    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;
    [_segmentedControl2 setSelectedSegmentIndex:page animated:YES];
     
     }
    
}


- (void)addFunctionalBtnFrame:(CGRect )frame img:(NSString *)img tag:(NSInteger)tag {
    UIButton *functionalBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    functionalBtn.frame = frame;
    
    functionalBtn.tag = tag;
    [functionalBtn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [functionalBtn addTarget:self action:@selector(clickFunctionalDetails:) forControlEvents:UIControlEventTouchUpInside];
    [_imageView addSubview:functionalBtn];
    
}

#pragma mark - 购买蒙层
- (void)createBuyView {
    
    _viewBuy = [VBase UIViewWithFrame:CGRectMake(0, 20, CSCREEN_WIDTH, CSCREEN_HEIGHT) Andalpha:1 AndborderWidth:0 AndborderColor:0 AndbackgroundColor:nil AndSuperView:self.view];
    _viewBuy.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    // 确认购买圆角ViewBG
    UIView *bgView = [VBase UIViewWithFrame:CGRectMake(74 * CEqualSixScale, 240 * CEqualSixScale, 227 * CEqualSixScale, 272 * CEqualSixScale) Andalpha:1 AndborderWidth:0 AndborderColor:nil AndbackgroundColor:[UIColor whiteColor] AndSuperView:_viewBuy];
    [bgView.layer setMasksToBounds:YES];
    [bgView.layer setCornerRadius:5.0];        //设置矩形四个圆角半径
    // 确认购买本课
    UILabel *lblTitle = [VBase UILabelWithFrame:CGRectMake(0, 0, bgView.frame.size.width, 44 * CEqualSixScale) AndText:@"确认购买本课" AndtextColor:nil AndSuperView:bgView];
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    lblTitle.backgroundColor = [Util hexStringToColor:@"f9f9f9"];
    
    NSArray *arrTitle = @[@" 余额支付",@" 微信支付",@" 支付宝"];
    
    for (int i = 0; i < [arrTitle count]; i++) {
        // 勾选框
        QCheckBox *check = [[QCheckBox alloc] initWithDelegate:self];
        check.tag = 100 + i;
        check.frame = CGRectMake(68 * CEqualSixScale , (64 + 40 * i) * CEqualSixScale , 100 * CEqualSixScale, 20 * CEqualSixScale);
        [check setTitle:arrTitle[i] forState:UIControlStateNormal];
        [check setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [check.titleLabel setFont:[UIFont systemFontOfSize:16.0 * CEqualSixScale]];
        [check setImage:[UIImage imageNamed:@"checkbox_meixuanzhong"] forState:UIControlStateNormal];
        [check setImage:[UIImage imageNamed:@"checkbox_xuanzhong"] forState:UIControlStateSelected];
        [bgView addSubview:check];
        [check setChecked:NO];
    }
    
    UIButton *btnCancel = [VBase UIButtonWithFrame:CGRectMake(14 * CEqualSixScale, 196 * CEqualSixScale, 81.5 * CEqualSixScale, 37 * CEqualSixScale) AndBackgroundImageName:@"buy_cancel" AndTitle:nil AndTitleColor:nil AndSuperView:bgView];
    
    UIButton *btnGoumai = [VBase UIButtonWithFrame:CGRectMake(btnCancel.right + 35 * CEqualSixScale, 196 * CEqualSixScale, 81.5 * CEqualSixScale, 37 * CEqualSixScale) AndBackgroundImageName:@"buy_goumai" AndTitle:nil AndTitleColor:nil AndSuperView:bgView];
    
}

- (void)toBack {
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 * 跳转到功能详情页（收藏、分享、试听、购买）
 */
- (void)clickFunctionalDetails:(UIButton *)sender {
    NSLog(@"toFunctionalDetails-----%ld",(long)sender.tag);
    if (sender.tag == 1001) {               // 收藏
        
    }else if (sender.tag == 1002){          // 分享
        
    }else if (sender.tag == 1003){          // 试听
        
    }else if (sender.tag == 1004){          // 购买
        
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

#pragma mark - QCheckBoxDelegate
- (void)didSelectedCheckBox:(QCheckBox *)checkbox checked:(BOOL)checked {
    NSLog(@"did tap on CheckBox:%@ checked:%d", checkbox.titleLabel.text, checked);
    if (checked==0) {
        NSLog(@"取消打钩");
    }else{
        NSLog(@"打钩");
    }
    
    if (checkbox.tag == 101) {
        if (checkbox.tag != 101) {
            [checkbox setChecked:NO];
        }
    }
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    classListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[classListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.lblChapter.text = @"第一章第10节";
    cell.lblTitle.text = @"声带的合理运营";
    cell.lblPrice.text = @"50元";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        return 43*CEqualSixScale;
}

#pragma -mark table view delegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //实例化目标对象将block传入
    CHBPlayVideoViewController *playVideoVC = [[CHBPlayVideoViewController alloc]init];
    //跳转
    [self.navigationController pushViewController:playVideoVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
