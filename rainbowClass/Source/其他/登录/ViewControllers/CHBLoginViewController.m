//
//  CHBLoginViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBLoginViewController.h"
#import "CHBLoginButton.h"
#import "UMSocial.h"

#import "CHBForgetPwdViewController.h"      // 忘记密码
#import "CHBRegisteredViewController.h"     // 免费注册
#import "BoundCourseBillVC.h"
#import "CHBBindingCourseViewController.h"  // 绑定课程码

#import "mainViewController.h"

@interface CHBLoginViewController ()

@property (nonatomic, strong)UIButton *loginButton;
@property (nonatomic, strong)UIButton *registerButton;
@property (nonatomic, strong)UIButton *forgetPwdButton;
@property (nonatomic, strong)UIButton *lookButton;

@property (nonatomic, copy)NSString *userName;
@property (nonatomic, copy)NSString *password;

@end

@implementation CHBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (CScreenHeight == 480) {                                                         // 3.5寸屏幕
        self.view.layer.contents = (id) [UIImage imageNamed:@"login_bg3.5"].CGImage;    // 这样设置背景能减小内存消耗
    }else{
        self.view.layer.contents = (id) [UIImage imageNamed:@"login_bj"].CGImage;       // 这样设置背景能减小内存消耗
    }
    self.navigationController.navigationBarHidden = YES;                                // 隐藏导航栏
    
    [self setupViews];

}

#pragma mark - 账号登录
- (void)loginButtonClicked:(UIButton *)btn
{
    [self.view endEditing:YES];

    [CHBHudCenter showLoadingWithMessage:@"登录中..."];
    
    // 1秒后停止
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        [CHBHudCenter cancleLoadingHud];
//        UIStoryboard *_sb = [UIStoryboard storyboardWithName:@"PersonalCenterStoryboard" bundle:[NSBundle mainBundle]];
//        
//        BoundCourseBillVC *NoLineNavigationBarVC = [_sb instantiateViewControllerWithIdentifier:@"BoundCourseBillVC"];
//        
//        [self.navigationController pushViewController:NoLineNavigationBarVC animated:YES];
        
        CHBBindingCourseViewController *bindingCourseVC = [CHBBindingCourseViewController new];
        
        [self.navigationController pushViewController:bindingCourseVC animated:YES];
        
    });
}

