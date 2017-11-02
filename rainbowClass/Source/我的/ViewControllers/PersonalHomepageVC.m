//
//  PersonalHomepageVC.m
//  rainbowClass
//
//  Created by WangYu on 26/1/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "PersonalHomepageVC.h"
#import "HomePageListHeaderView.h"
#import "HomePageSctionHeaderView.h"
#import "HomePageListCell.h"

@interface PersonalHomepageVC ()

@end

@implementation PersonalHomepageVC

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)shareAction:(id)sender {
    NSLog(@"分享");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [super viewWillAppear:animated];
}

#pragma mark - CollectionviewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    if (section == 3) {
        return 5;
    }
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageListCell *_cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageListCell" forIndexPath:indexPath];
    _cell.dateLabel.text = @"2015-03-04";
    _cell.timeLabel.text = @"12:00";
    
    NSString *_starImageName = @"oneStar";
    switch (indexPath.row) {
        case 0:
        {
           _starImageName = @"fiveStar";
        }
            break;
        case 1:
        {
            _starImageName = @"fourStar";
        }
            break;
        case 2:
        {
            _starImageName = @"threeStar";
        }
            break;
        case 3:
        {
            _starImageName = @"twoStar";
        }
            break;
            
        default:
            break;
    }
    _cell.starView.image = [UIImage imageNamed:_starImageName];
    return _cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = floorf((CScreenWidth - 25) / 2);
    return CGSizeMake(width, width / 7 * 4 + 34);
}

//顶部显示的头视图是第一个分区的头部视图
//其他分区的显示头视图为上个分区的底部视图，本身没有头部视图
//最后一个分区的尾部视图隐藏
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return CGSizeMake(CScreenWidth, 315);
    }
    return CGSizeMake(0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 3) {
        return CGSizeMake(0, 0);
    }
    return CGSizeMake(CScreenWidth, 58);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]) {
        if (indexPath.section == 0){
            HomePageListHeaderView *_headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomePageListHeaderView" forIndexPath:indexPath];
            NSString *title = [[NSString alloc] initWithFormat:@"%ld年",2016 - indexPath.section];
            _headerView.yearLabel.text = title;
            return _headerView;
        }
    }
    
    HomePageSctionHeaderView *_sectionHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HomePageSctionHeaderView" forIndexPath:indexPath];
    NSString *title = [[NSString alloc] initWithFormat:@"%ld年",2016 - indexPath.section - 1];
    _sectionHeader.yearLabel.text = title;
    return _sectionHeader;
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
