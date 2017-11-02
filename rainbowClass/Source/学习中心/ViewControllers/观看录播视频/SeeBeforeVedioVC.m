//
//  SeeBeforeVedioVC.m
//  rainbowClass
//
//  Created by cashyoon on 16/2/26.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "SeeBeforeVedioVC.h"
#import "HMSegmentedControl.h"
#import "CHVideoPayerVC.H"

@interface SeeBeforeVedioVC ()<UIScrollViewDelegate>
{


}

@property (weak, nonatomic) IBOutlet HMSegmentedControl * segmentedVC;
@end

@implementation SeeBeforeVedioVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reloadSegmentVC];
    
}


- (IBAction)goToCoursePage:(id)sender {
    
    
    NSLog(@"去上课");
//    CHVideoPayerVC * playerView  = [[CHVideoPayerVC alloc]initWithHTTPLiveStreamingMediaURL:[NSURL URLWithString:@"http://api.yooshow.com/ys2/vedioV4/GetVedioPlay?vedioId=189"]];
        CHVideoPayerVC * playerView  = [[CHVideoPayerVC alloc] initWithLocalMediaURL:[NSURL URLWithString:@"http://2085.vod.myqcloud.com/2085_b80c2fa2dec611e5805223ef4c3c3548.f30.mp4"]];
    [self presentViewController:playerView animated:YES completion:nil];
    
}


- (IBAction)goBackPage:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}





-(void)reloadSegmentVC
{
    _segmentedVC.sectionImages = @[[UIImage imageNamed:@"本课知识原始@2x.png"], [UIImage imageNamed:@"老师介绍原始@2x.png"], [UIImage imageNamed:@"作业要求原始@2x.png"]];
    _segmentedVC.sectionSelectedImages = @[[UIImage imageNamed:@"本课知识点击@2x.png"], [UIImage imageNamed:@"老师介绍点击@2x.png"], [UIImage imageNamed:@"作业要求点击@2x.png"]];
    
    
    _segmentedVC.type = HMSegmentedControlTypeImages;
    _segmentedVC.userInteractionEnabled = YES;
    _segmentedVC.selectionIndicatorHeight = 0;
    _segmentedVC.backgroundColor = [UIColor clearColor];
    _segmentedVC.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    _segmentedVC.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    
    
//    [_segmentedVC addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];

    [self reloadMeCourseUI:3];


}


- (void)updateViewConstraints
{

    [super updateViewConstraints];

    
}




-(void)reloadMeCourseUI:(NSInteger)numPage
{
    
    
    
    if (CIS4SInchScreen)
    {
        
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(10*C4S, self.segmentedVC.bottom +  16*C4S, 450*C4S, 115*C4S)];
        _scrollView.contentSize = CGSizeMake(450*C4S *numPage, 115*C4S);
        self.scrollView.backgroundColor = [UIColor clearColor];
        self.scrollView.delegate = self;
        self.scrollView.pagingEnabled = YES;
        [self.scrollView scrollRectToVisible:CGRectMake(0, 0,450*C4S,115*C4S) animated:NO];
        [self.contentView addSubview:self.scrollView];
        
        __weak typeof(self) weakSelf = self;
        [_segmentedVC setIndexChangeBlock:^(NSInteger index) {
            [weakSelf.scrollView scrollRectToVisible:CGRectMake(self.scrollView.width* index, 0,self.scrollView.width,weakSelf.scrollView.height) animated:YES];
        }];
        
    }
    
    else
    {
        
        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(10*CEqualSixScale, self.segmentedVC.bottom +  16*CEqualSixScale, 450*CEqualSixScale, 115*CEqualSixScale)];
        _scrollView.contentSize = CGSizeMake(450*CEqualSixScale *numPage, 115*CEqualSixScale);
        self.scrollView.backgroundColor = [UIColor clearColor];
        self.scrollView.delegate = self;
        self.scrollView.pagingEnabled = YES;
        [self.scrollView scrollRectToVisible:CGRectMake(0, 0,450*CEqualSixScale,115*CEqualSixScale) animated:NO];
        [self.contentView addSubview:self.scrollView];
        
        __weak typeof(self) weakSelf = self;
        [_segmentedVC setIndexChangeBlock:^(NSInteger index) {
            [weakSelf.scrollView scrollRectToVisible:CGRectMake(self.scrollView.width* index, 0,self.scrollView.width,weakSelf.scrollView.height) animated:YES];
        }];
        
        
        
        
        
    }
    
    
    
    
    
    
    [self courseKnowledge];
    [self taskRule];
    [self teacherIntroduce];
    
    
}

