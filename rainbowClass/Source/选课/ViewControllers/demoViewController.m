//
//  demoViewController.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/3.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "demoViewController.h"
#import "HMSegmentedControl.h"
#import "CourceListContentVC.h"

static NSString *CellIdentifier = @"ViewCell";

@interface demoViewController ()
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *pages;//视图
@property (nonatomic, strong) NSArray *titles;//标题

@property (weak, nonatomic) UICollectionView *collectionView;
@property (weak, nonatomic) HMSegmentedControl *segmentControl;

@end

@implementation demoViewController

@synthesize pages = _pages;

- (NSMutableArray *)pages
{
    if (!_pages)
        _pages = [NSMutableArray new];
    return _pages;
}

- (void)setPages:(NSMutableArray *)pages
{
    for (UIViewController *vc in pages) {
        [self addChildViewController:vc];
    }
    _pages = pages;
}

#pragma mark - 事件处理方法
- (void)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    
    _dataArray = [NSMutableArray arrayWithObjects:@"精品课程", @"大师直播", @"大师课堂", nil];
    
    [self setupPageControl];
    
//    [self manageChildViewControllers:_dataArray];
    
}

//加载子视图
- (void)setupPageControl
{
    self.segmentControl.selectedSegmentIndex = 0; //默认选中
    self.segmentControl.backgroundColor = [Util hexStringToColor:@"6ed5ff"];  //背景颜色
    self.segmentControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor] ,NSFontAttributeName : [UIFont systemFontOfSize:17]}; //文本样式
    self.segmentControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]}; //选中颜色
    self.segmentControl.selectionIndicatorColor = [Util hexStringToColor:@"fc673e"]; //指标颜色
    self.segmentControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;   //类型
    self.segmentControl.selectionIndicatorBoxOpacity = 0.01;
    self.segmentControl.selectionIndicatorHeight = 2;   //  指标高度
    self.segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown; //指标位置
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
