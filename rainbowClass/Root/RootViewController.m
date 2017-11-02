//
//  RootViewController.m
//  bumeng
//
//  Created by cashyoon on 15/3/5.
//  Copyright (c) 2015年 GUWH. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController
{
    UILabel * _titleLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self customNavigationBar];
     self.view.backgroundColor = CLSFColor(243, 243, 243);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 样式定制
- (void)customTabBarItem
{
    //    self.title = self.infoDict[NAV_TITLE];
    //判断版本号
    if (CiOS7) {
        self.tabBarItem.image = [self.infoDict[TABBAR_IMAGE]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.selectedImage = [self.infoDict[TABBAR_SELECTED_IMAGE] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else{
        self.tabBarItem.image = self.infoDict[TABBAR_IMAGE];
        self.tabBarItem.selectedImage = self.infoDict[TABBAR_SELECTED_IMAGE];
    }
    self.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    

}
//设置导航条样式，父类实现了这个方法，子类并不一定每个视图控制器都需要调用
- (void)customNavigationBar
{
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    //不透明
    self.navigationController.navigationBar.translucent = NO;
    //添加背景图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"homePage"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.backgroundColor = [UIColor orangeColor];
    
    //定制titleView
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 44)];
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.textColor = [UIColor blackColor];
    
    self.navigationItem.titleView = _titleLabel;
}
//视图控制器自带设置标题的set方法，重写这个方法
- (void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
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
