//
//  CHBRegisteredViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/10.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBRegisteredViewController.h"
#import "QCheckBox.h"

@interface CHBRegisteredViewController ()

@end

@implementation CHBRegisteredViewController

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
    
    [self createTextFieldCustomFrsme:CGRectMake(32 * CEqualSixScale, 275 * CEqualSixScale, 70 * CEqualSixScale, 20 * CEqualSixScale) labelText:@"输入密码" labelTextColor:[UIColor whiteColor] labelFont:16 * CEqualSixScale  placeholder:@"输入新密码" textFieldFont:14 * CEqualSixScale secureTextEntry:YES];
    
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
    
    // 取消
    UIButton *cancelBtn = [VBase UIButtonWithFrame:CGRectMake(32 * CEqualSixScale, 385 * CEqualSixScale, 113.5 * CEqualSixScale, 37 * CEqualSixScale) AndBackgroundImageName:@"login_Cancel" AndTitle:@"" AndTitleColor:nil AndSuperView:self.view];
    // 注册
    UIButton *registerBtn = [VBase UIButtonWithFrame:CGRectMake(cancelBtn.right + 86 * CEqualSixScale, 385 * CEqualSixScale, 113.5 * CEqualSixScale, 37 * CEqualSixScale) AndBackgroundImageName:@"login_register" AndTitle:@"" AndTitleColor:nil AndSuperView:self.view];
    // 勾选框
    QCheckBox *_check1 = [[QCheckBox alloc] initWithDelegate:self];
    _check1.frame = CGRectMake(34 * CEqualSixScale , 350 * CEqualSixScale, 130 * CEqualSixScale, 20 * CEqualSixScale);
    [_check1 setTitle:@"我已认真阅读并同意" forState:UIControlStateNormal];
    [_check1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_check1.titleLabel setFont:[UIFont systemFontOfSize:12.0 * CEqualSixScale]];
    [self.view addSubview:_check1];
    [_check1 setChecked:NO];
    
    UIButton *btnTitle = [[UIButton alloc]initWithFrame:CGRectMake(_check1.right , _check1.frame.origin.y, 50 * CEqualSixScale, 20 * CEqualSixScale)];
    [btnTitle setTitle:@"服务协议" forState:UIControlStateNormal];
    [btnTitle addTarget:self action:@selector(btnXieyi) forControlEvents:UIControlEventTouchUpInside];
    btnTitle.titleLabel.font = [UIFont boldSystemFontOfSize: 12.0 * CEqualSixScale];
    [btnTitle setTitleColor:CMAIN_Color forState:UIControlStateNormal];
    [self.view addSubview:btnTitle];
    
    // 收不到验证码联系客服电话：01012345678
    UILabel *lblPhoneNum = [VBase UILabelWithFrame:CGRectMake(32 * CEqualSixScale, 436 * CEqualSixScale, CSCREEN_WIDTH - 100 * CEqualSixScale, 20) AndText:@"收不到验证码联系客服电话：01012345678" AndtextColor:[UIColor whiteColor] AndSuperView:self.view];
    lblPhoneNum.font = [UIFont systemFontOfSize:12 * CEqualSixScale];
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

// 服务协议
- (void)btnXieyi {
    NSLog(@"--服务协议");
}

// 忘记密码
- (void)goForgetPwdBtn {
    NSLog(@"--忘记密码");
}
// 免费注册
- (void)goRegisterBtn {
    NSLog(@"--免费注册");
}

- (void)toBack {
    [self.navigationController popViewControllerAnimated:YES];
}

//点击屏幕任何位置收起键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (UIView *)line:(CGRect)aFrame color:(UIColor *)clr addSubView:(UIView *)addSubView{
    
    UIView *line = [[UIView alloc]initWithFrame:aFrame];
    line.backgroundColor = clr;
    [addSubView addSubview:line];
    return line;
}

#pragma mark - QCheckBoxDelegate
- (void)didSelectedCheckBox:(QCheckBox *)checkbox checked:(BOOL)checked {
    NSLog(@"did tap on CheckBox:%@ checked:%d", checkbox.titleLabel.text, checked);
    if (checked==0) {
       NSLog(@"取消打钩");
    }else{
        NSLog(@"打钩");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
