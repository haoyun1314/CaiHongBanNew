//
//  CHBBindingCourseViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/14.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBBindingCourseViewController.h"
#import "CHBBindingPhoneViewController.h"
#import "CHBNewCourseCodeViewController.h"

@interface CHBBindingCourseViewController ()
{
    BOOL isBindingPhoneNum;                              // 是否绑定手机号
}

@property (nonatomic,strong)UILabel *lblCourse;          // 课程名字
@property (nonatomic,strong)UILabel *lblPrice;           // 课程价格
@property (nonatomic,strong)UIButton *btnBinding;        // 绑定

@end

@implementation CHBBindingCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;  // 隐藏导航栏

    [self initNav];         // 初始化导航
    
    [self setupViews];      // 初始化视图
    
}

- (void)initNav {
    
    self.title = @"绑定新的课程码";
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];//去掉导航底部黑线
    // 返回
    UIImage *leftImage = [UIImage imageNamed:@"goBack"];
    UIButton *leftBtn= [VBase UIButtonWithFrame:CGRectMake(0, 0, leftImage.size.width,leftImage.size.height) AndBackgroundImageName:@"goBack" AndTitle:nil AndTitleColor:nil AndSuperView:nil];
    [leftBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}

// 设置视图
- (void)setupViews{
    
    UILabel *lbl1 = [VBase UILabelWithFrame:CGRectMake(10 * CEqualSixScale, 20 * CEqualSixScale, CSCREEN_WIDTH - 20 * CEqualSixScale, 20 * CEqualSixScale) AndText:@"你要绑定的课程是" AndtextColor:[UIColor blackColor] AndSuperView:self.view];
    lbl1.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    // 课程名称
    _lblCourse = [VBase UILabelWithFrame:CGRectMake(10 * CEqualSixScale, lbl1.bottom + 10 * CEqualSixScale, CSCREEN_WIDTH - 20 * CEqualSixScale, 20 * CEqualSixScale) AndText:@"彩虹班在北京实验小学开设的钢琴课" AndtextColor:[Util hexStringToColor:@"ff6634"] AndSuperView:self.view];
    lbl1.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    // 价格
    _lblPrice = [VBase UILabelWithFrame:CGRectMake(10 * CEqualSixScale, _lblCourse.bottom + 15 * CEqualSixScale, CSCREEN_WIDTH - 20 * CEqualSixScale, 20 * CEqualSixScale) AndText:@"课程费用为：1999元" AndtextColor:[UIColor blackColor] AndSuperView:self.view];
    _lblPrice.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    // 提示 （请完成购买，否则不能开课和享受课程服务）
    UILabel *lblPrompt = [VBase UILabelWithFrame:CGRectMake(10 * CEqualSixScale, _lblPrice.bottom + 8 * CEqualSixScale, CSCREEN_WIDTH - 20 * CEqualSixScale, 14 * CEqualSixScale) AndText:@"(请完成购买，否则不能开课和享受课程服务)" AndtextColor:[UIColor blackColor] AndSuperView:self.view];
    lblPrompt.font = [UIFont systemFontOfSize:12 * CEqualSixScale];
    
    _btnBinding = [VBase UIButtonWithFrame:CGRectMake(147 * CEqualSixScale, lblPrompt.bottom + 32 * CEqualSixScale, 81 * CEqualSixScale, 37 * CEqualSixScale) AndBackgroundImageName:@"login_buy" AndTitle:nil AndTitleColor:nil AndSuperView:self.view];
    [_btnBinding addTarget:self action:@selector(buy) forControlEvents:UIControlEventTouchUpInside];
}

// 返回
- (void)goBack {
    
    [self.navigationController popViewControllerAnimated:YES];
}

// 购买
- (void)buy {
    
    isBindingPhoneNum = YES;
    
    if (isBindingPhoneNum) {
        
        CHBNewCourseCodeViewController *newCourseCodeVC = [CHBNewCourseCodeViewController new];
        
        [self.navigationController pushViewController:newCourseCodeVC animated:YES];
        
    }else{
    // 先绑定手机号
    CHBBindingPhoneViewController *bindingPhoneVC = [CHBBindingPhoneViewController new];
    
    [self presentViewController:bindingPhoneVC animated:YES completion:nil];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
