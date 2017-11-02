//
//  CHBTeacherHomePage.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/18.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBTeacherHomePage.h"
#import "teacherCoursesCell.h"
#import "UMSocial.h"
#import "AppDelegate.h"

@interface CHBTeacherHomePage ()

@property (nonatomic,strong)UITableView *myTableView;
@property (nonatomic,strong)UILabel *introductionLbl;
@end

@implementation CHBTeacherHomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = CMAIN_Color;
    
    [self createTableView];
    
    [self createHeaderView];
    
}


#pragma mark - 设置TableView setTableHeaderView
- (void)createHeaderView {
    
    UIImageView *headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CSCREEN_WIDTH, 500)];
    headerView.backgroundColor = [UIColor colorWithRed:243/255.f green:243/255.f blue:243/255.f alpha:1];
    [headerView setUserInteractionEnabled:YES];//使添加其上的button有点击事件

    //上半部的背景
    UIView *headerImgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 750/2 * CEqualSixScale, 544/2 * CEqualSixScale)];
    headerImgView.layer.contents = (id) [UIImage imageNamed:@"teacherHomePage_headerImg"].CGImage;
    [headerView addSubview:headerImgView];
    
    //返回按钮
    UIButton *functionalBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *Image = [UIImage imageNamed:@"goBack"];
    functionalBtn.frame = CGRectMake(10 * CEqualSixScale, 34 * CEqualSixScale, Image.size.width*CEqualSixScale, Image.size.height*CEqualSixScale);
    [functionalBtn setImage:[UIImage imageNamed:@"goBack"] forState:UIControlStateNormal];
    [functionalBtn addTarget:self action:@selector(toBack) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:functionalBtn];
    
    //分享
    UIButton *shareBtn= [[UIButton alloc]initWithFrame:CGRectMake(CSCREEN_WIDTH - 60 *CEqualSixScale, functionalBtn.frame.origin.y - 2 * CEqualSixScale, 60 * CEqualSixScale, 30 * CEqualSixScale)];
    [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize: 17.0 * CEqualSixScale];
    [shareBtn setTitleColor:[Util hexStringToColor:@"ffffff"] forState:UIControlStateNormal];           // 字颜色
    [shareBtn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [headerView addSubview:shareBtn];
    
    //头像
    UIImageView *teacherImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 110 * CEqualSixScale, 110 * CEqualSixScale)];
    teacherImg.image = [UIImage imageNamed:@"0012.jpg"];
    teacherImg.center = CGPointMake(CSCREEN_WIDTH/2, headerImgView.frame.size.height/3);
    [teacherImg.layer setMasksToBounds:YES];
    [teacherImg.layer setCornerRadius:teacherImg.frame.size.width/2];//设置矩形四个圆角半径
    [headerView addSubview:teacherImg];
    
    //老师名字
    UILabel *nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CSCREEN_WIDTH, 20 * CEqualSixScale)];
    nameLbl.center = CGPointMake(CSCREEN_WIDTH/2, teacherImg.frame.origin.y + teacherImg.frame.size.height + 20 *CEqualSixScale);
    nameLbl.textAlignment = NSTextAlignmentCenter;
    nameLbl.font = [UIFont systemFontOfSize:18 * CEqualSixScale];
    nameLbl.text = @"杨鸿年";
    nameLbl.textColor = CTitle_Color;
    [headerView addSubview:nameLbl];
    
    //子标题
    UILabel *titleLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CSCREEN_WIDTH, 20 * CEqualSixScale)];
    titleLbl.center = CGPointMake(CSCREEN_WIDTH/2, nameLbl.frame.origin.y + nameLbl.frame.size.height + 20 );
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.textColor = CTitle_Color;
    titleLbl.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    titleLbl.text = @"中央音乐学院教授";
    [headerView addSubview:titleLbl];
    
    
    
    //个人介绍
    UILabel *personalIntroductionLbl = [[UILabel alloc]initWithFrame:CGRectMake(5 * CEqualSixScale, headerImgView.frame.size.height - 24, CSCREEN_WIDTH, 20)];
    personalIntroductionLbl.text = @"个人介绍";
    personalIntroductionLbl.font = [UIFont systemFontOfSize:18 * CEqualSixScale];
    personalIntroductionLbl.textColor = CMAIN_Color;
    [headerImgView addSubview:personalIntroductionLbl];
    //个人简介
    _introductionLbl = [[UILabel alloc]initWithFrame:CGRectMake(5 * CEqualSixScale, headerImgView.frame.size.height + 5 * CEqualSixScale , CSCREEN_WIDTH-10*CEqualSixScale, 20)];
    _introductionLbl.text = @"中国著名指挥家、教育家。他的指挥风格热情、细腻，极富表现力，以其独具一格的指挥艺术及训练合唱的过人技术与修养，赢得国内外乐迷与专家的一致赞誉，被称为“真正掌握合唱艺术奥秘的大师”。20世纪80年代中期以来，杨鸿年创建并担任艺术指导及常任指挥的中国交响乐团少年及女子合唱团足迹遍及世界各地，被誉为世界三大童声合唱团之一。";
    _introductionLbl.textColor = [Util hexStringToColor:@"000000"];
    _introductionLbl.font = [UIFont systemFontOfSize:15 * CEqualSixScale];
    _introductionLbl.numberOfLines = 0;
    
    //计算自适应高度
    CGRect rect = [_introductionLbl.text boundingRectWithSize:CGSizeMake(CSCREEN_WIDTH - 10 * CEqualSixScale, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:_introductionLbl.font } context:nil];
    
    _introductionLbl.frame = CGRectMake(_introductionLbl.frame.origin.x, _introductionLbl.frame.origin.y, rect.size.width, rect.size.height);
    
    //调整行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_introductionLbl.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:8 * CEqualSixScale];//行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [_introductionLbl.text length])];
    _introductionLbl.attributedText = attributedString;
    [_introductionLbl sizeToFit];

    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, headerImgView.frame.size.height , CSCREEN_WIDTH, _introductionLbl.frame.size.height + 15 * CEqualSixScale)];
    bgView.backgroundColor = [UIColor whiteColor];
    
    headerView.frame = CGRectMake(0, 0, CSCREEN_WIDTH, bgView.frame.origin.y + bgView.frame.size.height + 10 * CEqualSixScale);
    
    [headerView addSubview:bgView];
    [headerView addSubview:_introductionLbl];
    
    [_myTableView setTableHeaderView:headerView];
}


