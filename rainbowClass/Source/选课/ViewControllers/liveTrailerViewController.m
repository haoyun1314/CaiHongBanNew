//
//  liveTrailerViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/3.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "liveTrailerViewController.h"
#import "HMSegmentedControl.h"
#import "AppDelegate.h"  
#import "CHBTeacherHomePage.h"          // 老师个人主页


@interface liveTrailerViewController () <UIScrollViewDelegate>
{
    BOOL isBtnYuyue;        // 预约/取消预约
}

@property (nonatomic,strong) UILabel * teacherNameLabel;
@property (nonatomic,strong)UILabel * coureseFunctionLabel;
@property (nonatomic,strong)UILabel * coureseIntroduce;

@property (nonatomic,strong)UIImageView *  teacherHeadImageView;
@property (nonatomic,strong)UILabel *  teacherName;
@property (nonatomic,strong)UILabel * teacherIntroduceContent;

@property (strong, nonatomic) HMSegmentedControl *segmentedVC;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIView *centerView;               // 中心View
@property (strong, nonatomic) UIButton *btnYuyue;               // 预约按钮
@property (strong, nonatomic) UIImageView *imgSuccess;          // 预约按钮

@end

@implementation liveTrailerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.layer.contents = (id) [UIImage imageNamed:@"liveTrailer_bg"].CGImage; //这样设置背景能减小内存消耗
    
    // 横屏
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.allowRotation = 1;
    
    [self setupViews];
    
    [self reloadSegmentVC];
    
}

// 设置视图
- (void)setupViews{
    // 返回按钮
    UIButton *functionalBtn = [VBase UIButtonWithFrame:CGRectMake(14 * CEqualSixScale, 30 * CEqualSixScale, 15*CEqualSixScale, 24*CEqualSixScale) AndBackgroundImageName:@"goBack" AndTitle:nil AndTitleColor:nil AndSuperView:self.view];
    [functionalBtn addTarget:self action:@selector(toBack) forControlEvents:UIControlEventTouchUpInside];

    _centerView = [VBase UIViewWithFrame:CGRectMake(70 * CEqualSixScale, 40 * CEqualSixScale, 555.5 * CEqualSixScale, 310 * CEqualSixScale) Andalpha:1 AndborderWidth:0 AndborderColor:0 AndbackgroundColor:nil AndSuperView:self.view];
    _centerView.layer.contents = (id) [UIImage imageNamed:@"liveTrailer_centerBg"].CGImage; //这样设置背景能减小内存消耗
    
    _btnYuyue = [VBase UIButtonWithFrame:CGRectMake(186 * CEqualSixScale, 260 * CEqualSixScale, 113.5 * CEqualSixScale , 37 * CEqualSixScale) AndBackgroundImageName:@"live_yuyue" AndTitle:nil AndTitleColor:nil AndSuperView:_centerView];
    [_btnYuyue setImage:[UIImage imageNamed:@"live_yuyue_h"] forState:UIControlStateHighlighted];
    [_btnYuyue addTarget:self action:@selector(yuyue) forControlEvents:UIControlEventTouchUpInside];
    
    
    _imgSuccess = [VBase UIImageViewWithFrame:CGRectMake(0, 0, 410.5 * CEqualSixScale, 350 * CEqualSixScale) AndImageName:@"live_success" AndbackgroundColor:nil AndSuperView:self.view];
    _imgSuccess.userInteractionEnabled = YES;
    _imgSuccess.center = CGPointMake(_centerView.center.x - 40 * CEqualSixScale, _centerView.center.y - 10 * CEqualSixScale);
    // 也越成功页面 关闭
    UIButton *btnClose = [VBase UIButtonWithFrame:CGRectMake(300 * CEqualSixScale, 110 * CEqualSixScale, 18 * CEqualSixScale, 18 * CEqualSixScale) AndBackgroundImageName:@"live_close" AndTitle:nil AndTitleColor:nil AndSuperView:_imgSuccess];
    [btnClose addTarget:self action:@selector(closeImgSuccess) forControlEvents:UIControlEventTouchUpInside];
    _imgSuccess.hidden = YES;
    
}

