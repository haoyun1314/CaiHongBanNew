//
//  CollectAndWatchListVC.m
//  rainbowClass
//
//  Created by WangYu on 7/3/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CollectAndWatchListVC.h"
#import "PublicCourcecell.h"
#import "MyCourceDetailListVC.h"

static NSString *_reuseIdentifier = @"PublicCourcecell";

@interface CollectAndWatchListVC ()<PublicCourceDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation CollectAndWatchListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_collectionView registerNib:[UINib nibWithNibName:_reuseIdentifier bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:_reuseIdentifier];
    _dataArray = [NSMutableArray arrayWithObjects:@"第一课", @"第二课", @"第三课", @"第四课", @"第五课", @"第六课", @"第七课", @"第八课", @"第九课", @"第十课", nil];
}

#pragma mark - CollectionviewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PublicCourcecell *_cell = [collectionView dequeueReusableCellWithReuseIdentifier:_reuseIdentifier forIndexPath:indexPath];
    _cell.alreadyBuy.hidden = YES;
    if (_listType == CollectListType) {
        _cell.delegate = self;
        _cell.indexPath = indexPath;
    } else {
        _cell.cancelCollectBtn.hidden = YES;
    }
    
    return _cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"MyCourceDetailListVC" sender:indexPath];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = floorf((CScreenWidth - 30) / 2);
    return CGSizeMake(width, width * 50 / 86 + 40);
}

#pragma mark - PublicCourceDelegate

- (void)cancelCollectCourceByIndexPath:(NSIndexPath *)indexPath
{
    [_dataArray removeObjectAtIndex:indexPath.row];
    [_collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MyCourceDetailListVC"]) {
        MyCourceDetailListVC *_listVC = segue.destinationViewController;
        NSIndexPath *_indexPath = (NSIndexPath *)sender;
        _listVC.courceName = _dataArray[_indexPath.row];
    }
}


@end
