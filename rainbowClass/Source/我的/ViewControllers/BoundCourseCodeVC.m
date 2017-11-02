//
//  BoundCourseCodeVC.m
//  rainbowClass
//
//  Created by WangYu on 26/1/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "BoundCourseCodeVC.h"

@interface BoundCourseCodeVC ()

@property (weak, nonatomic) IBOutlet UIView *firstBackView;
@property (weak, nonatomic) IBOutlet UIView *secondBackView;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation BoundCourseCodeVC

#pragma mark - 事件处理
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)boundAction:(id)sender {
    [self performSegueWithIdentifier:@"BoundCourseBillVC" sender:nil];
}

#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBorderStyle];
}

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
