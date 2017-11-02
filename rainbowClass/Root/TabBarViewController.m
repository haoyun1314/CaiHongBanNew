//
//  TabBarViewController.m
//  bumeng
//
//  Created by cashyoon on 15/3/5.
//  Copyright (c) 2015年 GUWH. All rights reserved.
//

#import "TabBarViewController.h"
#import "LSFNavigationController.h"
#import "RootViewController.h"
#import "CHBXuexizhongxinViewController.h"
#import "CHBXuankeViewController.h"
#import "CHBShequnViewController.h"
#import "CHBWodeViewController.h"

#import "CHBLaunchViewController.h"//loading 启动页广告

@interface TabBarViewController ()

@end

@implementation TabBarViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    if (CiOS7){
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = YES;
    }
    // 启动页广告
    [CHBLaunchViewController showLaunchView];
    
    [self createViewControllers];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createViewControllers
{
    NSArray * array = @[@"CHBXuexizhongxinViewController",
                        @"CHBXuankeViewController",@"CHBShequnViewController",@"CHBWodeViewController"];
    /*创建视图控制器*/
    NSMutableArray * viewControllers = [NSMutableArray array];
    for (NSString * className in array) {
        
        //创建不同类的class
        Class vcClass = NSClassFromString(className);
        
        //创建不同类的对象
        RootViewController * rvc = [[vcClass alloc] init];
        
        if ([className isEqualToString:@"CHBWodeViewController"])
        {
            UIStoryboard *personalCenterSB = [UIStoryboard storyboardWithName:@"PersonalCenterStoryboard" bundle:nil];
            CHBWodeViewController *WodeVC = personalCenterSB.instantiateInitialViewController;
            
            rvc = WodeVC;
        }
        
        //获取初始化的信息
        rvc.infoDict = [self infoDictionaryForViewController:rvc];
        //初始化tabBarItem
        [rvc customTabBarItem];
        
//        rvc.tabBarItem.badgeValue  = @"0";
        
        //创建导航控制器
        LSFNavigationController * nc = [[LSFNavigationController alloc] initWithRootViewController:rvc];
        
        
        //nc添加数组
        [viewControllers addObject:nc];
    }
    
//    [self createBadgeValue];
//    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tab_bg"];
    self.tabBar.alpha = 0.95;
    self.viewControllers = viewControllers;
    self.selectedIndex = 1;

}
- (void)createBadgeValue
{
    for (int i = 0; i< 4; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(CScreenWidth/4*i+CScreenWidth/8+10, 6, 9, 9)];
        imageView.image = [UIImage imageNamed:@"navigation_message3"];
        imageView.tag = 9001+i;
        [self.tabBar addSubview:imageView];
    }
}



//创建字典,根据视图控制器创建字典
- (NSDictionary *)infoDictionaryForViewController:(RootViewController *)vc
{
    //我们可以将不同视图控制器的tabItem。tabBarTitle，乃至导航标题，装入一个字典中返回，
    //一起赋值给视图控制器
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    
    if ([vc isKindOfClass:[CHBXuexizhongxinViewController class]] == YES) {
        
//         vc.tabBarItem.title = @"学习中心";
        
        
        [dict setObject:[UIImage imageNamed:@"tab_01"] forKey:TABBAR_IMAGE];
        [dict setObject:[UIImage imageNamed:@"tab_01_pres"] forKey:TABBAR_SELECTED_IMAGE];
    }else if ([vc isKindOfClass:[CHBXuankeViewController class]] == YES) {
//        vc.tabBarItem.title = @"选课";

        [dict setObject:[UIImage imageNamed:@"tab_02"] forKey:TABBAR_IMAGE];
        [dict setObject:[UIImage imageNamed:@"tab_02_pres"] forKey:TABBAR_SELECTED_IMAGE];
    }else if ([vc isKindOfClass:[CHBShequnViewController class]] == YES) {
//        vc.tabBarItem.title = @"社群";

        [dict setObject:[UIImage imageNamed:@"tab_03"] forKey:TABBAR_IMAGE];
        [dict setObject:[UIImage imageNamed:@"tab_03_pres"] forKey:TABBAR_SELECTED_IMAGE];
    }else if ([vc isKindOfClass:[CHBWodeViewController class]] == YES) {
//        vc.tabBarItem.title = @"我的";

        [dict setObject:[UIImage imageNamed:@"tab_04"] forKey:TABBAR_IMAGE];
        [dict setObject:[UIImage imageNamed:@"tab_04_pres"] forKey:TABBAR_SELECTED_IMAGE];
    }
    return dict;
}





@end
