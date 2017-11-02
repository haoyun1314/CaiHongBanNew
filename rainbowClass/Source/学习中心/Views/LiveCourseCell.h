//
//  LiveCourseCell.h
//  rainbowClass
//
//  Created by cashyoon on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveCourseCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
{

}

@property (nonatomic,strong)UIImageView *  titleImageView;

@property (nonatomic,strong)UICollectionView * liveCollectionView;


@end
