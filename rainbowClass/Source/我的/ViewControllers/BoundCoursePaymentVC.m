//
//  BoundCoursePaymentVC.m
//  rainbowClass
//
//  Created by WangYu on 9/3/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "BoundCoursePaymentVC.h"

@interface BoundCoursePaymentVC ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonSpacing1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttonSpacing2;
@end


@implementation BoundCoursePaymentVC

#pragma mark - 事件处理
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)rechargeMethod:(id)sender {
    NSLog(@"充值方式");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _buttonSpacing1.constant  = (CScreenWidth - 275) / 3;
    _buttonSpacing2.constant = _buttonSpacing1.constant;
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