- (void)createTableView {
    
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -20, CSCREEN_WIDTH, CScreenHeight+20)];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _myTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    _myTableView.showsVerticalScrollIndicator = NO;
    _myTableView.backgroundColor = [UIColor colorWithRed:243/255.f green:243/255.f blue:243/255.f alpha:1];
    [self.view addSubview:_myTableView];
}
/**
 *
 */
- (void)toBack {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - 分享
- (void)share {
    
//    [UMSocialSnsService presentSnsIconSheetView:self
//                                         appKey:@"wx889a66cccba6e836"
//                                      shareText:@"彩虹班在线音乐学习平台将采用线上线下相结合的方式。消费群体：4~16岁儿童，为家长和儿童提供全方位的在线教学服务。"
//                                     shareImage:[UIImage imageNamed:@"icon"]
//                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToWechatTimeline,nil]
//                                       delegate:self];
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"56ca6d52e0f55af9940021df"
                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://umeng.com/social"
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:@[UMShareToSina,UMShareToWechatSession,UMShareToWechatTimeline]
                                       delegate:self];
}

//实现回调方法（可选）：
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView1 viewForHeaderInSection:(NSInteger)section
{
    UILabel * label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, _myTableView.bounds.size.width, 45);
    label.backgroundColor = CMAIN_Color;
    label.textColor = [UIColor whiteColor];
    label.font=[UIFont systemFontOfSize:17*CEqualSixScale];
    label.text = @" TA的下次直播：9月12日 17：00";

    return label;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
        return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    teacherCoursesCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[teacherCoursesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.imgView.image = [UIImage imageNamed:@"0012.jpg"];
    cell.videoType = @"lubo";
    cell.lblTitle.text = @"颤音的发声方法和部位讲解";
    cell.lblPrice.text = @"￥10";
    cell.videoType = @"10";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 140*CEqualSixScale;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
    
    // 横屏
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.allowRotation = 1;
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
    
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    appDelegate.allowRotation = 0;  //返回时恢复竖屏
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
