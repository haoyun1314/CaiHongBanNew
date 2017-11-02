//
//  MyExerciseVC.m
//  rainbowClass
//
//  Created by WangYu on 26/1/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MyExerciseVC.h"
#import "MyExerciseListVC.h"
#import "HMSegmentedControl.h"
#import "PublicHeader.h"
#import "MyCourceDetailListVC.h"

static NSString *CellIdentifier = @"ViewCell";

@interface MyExerciseVC ()

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *pages;//视图
@property (nonatomic, strong) NSArray *titles;//标题

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet HMSegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation MyExerciseVC

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
        
        UIViewController *_listVC;
        
        if (_isMyCourceContainer) {
            _listVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyCourceListVC"];
        } else {
            _listVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MyExerciseListVC"];
        }
        
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
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.segmentedControl.selectedSegmentIndex inSection:0]
                                atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_isMyCourceContainer) {
        _nameLabel.text = @"我的课程";
    }
    
    _dataArray = [NSMutableArray arrayWithObjects:@"幼儿中班音基课", @"幼儿钢琴高级班", @"幼儿唱歌冲击班", @"幼儿唱歌高级班", nil];
    [self setupPageControl];
    [self manageChildViewControllers:_dataArray];
}

//加载子视图
- (void)setupPageControl
{
    self.segmentedControl.selectedSegmentIndex = 0;
    self.segmentedControl.backgroundColor = [UIColor whiteColor];
    self.segmentedControl.titleTextAttributes = @{NSForegroundColorAttributeName : [Util hexStringToColor:@"64523f"],NSFontAttributeName:[UIFont systemFontOfSize:14]};
    self.segmentedControl.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [Util hexStringToColor:@"70cbf2"]};
    self.segmentedControl.selectionIndicatorColor =[Util hexStringToColor:@"70cbf2"];
    self.segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
    self.segmentedControl.selectionIndicatorBoxOpacity = 0.01;
    self.segmentedControl.selectionIndicatorHeight = 1.0;
    self.segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
}

- (void)updateTitleLabels
{
    [self.segmentedControl setSectionTitles:self.titles];
}

- (UIViewController *)selectedController
{
    return self.pages[[self.segmentedControl selectedSegmentIndex]];
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
    return CGSizeMake(CScreenWidth, CScreenHeight - 64 - 39);
}

#pragma mark - ScrollViewdelegate
//检测左右切换视图
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    int page = offset.x / scrollView.frame.size.width;
    [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        CGPoint offset = scrollView.contentOffset;
        int page = offset.x / scrollView.frame.size.width;
        [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
    }
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