-(void)reloadSegmentVC{
    
    //本课知识
    _segmentedVC = [[HMSegmentedControl alloc]init];

    UIImage *img1 = [UIImage imageNamed:@"playVideo_本课知识原始"];
    _segmentedVC.frame = CGRectMake(34 * CEqualSixScale, 40 * CEqualSixScale, _centerView.frame.size.width - 70 * CEqualSixScale * 2, img1.size.height);
    _segmentedVC.sectionImages = @[[UIImage imageNamed:@"playVideo_本课知识原始"],[UIImage imageNamed:@"playVideo_老师介绍原始"]];
    _segmentedVC.sectionSelectedImages = @[[UIImage imageNamed:@"playVideo_本课知识点击"], [UIImage imageNamed:@"playVideo_老师介绍点击"]];
    
    _segmentedVC.type = HMSegmentedControlTypeImages;
    _segmentedVC.userInteractionEnabled = YES;
    _segmentedVC.selectionIndicatorHeight = 0;
    _segmentedVC.backgroundColor = [UIColor clearColor];
    _segmentedVC.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _segmentedVC.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    [_segmentedVC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    [_centerView addSubview:_segmentedVC];
    [self reloadMeCourseUI:2];
    
}

-(void)reloadMeCourseUI:(NSInteger)numPage{
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100 *CEqualSixScale , _centerView.frame.size.width - 64 * CEqualSixScale ,  140 *CEqualSixScale )];
    _scrollView.contentSize = CGSizeMake((_centerView.frame.size.width - 64 * CEqualSixScale) * numPage, 140 *CEqualSixScale);
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [_centerView addSubview:self.scrollView];
    
    __weak typeof(self) weakSelf = self;
    [_segmentedVC setIndexChangeBlock:^(NSInteger index) {
 
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(self.scrollView.width * index , 0 , weakSelf.scrollView.width,weakSelf.scrollView.height) animated:YES];

    }];

    [self courseKnowledge];  //本课知识
    [self teacherIntroduce]; //老师介绍

}

-(void)courseKnowledge{

    UIScrollView * musicView1ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0,_scrollView.width, _scrollView.height)];
    musicView1ScrollView.backgroundColor = [UIColor clearColor];
    musicView1ScrollView.showsHorizontalScrollIndicator = YES;
    musicView1ScrollView.showsVerticalScrollIndicator = YES;
    [_scrollView addSubview:musicView1ScrollView];
    
    self.teacherNameLabel = [VBase UILabelWithFrame:CGRectMake(0,20 * CEqualSixScale,self.scrollView.width, 20*CEqualSixScale) AndText:@"本课主讲马秋华" AndtextColor:[Util hexStringToColor:@"000000"] AndSuperView:musicView1ScrollView];
    self.teacherNameLabel.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    self.teacherNameLabel.textAlignment = NSTextAlignmentCenter;
    
    
    self.coureseFunctionLabel = [VBase UILabelWithFrame:CGRectMake(0,self.teacherNameLabel.bottom +8*CEqualSixScale,self.scrollView.width, 20*CEqualSixScale) AndText:@"如何锻炼孩子的基本能力" AndtextColor:[Util hexStringToColor:@"000000"] AndSuperView:musicView1ScrollView];
    self.coureseFunctionLabel.font = [UIFont systemFontOfSize:18 * CEqualSixScale];
    self.coureseFunctionLabel.textAlignment = NSTextAlignmentCenter;
    
    
    self.coureseIntroduce = [VBase UILabelWithFrame:CGRectMake(8 * CEqualSixScale,self.coureseFunctionLabel.bottom +10*CEqualSixScale,self.scrollView.width - 16 * CEqualSixScale, 20*CEqualSixScale) AndText:@"主要锻炼孩子们的基本能力" AndtextColor:[UIColor whiteColor] AndSuperView:musicView1ScrollView];
    self.coureseIntroduce.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    self.coureseIntroduce.numberOfLines = 0;
    
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont  systemFontOfSize:16*CEqualSixScale],NSFontAttributeName ,nil];
    
    NSString * str = @"音乐感受能力，包括音乐听觉和情绪感受两部分。音乐感受能力，包括音乐听觉和情绪感受两部分。音乐感受能力，包括音乐听觉和情绪感受两部分。";
    CGRect rect=  [str  boundingRectWithSize:CGSizeMake(self.scrollView.width - 16 * CEqualSixScale, 0) options:NSStringDrawingUsesLineFragmentOrigin  attributes:dic context:nil];
    self.coureseIntroduce.frame = CGRectMake(8 * CEqualSixScale,self.coureseFunctionLabel.bottom + 12*CEqualSixScale,self.scrollView.width-16*CEqualSixScale, rect.size.height);
    self.coureseIntroduce.text = str;
    musicView1ScrollView.contentSize = CGSizeMake(self.scrollView.width, _coureseIntroduce.bottom + 20*CEqualSixScale);
}

