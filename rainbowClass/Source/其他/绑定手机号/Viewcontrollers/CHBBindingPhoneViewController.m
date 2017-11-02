//
//  CHBBindingViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/14.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBBindingPhoneViewController.h"
#import "QCheckBox.h"

@interface CHBBindingPhoneViewController ()

@end

@implementation CHBBindingPhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES animated:NO];

    if (CScreenHeight == 480) {         // 3.5寸屏幕
        self.view.layer.contents = (id) [UIImage imageNamed:@"login_bg3.5"].CGImage; //这样设置背景能减小内存消耗
    }else{
        self.view.layer.contents = (id) [UIImage imageNamed:@"login_bg_bindingPhone"].CGImage; //这样设置背景能减小内存消耗
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
     // 提示
     UILabel *lblCapion = [VBase UILabelWithFrame:CGRectMake(32 * CEqualSixScale, 196 * CEqualSixScale, CSCREEN_WIDTH - 60 * CEqualSixScale, 45) AndText:@"尊敬的XXX幼儿园的用户，为了方便您今后登录和为你提供付费，请绑定手机号码和修改密码" AndtextColor:[Util hexStringToColor:@"fc3e00"] AndSuperView:self.view];
     lblCapion.numberOfLines = 0;
    lblCapion.font = [UIFont systemFontOfSize:12 * CEqualSixScale];
    
    [self createTextFieldCustomFrsme:CGRectMake(32 * CEqualSixScale, 245 * CEqualSixScale, 70 * CEqualSixScale, 20 * CEqualSixScale) labelText:@"手机号码" labelTextColor:[UIColor whiteColor] labelFont:16 * CEqualSixScale placeholder:@"输入手机号码" textFieldFont:14 * CEqualSixScale secureTextEntry:NO];
    
    [self createTextFieldCustomFrsme:CGRectMake(32 * CEqualSixScale, 325 * CEqualSixScale, 70 * CEqualSixScale, 20 * CEqualSixScale) labelText:@"修改密码" labelTextColor:[UIColor whiteColor] labelFont:16 * CEqualSixScale  placeholder:@"输入新密码" textFieldFont:14 * CEqualSixScale secureTextEntry:YES];
    
    [self createTextFieldCustomFrsme:CGRectMake(32 * CEqualSixScale, 365 * CEqualSixScale, 70 * CEqualSixScale, 20 * CEqualSixScale) labelText:@"确认密码" labelTextColor:[UIColor whiteColor] labelFont:16 * CEqualSixScale  placeholder:@"输入新密码" textFieldFont:14 * CEqualSixScale secureTextEntry:YES];
    
    // 手机号码
    UILabel *lblVerification = [VBase UILabelWithFrame:CGRectMake(32 * CEqualSixScale, 285 * CEqualSixScale, 70 * CEqualSixScale, 20 * CEqualSixScale) AndText:@"验  证  码" AndtextColor:[UIColor whiteColor] AndSuperView:self.view];
    lblVerification.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
    // 横线
    UIView *lineView = [VBase UIViewWithFrame:CGRectMake(lblVerification.right + 2 * CEqualSixScale, lblVerification.bottom - 1 * CEqualSixScale, CSCREEN_WIDTH - lblVerification.right - (34 + 66) * CEqualSixScale, 1 * CEqualSixScale) Andalpha:1 AndborderWidth:0 AndborderColor:nil AndbackgroundColor:[UIColor whiteColor] AndSuperView:self.view];
    
    UIButton *imgBtn = [[UIButton alloc]initWithFrame:CGRectMake(lineView.right + 3* CEqualSixScale, lineView.bottom - 23.5 *CEqualSixScale, 63.5 * CEqualSixScale , 23.5 *CEqualSixScale)];
    [imgBtn setImage:[UIImage imageNamed:@"login_huoquyanzhengma"] forState:UIControlStateNormal];
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
    
    // 绑定
    UIButton *bindingBtn = [VBase UIButtonWithFrame:CGRectMake(54 * CEqualSixScale, 425 * CEqualSixScale, 113.5 * CEqualSixScale, 37 * CEqualSixScale) AndBackgroundImageName:@"login_bindingPhone" AndTitle:@"" AndTitleColor:nil AndSuperView:self.view];
    bindingBtn.center = CGPointMake(CSCREEN_WIDTH/2, (425+18.5) * CEqualSixScale );
    [bindingBtn addTarget:self action:@selector(binding) forControlEvents:UIControlEventTouchUpInside];

    // 勾选框
    QCheckBox *_check1 = [[QCheckBox alloc] initWithDelegate:self];
    _check1.frame = CGRectMake(34 * CEqualSixScale , 400 * CEqualSixScale, 130 * CEqualSixScale, 20 * CEqualSixScale);
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
    
    UIButton *btnBinding = [[UIButton alloc]initWithFrame:CGRectMake(btnTitle.right + 54 * CEqualSixScale , _check1.frame.origin.y, 80 * CEqualSixScale, 20 * CEqualSixScale)];
    [btnBinding setTitle:@"绑定已有账号" forState:UIControlStateNormal];
    [btnBinding addTarget:self action:@selector(btnXieyi) forControlEvents:UIControlEventTouchUpInside];
    btnBinding.titleLabel.font = [UIFont boldSystemFontOfSize: 12.0 * CEqualSixScale];
    [btnBinding setTitleColor:[Util hexStringToColor:@"fc3e00"] forState:UIControlStateNormal];
    [self.view addSubview:btnBinding];
    
    
    // 收不到验证码联系客服电话：01012345678
    UILabel *lblPhoneNum = [VBase UILabelWithFrame:CGRectMake(32 * CEqualSixScale, 470 * CEqualSixScale, CSCREEN_WIDTH - 100 * CEqualSixScale, 20) AndText:@"收不到验证码联系客服电话：01012345678" AndtextColor:[UIColor whiteColor] AndSuperView:self.view];
    lblPhoneNum.font = [UIFont systemFontOfSize:12 * CEqualSixScale];
}

// 创建输入框
- (void)createTextFieldCustomFrsme:(CGRect)rect labelText:(NSString *)text  labelTextColor:(UIColor *)color labelFont:(CGFloat)labelFont placeholder:(NSString *)placeholder textFieldFont:(CGFloat)textFieldFont  secureTextEntry:(BOOL)isSecureTextEntry{
    
    // 手机号码
    UILabel *lblUserName = [VBase UILabelWithFrame:rect AndText:text AndtextColor:color AndSuperView:self.view];
    lblUserName.font = [UIFont systemFontOfSize:labelFont];
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
    
}
// 免费注册
- (void)goRegisterBtn {
    
}

- (void)binding {
    
    [CHBHudCenter showLoadingWithMessage:@"绑定成功"];
    // 1秒后停止
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //
        [CHBHudCenter cancleLoadingHud];

        [self dismissViewControllerAnimated:YES completion:nil];
        
    });
}

- (void)toBack {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