-(void)courseKnowledge{
    
    
    
    UIView * musicView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,self.scrollView.width,self.scrollView.height)];
    musicView.tag = 1003;
    
    musicView.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:musicView];
    
    
    
    
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    UIScrollView * nusicView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.scrollView.width,self.scrollView.height)];
    
    
    nusicView.contentSize = CGSizeMake(self.scrollView.width, self.scrollView.height+50*CEqualSixScale);
    nusicView.backgroundColor = [UIColor clearColor];
    nusicView.delegate = self;
    [musicView addSubview:nusicView];
    
    
    
    self.teacherNameLabel = [VBase UILabelWithFrame:CGRectMake(0,10*CEqualSixScale,self.scrollView.width, 20*CEqualSixScale) AndText:@"本课主讲xx" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:nusicView];
    self.teacherNameLabel.font = [UIFont systemFontOfSize:14*CEqualSixScale];
    self.teacherNameLabel.textAlignment = NSTextAlignmentCenter;
    
    
    
    self.coureseFunctionLabel = [VBase UILabelWithFrame:CGRectMake(0,self.teacherNameLabel.bottom +10*CEqualSixScale,self.scrollView.width, 20*CEqualSixScale) AndText:@"主要锻炼孩子们的基本能力" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:nusicView];
    self.coureseFunctionLabel.font = [UIFont systemFontOfSize:14*CEqualSixScale];
    self.coureseFunctionLabel.textAlignment = NSTextAlignmentCenter;
    
    
    self.coureseIntroduce = [VBase UILabelWithFrame:CGRectMake(0,self.coureseFunctionLabel.bottom +10*CEqualSixScale,self.scrollView.width, 20*CEqualSixScale) AndText:@"主要锻炼孩子们的基本能力" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:nusicView];
    self.coureseIntroduce.font = [UIFont systemFontOfSize:14*CEqualSixScale];
    self.coureseIntroduce.numberOfLines = 0;
    self.coureseIntroduce.textAlignment = NSTextAlignmentLeft;
    
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont  systemFontOfSize:16*CEqualSixScale],NSFontAttributeName ,nil];
    
    
    
    NSString * str = @"鬼地方个风格的风格的风格的风格的鬼地方郭德纲的非官方特人突然说到发送方水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费当时发生的发生的发撒地方撒的防守打法水电费水电费水电费水电费水电费是发送到发送发送到发送到发送发送到发送方水电费水电费水电费水电费水电费的说法 ";
    CGRect rect=  [str  boundingRectWithSize:CGSizeMake(self.scrollView.width, 0) options:NSStringDrawingUsesLineFragmentOrigin  attributes:dic context:nil];
    self.coureseIntroduce.frame = CGRectMake(0,self.coureseFunctionLabel.bottom +10*CEqualSixScale,self.scrollView.width, rect.size.height);
    self.coureseIntroduce.text = str;
    
    
}

//- (IBAction)goBackHomePage:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];
//}


-(void)taskRule{
    
    UIView * musicView1 = [[UIView alloc] initWithFrame:CGRectMake(self.scrollView.width, 0,self.scrollView.width,self.scrollView.height)];
    musicView1.tag = 1004;
    
    musicView1.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:musicView1];
    
    
    UIScrollView * musicView1ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.scrollView.width,self.scrollView.height)];
    musicView1ScrollView.contentSize = CGSizeMake(self.scrollView.width, self.scrollView.height+200*CEqualSixScale);
    musicView1ScrollView.backgroundColor = [UIColor clearColor];
    musicView1ScrollView.delegate = self;
    [musicView1 addSubview:musicView1ScrollView];
    
    
    
    self.taskNeedLabel = [VBase UILabelWithFrame:CGRectMake(0,10*CEqualSixScale,self.scrollView.width, 20*CEqualSixScale) AndText:@"主要锻炼孩子们的基本能力" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:musicView1ScrollView];
    _taskNeedLabel.font = [UIFont systemFontOfSize:14*CEqualSixScale];
    _taskNeedLabel.numberOfLines = 0;
    _taskNeedLabel.textAlignment = NSTextAlignmentLeft;
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont  systemFontOfSize:14*CEqualSixScale],NSFontAttributeName ,nil];
    NSString * str = @"鬼地方个风格的风格的风格的风格的鬼地方郭德纲的非官方特人突然说到发送方水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费当时发生的发生的发撒地方撒的防守打法水电费水电费水电费水电费水电费是发送到发送发送到发送到发送发送到发送方水电费水电费水电费水电费水电费的说法 ";
    CGRect rect=  [str  boundingRectWithSize:CGSizeMake(self.scrollView.width, 0) options:NSStringDrawingUsesLineFragmentOrigin  attributes:dic context:nil];
    _taskNeedLabel.frame = CGRectMake(0,0,self.scrollView.width, rect.size.height);
    _taskNeedLabel.text = str;
    
    
    
    
}

