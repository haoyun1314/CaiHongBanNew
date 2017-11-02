//
//  CHBBaseViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBBaseViewController.h"

@interface CHBBaseViewController ()
@property (nonatomic, strong)UINavigationBar *navigationBar;
@property (nonatomic, strong)UINavigationItem *navItem;
@end

@implementation CHBBaseViewController

- (UINavigationBar *)navigationBar
{
    if (!_navigationBar)
    {
        _navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
        _navigationBar.titleTextAttributes = @{  NSForegroundColorAttributeName:COLOR_GRAY_0,NSFontAttributeName : [UIFont boldSystemFontOfSize:CCWFontSize18]};
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, _navigationBar.height-0.5, self.view.frame.size.width, 0.5)];
        lineView.backgroundColor = COLOR_GRAY_0;
        [_navigationBar addSubview:lineView];
        [_navigationBar pushNavigationItem:self.navItem animated:NO];
    }
    return _navigationBar;
}

- (UINavigationItem *)navItem
{
    if (!_navItem) {
        _navItem = [[UINavigationItem alloc]initWithTitle:@""];
    }
    
    return _navItem;
}

- (void)setNavTitle:(NSString *)title
{
    [self.navItem setTitle:title];
}

- (void)setNavTitleView:(UIView *)titleView
{
    self.navItem.titleView = titleView;
}

// 添加导航栏左边按钮（返回按钮）
- (void)setNavLeftBtn
{
    UIImageView *backImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 12, 11, 20)];
    backImage.image = [UIImage imageNamed:@"chb_image_back"];
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 44, 44)];
    [leftButton addSubview:backImage];
    [leftButton addTarget:self action:@selector(leftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitleColor:CMAIN_Color forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navItem.leftBarButtonItem = leftItem;
}

- (void)setNavLeftBtnWithTitle:(NSString *)btnTitle
{
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 48, 44)];
    [leftButton setTitle:btnTitle forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setTitleColor:CMAIN_Color forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navItem.leftBarButtonItem = leftItem;
}

- (void)setNavLeftItem:(UIBarButtonItem *)leftItem
{
    if (leftItem) {
        [self.navItem setLeftBarButtonItem:leftItem];
    }
}

- (void)leftButtonClicked:(UIButton *)btn
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

// 添加导航栏右边按钮
- (void)setNavRightBtnWithTitle:(NSString *)btnTitle
{
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 48, 44)];
    [rightButton setTitle:btnTitle forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitleColor:CMAIN_Color forState:UIControlStateNormal];
    UIBarButtonItem *rigthItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navItem.rightBarButtonItem = rigthItem;
}

- (void)setNavRightBtnWithImage:(NSString *)normalImg andSelectedImage:(NSString *)selectedImg
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 45, 45)];
    [button setBackgroundImage:[UIImage imageNamed:normalImg] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedImg] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(rightButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navItem.rightBarButtonItem = item;
}

- (void)rightButtonClicked:(UIButton *)btn
{
    NSLog(@"error -- rightButtonClicked");
}

- (void)setNavRightItem:(UIBarButtonItem *)rightItem
{
    [self.navItem setRightBarButtonItem:rightItem];
}

- (void)setRightBarButtonItems:(UIBarButtonItem *)rightBarButtonItem other:(UIBarButtonItem *)rightBarButtonItem2
{
    if (CIOS_VERSION_7_OR_ABOVE)
    {
        UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSeperator.width = -12;
        
        if (rightBarButtonItem){
            [self.navItem setRightBarButtonItems:@[negativeSeperator, rightBarButtonItem, rightBarButtonItem2]];
        }
        else{
            [self.navItem setRightBarButtonItems:@[negativeSeperator]];
        }
    }
    else{
        [self.navItem setRightBarButtonItems:@[rightBarButtonItem,rightBarButtonItem2]];
    }
}

- (void)addNavBar
{
    [self.view addSubview:self.navigationBar];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (CIOS_VERSION_7_OR_ABOVE) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = YES;
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)dealloc
{
    
#if DEBUG
    NSLog(@"class:%@ dealloc", NSStringFromClass([self class]));
#endif
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
#if DEBUG
    NSLog(@"class:%@ didReceiveMemoryWarning!", NSStringFromClass([self class]));
#endif
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
