//
//  LiveListVC.m
//  rainbowClass
//
//  Created by WangYu on 9/3/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "LiveListVC.h"
#import "CourceListContentVC.h"

@interface LiveListVC ()

@end

@implementation LiveListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"大师直播";
    
    CourceListContentVC *_listVC = [[CourceListContentVC alloc] initWithNibName:@"CourceListContentVC" bundle:[NSBundle mainBundle]];
    [self addChildViewController:_listVC];
    
    _listVC.view.frame = self.view.bounds;
    [self.view addSubview:_listVC.view];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillAppear:animated];
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