-(void)teacherIntroduce
{
    
    UIView * musicView2 = [[UIView alloc] initWithFrame:CGRectMake(self.scrollView.width*2, 0,self.scrollView.width,self.scrollView.height)];
    musicView2.tag = 1004;
    
    musicView2.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:musicView2];
    
    
    
    
    
    UIScrollView * musicView2ScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.scrollView.width,self.scrollView.height)];
    musicView2ScrollView.contentSize = CGSizeMake(self.scrollView.width, self.scrollView.height+200*CEqualSixScale);
    musicView2ScrollView.backgroundColor = [UIColor clearColor];
    musicView2ScrollView.delegate = self;
    [musicView2 addSubview:musicView2ScrollView];
    
    
    
    if (CIS4SInchScreen) {
        self.teacherHeadImageView = [[UIImageView alloc]initWithFrame:CGRectMake(200*C4S, 14*CEqualSixScale,74*CEqualSixScale,74*CEqualSixScale)];
        self.teacherHeadImageView.backgroundColor = [UIColor redColor];
        _teacherHeadImageView.layer.cornerRadius = 4.0;
        [musicView2ScrollView addSubview:_teacherHeadImageView];
    }
    else
    {
        
        self.teacherHeadImageView = [[UIImageView alloc]initWithFrame:CGRectMake(200*CEqualSixScale, 14*CEqualSixScale,74*CEqualSixScale,74*CEqualSixScale)];
        self.teacherHeadImageView.backgroundColor = [UIColor redColor];
        _teacherHeadImageView.layer.cornerRadius = 4.0;
        [musicView2ScrollView addSubview:_teacherHeadImageView];
        
        
    }
    
    
    
    self.teacherName = [VBase UILabelWithFrame:CGRectMake(0,self.teacherHeadImageView.bottom +10*CEqualSixScale,self.scrollView.width, 20*CEqualSixScale) AndText:@"韩寒 中国音乐老师" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:musicView2ScrollView];
    self.teacherName.font = [UIFont systemFontOfSize:16*CEqualSixScale];
    self.teacherName.textAlignment = NSTextAlignmentCenter;
    
    
    self.teacherIntroduceContent = [VBase UILabelWithFrame:CGRectMake(0,self.teacherName.bottom +10*CEqualSixScale,self.scrollView.width, 20*CEqualSixScale) AndText:@"主要锻炼孩子们的基本能力" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:musicView2ScrollView];
    self.teacherIntroduceContent.font = [UIFont systemFontOfSize:14*CEqualSixScale];
    self.teacherIntroduceContent.numberOfLines = 0;
    self.teacherIntroduceContent.textAlignment = NSTextAlignmentLeft;
    
    
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont  systemFontOfSize:14*CEqualSixScale],NSFontAttributeName ,nil];
    
    
    
    NSString * str = @"鬼地方个风格的风格的风格的风格的鬼地方郭德纲的非官方特人突然说到发送方水电费水电费水电费水电费水电费水电费水电费水电费水电费水电费当时发生的发生的发撒地方撒的防守打法水电费水电费水电费水电费水电费是发送到发送发送到发送到发送发送到发送方水电费水电费水电费水电费水电费的说法 ";
    CGRect rect=  [str  boundingRectWithSize:CGSizeMake(self.scrollView.width, 0) options:NSStringDrawingUsesLineFragmentOrigin  attributes:dic context:nil];
    self.teacherIntroduceContent.frame = CGRectMake(0,self.teacherName.bottom +10*CEqualSixScale,self.scrollView.width, rect.size.height);
    self.teacherIntroduceContent.text = str;
    
    
    
}





#pragma mark - 屏幕旋转代码相关设置
- (BOOL)shouldAutorotate{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation

{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end
