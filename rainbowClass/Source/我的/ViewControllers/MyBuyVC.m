//
//  MyBuyVC.m
//  rainbowClass
//
//  Created by WangYu on 26/1/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MyBuyVC.h"
#import "PublicCourcecell.h"
#import "MyCourceDetailListVC.h"

static NSString *_reuseIdentifier = @"PublicCourcecell";

@interface MyBuyVC ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end


@implementation MyBuyVC

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_collectionView registerNib:[UINib nibWithNibName:_reuseIdentifier bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:_reuseIdentifier];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"MyCourceDetailListVC"]) {
        MyCourceDetailListVC *_listVC = segue.destinationViewController;
        _listVC.courceName = @"钢琴基本指法入门";
    }
}
@end
