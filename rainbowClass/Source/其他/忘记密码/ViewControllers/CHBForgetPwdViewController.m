//
//  CHBForgetPwdViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/9.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBForgetPwdViewController.h"

@interface CHBForgetPwdViewController ()

@end

@implementation CHBForgetPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (CScreenHeight == 480) {         // 3.5寸屏幕
        self.view.layer.contents = (id) [UIImage imageNamed:@"login_bg3.5"].CGImage; //这样设置背景能减小内存消耗
    }else{
        self.view.layer.contents = (id) [UIImage imageNamed:@"login_bj_new"].CGImage; //这样设置背景能减小内存消耗
    }
    
    [self setupViews];
}
// 设置视图
- (void)setupViews{
    // 返回按钮
    UIButton *functionalBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *Image = [UIImage imageNamed:@"login_back"];
    functionalBtn.frame = CGRectMake(14 * CEqualSixScale, 34 * CEqualSixScale, Image.size.width*CEqualSixScale, Image.size.height*CEqualSixScale);
    [functionalBtn setImage:Image forState:UIControlStateNormal];
    [functionalBtn addTarget:self action:@selector(toBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:functionalBtn];
    
    [self createTextFieldCustomFrsme:CGRectMake(32 * CEqualSixScale, 195 * CEqualSixScale, 70 * CEqualSixScale, 20 * CEqualSixScale) labelText:@"手机号码" labelTextColor:[UIColor whiteColor] labelFont:16 * CEqualSixScale placeholder:@"输入手机号码" textFieldFont:14 * CEqualSixScale secureTextEntry:NO];

    [self createTextFieldCustomFrsme:CGRectMake(32 * CEqualSixScale, 275 * CEqualSixScale, 70 * CEqualSixScale, 20 * CEqualSixScale) labelText:@"新  密  码" labelTextColor:[UIColor whiteColor] labelFont:16 * CEqualSixScale  placeholder:@"输入新密码" textFieldFont:14 * CEqualSixScale secureTextEntry:YES];
    
    [self createTextFieldCustomFrsme:CGRectMake(32 * CEqualSixScale, 315 * CEqualSixScale, 70 * CEqualSixScale, 20 * CEqualSixScale) labelText:@"确认密码" labelTextColor:[UIColor whiteColor] labelFont:16 * CEqualSixScale  placeholder:@"输入新密码" textFieldFont:14 * CEqualSixScale secureTextEntry:YES];
    
    // 手机号码
    UILabel *lblVerification = [VBase UILabelWithFrame:CGRectMake(32 * CEqualSixScale, 235 * CEqualSixScale, 70 * CEqualSixScale, 20 * CEqualSixScale) AndText:@"验  证  码" AndtextColor:[UIColor whiteColor] AndSuperView:self.view];
    lblVerification.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    // 横线
    UIView *lineView = [VBase UIViewWithFrame:CGRectMake(lblVerification.right + 2 * CEqualSixScale, lblVerification.bottom - 1 * CEqualSixScale, CSCREEN_WIDTH - lblVerification.right - (34 + 66) * CEqualSixScale, 1 * CEqualSixScale) Andalpha:1 AndborderWidth:0 AndborderColor:nil AndbackgroundColor:[UIColor whiteColor] AndSuperView:self.view];
    UIButton *imgBtn = [[UIButton alloc]initWithFrame:CGRectMake(lineView.right + 3* CEqualSixScale, lineView.bottom - 23.5 *CEqualSixScale, 63.5 * CEqualSixScale , 23.5 *CEqualSixScale)];
    [imgBtn setImage:[UIImage imageNamed:@"login_yanzhengma"] forState:UIControlStateNormal];
    [self.view addSubview:imgBtn];
    // 输入框
    UITextField *verification = [[UITextField alloc] initWithFrame:CGRectMake(lblVerification.right + 2 * CEqualSixScale, lblVerification.frame.origin.y + 2 * CEqualSixScale, CSCREEN_WIDTH - (31 + 32 + 70 + 66.5) * CEqualSixScale, lblVerification.frame.size.height - 2 * CEqualSixScale)];
    [self.view addSubview:verification];
    verification.placeholder = @"输入验证码"; //默认显示的字
    verification.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
    verification.textColor = [UIColor whiteColor];
    verification.returnKeyType = UIReturnKeyDone; //键盘类型
    verification.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    verification.returnKeyType = UIReturnKeyNext; //return 为搜索
    verification.delegate = self;
    
    UILabel *lblPhoneNum = [VBase UILabelWithFrame:CGRectMake(32 * CEqualSixScale, 356 * CEqualSixScale, CSCREEN_WIDTH - 100 * CEqualSixScale, 20) AndText:@"收不到验证码联系客服电话：01012345678" AndtextColor:[UIColor whiteColor] AndSuperView:self.view];
    lblPhoneNum.font = [UIFont systemFontOfSize:12 * CEqualSixScale];
    
    UIButton *loginBtn = [VBase UIButtonWithFrame:CGRectMake(130 * CEqualSixScale, lblPhoneNum.bottom + 16 * CEqualSixScale, 113.5 * CEqualSixScale, 37 * CEqualSixScale) AndBackgroundImageName:@"login_queding" AndTitle:@"" AndTitleColor:nil AndSuperView:self.view];
}
// 创建输入框
- (void)createTextFieldCustomFrsme:(CGRect)rect labelText:(NSString *)text  labelTextColor:(UIColor *)color labelFont:(CGFloat)labelFont placeholder:(NSString *)placeholder textFieldFont:(CGFloat)textFieldFont  secureTextEntry:(BOOL)isSecureTextEntry{
    
    // 手机号码
    UILabel *lblUserName = [VBase UILabelWithFrame:rect AndText:text AndtextColor:color AndSuperView:self.view];
    lblUserName.font = [UIFont systemFontOfSize:labelFont];
    // 横线
    UIView *lineView = [VBase UIViewWithFrame:CGRectMake(lblUserName.right + 2 * CEqualSixScale, lblUserName.bottom - 1 * CEqualSixScale, CSCREEN_WIDTH - lblUserName.right - 34 * CEqualSixScale, 1 * CEqualSixScale) Andalpha:1 AndborderWidth:0 AndborderColor:nil AndbackgroundColor:[UIColor whiteColor] AndSuperView:self.view];
    // 输入框
    UITextField *userName = [[UITextField alloc] initWithFrame:CGRectMake(lblUserName.right + 2 * CEqualSixScale, lblUserName.frame.origin.y + 2 * CEqualSixScale, CSCREEN_WIDTH - (31 + 32 + 70) * CEqualSixScale, lblUserName.frame.size.height - 2 * CEqualSixScale)];
    [self.view addSubview:userName];
    userName.placeholder = placeholder; //默认显示的字
    userName.secureTextEntry = isSecureTextEntry; //是否以密码形式显示
    userName.font = [UIFont systemFontOfSize:textFieldFont];
    userName.textColor = [UIColor whiteColor];
    userName.returnKeyType = UIReturnKeyDone; //键盘类型
    userName.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    userName.returnKeyType = UIReturnKeyNext; //return 为搜索
    userName.delegate = self;
    
}

// 忘记密码
- (void)goForgetPwdBtn {
    
}
// 免费注册
- (void)goRegisterBtn {
    
}

- (void)toBack {
    [self.navigationController popViewControllerAnimated:YES];
}

//点击屏幕任何位置收起键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

//- (void)viewWillAppear:(BOOL)animated { PrincelMh
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//    [super viewWillAppear:animated];
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
//    [super viewWillDisappear:animated];
//}

- (UIView *)line:(CGRect)aFrame color:(UIColor *)clr addSubView:(UIView *)addSubView
{
    UIView *line = [[UIView alloc]initWithFrame:aFrame];
    line.backgroundColor = clr;
    [addSubView addSubview:line];
    return line;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
