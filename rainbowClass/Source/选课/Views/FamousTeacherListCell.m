//
//  FamousTeacherListCell.m
//  rainbowClass
//
//  Created by WangYu on 14/3/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "FamousTeacherListCell.h"

@implementation FamousTeacherListCell

- (void)awakeFromNib {
    // Initialization code
    _backView.layer.borderColor = [[Util hexStringToColor:@"dcdcdc"] CGColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
