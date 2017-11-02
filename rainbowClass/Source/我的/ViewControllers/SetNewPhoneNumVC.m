//
//  SetNewPhoneNumVC.m
//  rainbowClass
//
//  Created by WangYu on 26/1/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "SetNewPhoneNumVC.h"

@interface SetNewPhoneNumVC ()

@property (weak, nonatomic) IBOutlet UIView *firstBackView;
@property (weak, nonatomic) IBOutlet UIView *secondBackView;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *getCodeBtn;

@end

@implementation SetNewPhoneNumVC

#pragma mark - 事件处理
//点击返回按钮
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//点击获取验证码
- (IBAction)getIdentifyingCode:(id)sender {
    NSLog(@"获取验证码");
}
//点击修改
- (IBAction)setNumberAction:(id)sender {
    NSLog(@"修改");
}

#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBorderStyle];

}

//设置输入框边框颜色
- (void)setBorderStyle {
    _firstBackView.layer.borderColor = [[Util hexStringToColor:@"dcdcdc"] CGColor];
    _secondBackView.layer.borderColor = [[Util hexStringToColor:@"dcdcdc"] CGColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
