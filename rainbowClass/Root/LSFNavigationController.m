//
//  LSFNavigationController.m
//  zc
//
//  Created by cashyoon on 14-12-3.
//  Copyright (c) 2014年 cashyoon. All rights reserved.
//

#import "LSFNavigationController.h"

@interface LSFNavigationController ()

@end

@implementation LSFNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = CLSFColor(243, 243, 243);
    if (CiOS7) {
        // 重新拥有滑动出栈的功能
        self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count) {
        viewController.hidesBottomBarWhenPushed = YES;
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15, 24)];
        [button setImage:[UIImage imageNamed:Nav_BackItem_Image] forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:Nav_BackItem_Image] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
    }
    [super pushViewController:viewController animated:animated];
}



- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.viewControllers.count == 1)//关闭主界面的右滑返回
    {
        return NO;
    }
    else
    {
        return YES;
        
    }
}



/**
 *  返回
 */
- (void)back
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self popViewControllerAnimated:YES];
}

/**
 *  更多
 */
- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}


- (BOOL)shouldAutorotate
{
    return self.topViewController.shouldAutorotate;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return self.topViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return self.topViewController.preferredInterfaceOrientationForPresentation;
}


@end
