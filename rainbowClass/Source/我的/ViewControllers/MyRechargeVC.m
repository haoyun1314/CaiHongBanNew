//
//  MyRechargeVC.m
//  rainbowClass
//
//  Created by WangYu on 26/1/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MyRechargeVC.h"

@interface MyRechargeVC ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonSpacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonSpacing2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *butonSpacing3;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *payBtnSpace1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *payBtnSpace2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *payBtnSpace3;

@property (weak, nonatomic) IBOutlet UIView *backView;


@property (weak, nonatomic) IBOutlet UITextField *chargeAmountText;

@end

@implementation MyRechargeVC

#pragma mark - 事件处理
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)amountOfCharge:(id)sender {
    NSLog(@"充值金额");
}

- (IBAction)chargeMethod:(id)sender {
    NSLog(@"充值方式");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _buttonSpacing.constant  = (CScreenWidth - 256) / 3;
    _buttonSpacing2.constant = _buttonSpacing.constant;
    _butonSpacing3.constant = _buttonSpacing.constant;
    
    _payBtnSpace1.constant = (CScreenWidth - 260) / 3;
    _payBtnSpace2.constant = _payBtnSpace1.constant;
    _payBtnSpace3.constant = _payBtnSpace1.constant;
    
    
    _backView.layer.borderColor = [[Util hexStringToColor:@"dcdcdc"] CGColor];
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
