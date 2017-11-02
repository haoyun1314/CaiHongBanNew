//
//  CollectAndWatchVC.m
//  rainbowClass
//
//  Created by WangYu on 26/1/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CollectAndWatchVC.h"
#import "CollectAndWatchListVC.h"

static NSString *CellIdentifier = @"ViewCell";

@interface CollectAndWatchVC ()
@property (weak, nonatomic) IBOutlet UIButton *myCollectBtn;
@property (weak, nonatomic) IBOutlet UIButton *myWatchBtn;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *pages;

@end

@implementation CollectAndWatchVC

#pragma mark - 事件处理

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)selectedAction:(id)sender {
    UIButton *_touchBtn = (UIButton *)sender;
    int pageIndex = (int)_touchBtn.tag - 600;
    [self selectControllerIndex:pageIndex];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:pageIndex inSection:0]
                                atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

- (void)setButton:(UIButton *)button SelectState:(BOOL)state
{
    if (state) {
        [button setBackgroundImage:[UIImage imageNamed:@"wode_baiyun"] forState:UIControlStateSelected];
        [button setTitleColor:[Util hexStringToColor:@"ff6634"] forState:UIControlStateSelected];
        button.selected = YES;
    } else {
        [button setBackgroundImage:nil forState:UIControlStateSelected];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.selected = NO;
    }
}

- (void)selectControllerIndex:(int)pageIndex
{
    switch (pageIndex) {
        case 0:
        {
            [self setButton:_myCollectBtn SelectState:YES];
            [self setButton:_myWatchBtn SelectState:NO];
        }
            break;
        case 1:
        {
            [self setButton:_myCollectBtn SelectState:NO];
            [self setButton:_myWatchBtn SelectState:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _pages = [NSMutableArray array];
    for (int i = 0; i < 2; i++) {
        CollectAndWatchListVC *_listVC = [self.storyboard instantiateViewControllerWithIdentifier:@"CollectAndWatchListVC"];
        _listVC.listType = i;
        [_pages addObject:_listVC];
        [self addChildViewController:_listVC];
    }
    [_collectionView reloadData];
    [self selectControllerIndex:0];
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _pages.count;
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
    UIViewController *vc = [_pages objectAtIndex:indexPath.row];
    vc.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:vc.view];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CScreenWidth, CScreenHeight - 108);
}

#pragma mark - ScrollViewdelegate
//检测左右切换视图
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    int page = offset.x / scrollView.frame.size.width;
    [self selectControllerIndex:page];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        CGPoint offset = scrollView.contentOffset;
        int page = offset.x / scrollView.frame.size.width;
        [self selectControllerIndex:page];
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
