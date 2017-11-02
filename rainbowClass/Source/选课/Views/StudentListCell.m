//
//  StudentListCell.m
//  rainbowClass
//
//  Created by WangYu on 11/3/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "StudentListCell.h"

@implementation StudentListCell

- (void)awakeFromNib {
    // Initialization code
    _headImage.clipsToBounds = YES;
    _headImage.layer.cornerRadius = 22;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
