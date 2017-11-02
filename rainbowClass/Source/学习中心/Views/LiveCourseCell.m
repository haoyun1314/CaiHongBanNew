//
//  LiveCourseCell.m
//  rainbowClass
//
//  Created by cashyoon on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "LiveCourseCell.h"
#import "LiveCollectionViewCell.h"

@implementation LiveCourseCell 


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
//        self.backgroundColor = [UIColor blueColor];
        [self reloadUI];
    }
    return self;

}


-(void)reloadUI

{

    
    self.titleImageView= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,CSCREEN_WIDTH, 46*CEqualSixScale)];
      _titleImageView.image = [UIImage imageNamed:@"学习中心1.png"];
    [self.contentView addSubview:_titleImageView];
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(147.5*CEqualSixScale, 102.5*CEqualSixScale);
    layout.sectionInset = UIEdgeInsetsMake(10*CEqualSixScale, 10*CEqualSixScale, 10*CEqualSixScale, 10*CEqualSixScale);

    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.liveCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,  _titleImageView.bottom, CScreenWidth, 141*CEqualSixScale) collectionViewLayout:layout];

    
    
    
    
    
//    _liveCollectionView.autoresizingMask =  UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
//    _liveCollectionView.scrollEnabled = NO;
    _liveCollectionView.delegate = self;
    _liveCollectionView.dataSource = self;
    _liveCollectionView.backgroundColor = CWhiteColor;
    [_liveCollectionView setUserInteractionEnabled:YES];
    [_liveCollectionView setPagingEnabled:YES];
    _liveCollectionView.showsHorizontalScrollIndicator = NO;
    

    [self.contentView  addSubview:_liveCollectionView];
    
    [_liveCollectionView  registerClass:[LiveCollectionViewCell class] forCellWithReuseIdentifier:@"LiveCell"];

    

}



#pragma mark ---CollectionViewDelegrate--

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView

{
    
    return 1;
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
    
    return 100;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
        static NSString *cellID = @"LiveCell";
        LiveCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
        return cell;
    
}




- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    
    
}







- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
