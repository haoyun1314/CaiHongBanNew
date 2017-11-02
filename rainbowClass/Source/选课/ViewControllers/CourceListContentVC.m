//
//  CourceListContentVC.m
//  rainbowClass
//
//  Created by WangYu on 28/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CourceListContentVC.h"
#import "PublicCourcecell.h"
#import "MyCourceDetailListVC.h"
#import "CourceNotBuyDetailVC.h"

static NSString *_reuseIdentifier = @"PublicCourcecell";

@interface CourceListContentVC ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnWidth;
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;

@property (nonatomic, strong) UIButton *selectedBtn;
@end

@implementation CourceListContentVC

- (IBAction)titleBtnAction:(id)sender {
    UIButton *_touchBtn = (UIButton *)sender;
    if (!(_touchBtn.tag == _selectedBtn.tag)) {
        [self setButtonSelectState:NO];
        _selectedBtn = _touchBtn;
        [self setButtonSelectState:YES];
    }
}

- (void)setButtonSelectState:(BOOL)state
{
    [_selectedBtn setBackgroundImage:nil forState:UIControlStateHighlighted];
    if (state) {
        [_selectedBtn setBackgroundImage:[UIImage imageNamed:@"playVideo_cloud"] forState:UIControlStateSelected];
        [_selectedBtn setTitleColor:[Util hexStringToColor:@"ff6634"] forState:UIControlStateSelected];
        _selectedBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _selectedBtn.selected = YES;
    } else {
        [_selectedBtn setBackgroundImage:nil forState:UIControlStateSelected];
        [_selectedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _selectedBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _selectedBtn.selected = NO;
    }
}

#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (CScreenWidth < 375) {
        _btnWidth.constant = (CScreenWidth - 54) / 5;
    } else {
        _btnWidth.constant = (CScreenWidth - 74) / 5;
    }
    
    
    [_collectionView registerNib:[UINib nibWithNibName:_reuseIdentifier bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:_reuseIdentifier];
    
    _selectedBtn = _firstBtn;
    [self setButtonSelectState:YES];
}

#pragma mark - CollectionviewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PublicCourcecell *_cell = [collectionView dequeueReusableCellWithReuseIdentifier:_reuseIdentifier forIndexPath:indexPath];
    _cell.cancelCollectBtn.hidden = YES;
    if (indexPath.row % 2 == 0) {
        _cell.alreadyBuy.image = [UIImage imageNamed:@"我的已购买"];
    } else {
        _cell.alreadyBuy.image = [UIImage imageNamed:@"我的未购买"];
    }
    return _cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0) {
        UIStoryboard *_storyboard = [UIStoryboard storyboardWithName:@"PersonalCenterStoryboard" bundle:[NSBundle mainBundle]];
        MyCourceDetailListVC *_detailVC = [_storyboard instantiateViewControllerWithIdentifier:@"MyCourceDetailListVC"];
        _detailVC.courceName = @"钢琴基本指法入门";
        [self.navigationController pushViewController:_detailVC animated:YES];
    } else {
        CourceNotBuyDetailVC *_notBuyVC = [[CourceNotBuyDetailVC alloc] initWithNibName:@"CourceNotBuyDetailVC" bundle:[NSBundle mainBundle]];
        [self.navigationController pushViewController:_notBuyVC animated:YES];
    }

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = floorf((CScreenWidth - 30) / 2);
    return CGSizeMake(width, width * 50 / 86 + 40);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
