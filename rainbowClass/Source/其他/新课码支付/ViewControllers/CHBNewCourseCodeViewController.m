//
//  CHBNewCourseCodeViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/14.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBNewCourseCodeViewController.h"

@interface CHBNewCourseCodeViewController ()

@end

@implementation CHBNewCourseCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNav];             // 初始化导航
    
    [self setupViews];
}

// 初始化导航
- (void)initNav {
    
    self.title = @"新课码支付";
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];//去掉导航底部黑线
    // 返回
    UIImage *leftImage = [UIImage imageNamed:@"goBack"];
    UIButton *leftBtn= [VBase UIButtonWithFrame:CGRectMake(0, 0, leftImage.size.width,leftImage.size.height) AndBackgroundImageName:@"goBack" AndTitle:nil AndTitleColor:nil AndSuperView:nil];
    [leftBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)setupViews {
    
    UILabel *lblPrompt = [VBase UILabelWithFrame:CGRectMake(10 * CEqualSixScale, 25 * CEqualSixScale, 100 * CEqualSixScale, 20 * CEqualSixScale) AndText:@"选择充值方式" AndtextColor:[Util hexStringToColor:@"000000"] AndSuperView:self.view];
    lblPrompt.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    
    NSArray *imgArr = @[@"pay_zhifubao",
                        @"pay_weixinzhifu",
                        @"pay_yinlian",
                        @"pay_kuaijiezhifu"];
    
    NSArray *titleArr = @[@"支付宝",
                        @"微信支付",
                        @"网银支付",
                        @"快捷支付"];
    
    for (int i = 0; i < 4; i++) {
        
        UIButton *btn = [VBase UIButtonWithFrame:CGRectMake(24 * CEqualSixScale + ((56 + 75/2) * CEqualSixScale) * i, 73 * CEqualSixScale, 75/2 * CEqualSixScale, 53/2 * CEqualSixScale) AndBackgroundImageName:imgArr[i] AndTitle:nil AndTitleColor:nil AndSuperView:self.view];
        btn.tag = 100 + i;
        [btn addTarget:self action:@selector(goPay:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *btnTitle = [VBase UIButtonWithFrame:CGRectMake(0, 0, 60 * CEqualSixScale, 20 * CEqualSixScale) AndBackgroundImageName:nil AndTitle:titleArr[i] AndTitleColor:[Util hexStringToColor:@"73d6ff"] AndSuperView:self.view];
        btnTitle.tag = 100 + i;
        btnTitle.center = CGPointMake(btn.center.x, btn.bottom + 18 * CEqualSixScale);
        [btnTitle addTarget:self action:@selector(goPay:) forControlEvents:UIControlEventTouchUpInside];
        btnTitle.titleLabel.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
    }
 
}

- (void)goPay:(UIButton *)sender {
    
    NSLog(@"支付-----tag=%ld",(long)sender.tag);
}

// 返回
- (void)goBack {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
