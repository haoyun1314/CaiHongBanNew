//
//  ViewController.m
//  rainbowClass
//
//  Created by 张佳伟 on 16/1/4.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "ViewController.h"

#import "CHBXuexizhongxinViewController.h"
#import "CHBXuankeViewController.h"
#import "CHBShequnViewController.h"
#import "CHBWodeViewController.h"

@interface ViewController ()<UITabBarControllerDelegate>

@property (nonatomic, strong)UINavigationController *xuexizhongxinNav;
@property (nonatomic, strong)UINavigationController *xuankeNav;
@property (nonatomic, strong)UINavigationController *shequnNav;
@property (nonatomic, strong)UINavigationController *wodeNav;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"测试");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