#pragma mark - +方法
+ (UIViewController *)loginViewContoller
{
    CHBLoginViewController *controller = [[CHBLoginViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller];
    
    return nav;
}

- (void)setupViews{
    
    // 返回按钮
    UIButton *functionalBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *Image = [UIImage imageNamed:@"login_back"];
    functionalBtn.frame = CGRectMake(14 * CEqualSixScale, 34 * CEqualSixScale, Image.size.width*CEqualSixScale, Image.size.height*CEqualSixScale);
    [functionalBtn setImage:Image forState:UIControlStateNormal];
    [functionalBtn addTarget:self action:@selector(toBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:functionalBtn];
    
    // 用户名
    UILabel *lblUserName = [VBase UILabelWithFrame:CGRectMake(32 * CEqualSixScale, 220 * CEqualSixScale, 56 * CEqualSixScale, 20 * CEqualSixScale) AndText:@"用户名:" AndtextColor:[UIColor whiteColor] AndSuperView:self.view];
    lblUserName.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    
    UIView *lineView1 = [VBase UIViewWithFrame:CGRectMake(lblUserName.right + 2 * CEqualSixScale, lblUserName.bottom - 1 * CEqualSixScale, CSCREEN_WIDTH - lblUserName.right - 34 * CEqualSixScale, 1 * CEqualSixScale) Andalpha:1 AndborderWidth:0 AndborderColor:nil AndbackgroundColor:[UIColor whiteColor] AndSuperView:self.view];

    // 用户名框
    UITextField *userName = [[UITextField alloc] initWithFrame:CGRectMake(lblUserName.right + 2 * CEqualSixScale, 222 * CEqualSixScale, 260 *CEqualSixScale, 18 * CEqualSixScale)];
    [self.view addSubview:userName];
    userName.placeholder = @"输入手机号或者课程码";                   // 默认显示的字
    userName.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
    userName.textColor = [UIColor whiteColor];
    userName.returnKeyType = UIReturnKeyDone;                         // 键盘类型
    userName.clearButtonMode = UITextFieldViewModeWhileEditing;       // 编辑时会出现个修改X
    userName.returnKeyType = UIReturnKeyNext;                         // return 为搜索
    userName.delegate = self;
    
    
    // 密码
    UILabel *lblPassword = [VBase UILabelWithFrame:CGRectMake(32 * CEqualSixScale, 260 * CEqualSixScale, 56 * CEqualSixScale, 20 * CEqualSixScale) AndText:@"密    码:" AndtextColor:[UIColor whiteColor] AndSuperView:self.view];
    lblPassword.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    
    UIView *lineView2 = [VBase UIViewWithFrame:CGRectMake(lblPassword.right + 2 * CEqualSixScale, lblPassword.bottom - 1 * CEqualSixScale, CSCREEN_WIDTH - lblPassword.right - 34 * CEqualSixScale, 1 * CEqualSixScale) Andalpha:1 AndborderWidth:0 AndborderColor:nil AndbackgroundColor:[UIColor whiteColor] AndSuperView:self.view];
    
    // 密码框
    UITextField *password = [[UITextField alloc] initWithFrame:CGRectMake(lblPassword.right + 2 * CEqualSixScale, 262 * CEqualSixScale, 260 *CEqualSixScale, 18 * CEqualSixScale)];
    [self.view addSubview:password];
    password.placeholder = @"输入用户密码或者课程密码";                 // 默认显示的字
    password.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
    password.textColor = [UIColor whiteColor];
    password.secureTextEntry = YES;                                     // 是否以密码形式显示
    password.returnKeyType = UIReturnKeyDone;                           // 键盘类型
    password.clearButtonMode = UITextFieldViewModeWhileEditing;         // 编辑时会出现个修改X
    password.returnKeyType = UIReturnKeyNext;                           // return 为搜索
    password.delegate = self;

    // 登录
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 113.5 * CEqualSixScale, 37 * CEqualSixScale)];
    loginBtn.center = CGPointMake(CSCREEN_WIDTH / 2, lineView2.bottom + 70 * CEqualSixScale);
    [loginBtn setImage:[UIImage imageNamed:@"login_btn"] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    // 忘记密码
    UIButton *forgetPwdBtn = [[UIButton alloc]initWithFrame:CGRectMake(227 * CEqualSixScale, loginBtn.bottom + 22 * CEqualSixScale, 50 * CEqualSixScale, 20 * CEqualSixScale)];
    [forgetPwdBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetPwdBtn.titleLabel.font = [UIFont systemFontOfSize:12 * CEqualSixScale];
    [forgetPwdBtn addTarget:self action:@selector(goForgetPwdBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPwdBtn];
    // 注册
    UIButton *registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(forgetPwdBtn.right + 22 * CEqualSixScale, loginBtn.bottom + 22 * CEqualSixScale, 50 * CEqualSixScale, 20 * CEqualSixScale)];
    [registerBtn setTitle:@"免费注册" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:12 * CEqualSixScale];
    [registerBtn addTarget:self action:@selector(goRegisterBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
}

// 忘记密码
- (void)goForgetPwdBtn {
    CHBForgetPwdViewController *forgetPwdVC = [CHBForgetPwdViewController new];
    [self.navigationController pushViewController:forgetPwdVC animated:YES];
}
// 免费注册
- (void)goRegisterBtn {

    CHBRegisteredViewController *registeredVC = [CHBRegisteredViewController new];
    
    [self.navigationController pushViewController:registeredVC animated:YES];
    
}

- (void)toBack {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

//点击屏幕任何位置收起键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (UIView *)line:(CGRect)aFrame color:(UIColor *)clr{
    
    UIView *line = [[UIView alloc]initWithFrame:aFrame];
    line.backgroundColor = clr;
    return line;
}

//- (void)viewWillAppear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//    [super viewWillAppear:animated];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
//    [super viewWillDisappear:animated];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
