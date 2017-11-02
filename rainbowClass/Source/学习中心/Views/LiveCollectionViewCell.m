//
//  LiveCollectionViewCell.m
//  rainbowClass
//
//  Created by cashyoon on 16/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "LiveCollectionViewCell.h"

@implementation LiveCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self reloadCellUI];
    }
    return self;
}


-(void)reloadCellUI
{
    
   self.backVdeioImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 147.5*CEqualSixScale, 83.5*CEqualSixScale)];
    _backVdeioImageView.image  = [UIImage imageNamed:@"未标题1.png"];
    [self.contentView addSubview:_backVdeioImageView];
    
    
    
    self.courseName = [VBase UILabelWithFrame:CGRectMake(0, _backVdeioImageView.bottom,_backVdeioImageView.width, 19*CEqualSixScale) AndText:@"钢琴入门第三课" AndtextColor:[UIColor blackColor] AndSuperView:self.contentView];
    self.courseName.font = [UIFont systemFontOfSize:14];
    
}



@end
