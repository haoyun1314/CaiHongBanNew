//
//  MyCourceVC.m
//  rainbowClass
//
//  Created by WangYu on 26/1/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MyCourceVC.h"
#import "MyCourceCell.h"
#import "PublicHeader.h"
#import "MyCourceHeaderView.h"
#import "MyCourceFooterView.h"
#import "MyCourceDetailListVC.h"

@interface MyCourceVC ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation MyCourceVC

#pragma mark - 事件处理
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - CollectionviewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCourceCell *_cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCourceCell" forIndexPath:indexPath];
    _cell.banner.image = [UIImage imageNamed:@"我的课程_01"];
    _cell.courceName.text = @"4岁钢琴入门大师班";
    _cell.priceLabel.text = @"2999元";
    return _cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"MyCourceDetailListVC" sender:indexPath];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = floorf((CScreenWidth - 27) / 2);
    return CGSizeMake(width, width * 50 / 87 + 49);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *_reusableView = nil;
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]) {
        MyCourceHeaderView *_headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyCourceHeaderView" forIndexPath:indexPath];
        
        NSString *title = [[NSString alloc] initWithFormat:@"%ld年",2016 - indexPath.section];
        _headerView.timeLabel.text = title;
        
        _reusableView = _headerView;
    }
    
    if ([kind isEqualToString: UICollectionElementKindSectionFooter]) {
        MyCourceFooterView *_footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MyCourceFooterView" forIndexPath:indexPath];
        if (indexPath.section == 2) {
            _footerview.backgroundColor = [UIColor whiteColor];
        } else {
            _footerview.backgroundColor = CLSFColor(243, 243, 243);
        }
        _reusableView = _footerview;
    }
    return _reusableView;
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
        _listVC.courceName = @"4岁钢琴入门大师班";
    }
}


@end
