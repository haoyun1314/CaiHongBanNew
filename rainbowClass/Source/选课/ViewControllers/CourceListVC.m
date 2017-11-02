//
//  CourceListVC.m
//  rainbowClass
//
//  Created by WangYu on 28/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CourceListVC.h"
#import "HMSegmentedControl.h"
#import "CourceListContentVC.h"

static NSString *CellIdentifier = @"ViewCell";

@interface CourceListVC ()

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *pages;//视图
@property (nonatomic, strong) NSArray *titles;//标题

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet HMSegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *segmentControlWith;

@end

@implementation CourceListVC

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
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

//处理显示子视图数据
- (void)manageChildViewControllers:(NSArray *)dataArray
{
    NSMutableArray *_titleArray = [NSMutableArray array];
    NSMutableArray *_controller = [NSMutableArray array];
    
    for (NSString *_title in dataArray) {
        CourceListContentVC *_listVC = [[CourceListContentVC alloc] initWithNibName:@"CourceListContentVC" bundle:[NSBundle mainBundle]];
        [_controller addObject:_listVC];
        [_titleArray addObject:_title];
    }
    
    [self setPages:_controller];
    self.titles = _titleArray;
    [_collectionView reloadData];
    [self updateTitleLabels];
}

//点击切换视图
- (IBAction)pageControlValueChanged:(id)sender {
    [self.collectionView layoutIfNeeded];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.segmentControl.selectedSegmentIndex inSection:0]
                                atScrollPosition:UICollectionViewScrollPositionNone
                                        animated:NO];
}

#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    
    _dataArray = [NSMutableArray arrayWithObjects:@"精品课程", @"大师直播", @"大师课堂", nil];
    [self setupPageControl];
    [self manageChildViewControllers:_dataArray];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

//加载子视图
- (void)setupPageControl
{
    
    self.segmentControl.selectedSegmentIndex = 0;
    self.segmentControl.backgroundColor = [Util hexStringToColor:@"6ed5ff"];
    
    if (CScreenWidth < 375) {
        //320时宽度缩小，否则显示不完整
        _segmentControlWith.constant = 225;
        self.segmentControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor] ,NSFontAttributeName : [UIFont systemFontOfSize:16]};
    } else {
        self.segmentControl.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor] ,NSFontAttributeName : [UIFont systemFontOfSize:17]};
    }
    self.segmentControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.segmentControl.selectionIndicatorColor = [Util hexStringToColor:@"fc673e"];
    self.segmentControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentControl.selectionIndicatorBoxOpacity = 0.01;
    self.segmentControl.selectionIndicatorHeight = 2;
    self.segmentControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
}

- (void)updateTitleLabels
{
    [self.segmentControl setSectionTitles:self.titles];
}

- (UIViewController *)selectedController
{
    return self.pages[[self.segmentControl selectedSegmentIndex]];
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.pages count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier
                                                                           forIndexPath:indexPath];
    //清除cell中的subviews
    while ([cell.contentView.subviews lastObject] != nil)
    {
        [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
    }
    NSInteger row = indexPath.row;
    UIViewController *vc = [self.pages objectAtIndex:row];
    vc.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:vc.view];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CScreenWidth, CScreenHeight - 64);
}

#pragma mark - ScrollViewdelegate
//检测左右切换视图
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    int page = offset.x / scrollView.frame.size.width;
    [self.segmentControl setSelectedSegmentIndex:page animated:YES];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        CGPoint offset = scrollView.contentOffset;
        int page = offset.x / scrollView.frame.size.width;
        [self.segmentControl setSelectedSegmentIndex:page animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