-(void)teacherIntroduce{

    UIScrollView * musicView1ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(_scrollView.width,0,_scrollView.width, _scrollView.height)];
    musicView1ScrollView.backgroundColor = [UIColor clearColor];
    musicView1ScrollView.showsHorizontalScrollIndicator = YES;
    musicView1ScrollView.showsVerticalScrollIndicator = YES;
    [_scrollView addSubview:musicView1ScrollView];

    
    self.teacherHeadImageView = [[UIImageView alloc]initWithFrame:CGRectMake(200*CEqualSixScale, 14*CEqualSixScale,74*CEqualSixScale,74*CEqualSixScale)];
    self.teacherHeadImageView.image = [UIImage imageNamed:@"0012.jpg"];
    [_teacherHeadImageView.layer setMasksToBounds:YES];
    [_teacherHeadImageView.layer setCornerRadius:5.0];//设置矩形四个圆角半径
    [musicView1ScrollView addSubview:_teacherHeadImageView];
    
    UIButton *btnGoTeacherPage = [VBase UIButtonWithFrame:CGRectMake(0, 0, 100 * CEqualSixScale, 20 * CEqualSixScale) AndBackgroundImageName:nil AndTitle:@"进入老师主页" AndTitleColor:[Util hexStringToColor:@"ff6634"] AndSuperView:musicView1ScrollView];
    btnGoTeacherPage.center = CGPointMake(_teacherHeadImageView.center.x, _teacherHeadImageView.bottom + 18 * CEqualSixScale);
    [btnGoTeacherPage addTarget:self action:@selector(goTeacherHomePage) forControlEvents:UIControlEventTouchUpInside];
    
    self.teacherName = [VBase UILabelWithFrame:CGRectMake(0,btnGoTeacherPage.bottom +10*CEqualSixScale,self.scrollView.width, 20*CEqualSixScale) AndText:@"韩寒 中国音乐老师" AndtextColor:[Util hexStringToColor:@"000000"] AndSuperView:musicView1ScrollView];
    self.teacherName.font = [UIFont systemFontOfSize:16*CEqualSixScale];
    self.teacherName.textAlignment = NSTextAlignmentCenter;
    
    
    self.teacherIntroduceContent = [VBase UILabelWithFrame:CGRectMake(0,self.teacherName.bottom +10*CEqualSixScale,self.scrollView.width, 20*CEqualSixScale) AndText:@"主要锻炼孩子们的基本能力" AndtextColor:[Util hexStringToColor:@"000000"] AndSuperView:musicView1ScrollView];
    self.teacherIntroduceContent.font = [UIFont systemFontOfSize:14*CEqualSixScale];
    self.teacherIntroduceContent.numberOfLines = 0;
    self.teacherIntroduceContent.textAlignment = NSTextAlignmentLeft;
    
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont  systemFontOfSize:14*CEqualSixScale],NSFontAttributeName ,nil];
    
    
    
    NSString * str = @"音乐感受能力，包括音乐听觉和情绪感受两部分。音乐感受能力，包括音乐听觉和情绪感受两部分。音乐感受能力，包括音乐听觉和情绪感受两部分。 ";
    CGRect rect=  [str  boundingRectWithSize:CGSizeMake(self.scrollView.width, 0) options:NSStringDrawingUsesLineFragmentOrigin  attributes:dic context:nil];
    self.teacherIntroduceContent.frame = CGRectMake(0,self.teacherName.bottom +10*CEqualSixScale,self.scrollView.width, rect.size.height);
    self.teacherIntroduceContent.text = str;
    
    musicView1ScrollView.contentSize = CGSizeMake(self.scrollView.width, _teacherIntroduceContent.bottom + 20*CEqualSixScale);

}


- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}

- (void)yuyue {
    NSLog(@"预约");
    _imgSuccess.hidden = NO;
    if (isBtnYuyue) {
        [_btnYuyue setImage:[UIImage imageNamed:@"live_yuyue"] forState:UIControlStateNormal];
        [_btnYuyue setImage:[UIImage imageNamed:@"live_yuyue_h"] forState:UIControlStateHighlighted];
        _imgSuccess.image = [UIImage imageNamed:@"live_cancel"];
        isBtnYuyue = NO;
    }else{
        [_btnYuyue setImage:[UIImage imageNamed:@"live_cancelYuyue"] forState:UIControlStateNormal];
        [_btnYuyue setImage:[UIImage imageNamed:@"live_cancelYuyue_l"] forState:UIControlStateHighlighted];
        _imgSuccess.image = [UIImage imageNamed:@"live_success"];
        isBtnYuyue = YES;
    }
}

- (void)closeImgSuccess {
    _imgSuccess.hidden = YES;
}

- (void)toBack {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)goTeacherHomePage {
    
    CHBTeacherHomePage *teacherHomePage = [CHBTeacherHomePage new];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:teacherHomePage];

    [self presentViewController:nav animated:YES completion:nil];
    
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (scrollView==self.scrollView) {
        
        CGFloat pageWidth = scrollView.frame.size.width;
        NSInteger page = scrollView.contentOffset.x / pageWidth;
        [_segmentedVC setSelectedSegmentIndex:page animated:YES];
        
    }
}

#pragma mark - 状态栏
- (BOOL)prefersStatusBarHidden{
    
    return NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}
- (void)viewDidAppear:(BOOL)animated {
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.allowRotation = 0;  //返回时恢复竖屏
}

- (void)viewWillAppear:(BOOL)animated {
    // 横屏
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.allowRotation = 1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
