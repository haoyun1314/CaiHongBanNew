//
//  classListCell.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/28.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "classListCell.h"

@implementation classListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //自定义单元格
        
        _lblChapter = [[UILabel alloc]initWithFrame:CGRectMake(8 * CEqualSixScale, 0 , 100 * CEqualSixScale , 43 * CEqualSixScale )];
        _lblChapter.textColor = [Util hexStringToColor:@"9f9f9f"];
        _lblChapter.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
        [self.contentView addSubview:_lblChapter];
        
        _lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(_lblChapter.right + 5 * CEqualSixScale, 0, 120 * CEqualSixScale, 43 * CEqualSixScale)];
        _lblTitle.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
        _lblTitle.textColor = [Util hexStringToColor:@"9f9f9f"];
        [self.contentView addSubview:_lblTitle];
        
        _lblPrice = [[UILabel alloc]initWithFrame:CGRectMake(_lblTitle.right+ 5*CEqualSixScale, 0, 45*CEqualSixScale, 43*CEqualSixScale)];
        _lblPrice.textColor = [UIColor whiteColor];
        _lblPrice.textAlignment = NSTextAlignmentCenter;
        _lblPrice.textColor = [Util hexStringToColor:@"ff6634"];
        _lblPrice.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
        [self.contentView addSubview:_lblPrice];
        
        UIButton *tryBtn = [[UIButton alloc]initWithFrame:CGRectMake(_lblPrice.right +2*CEqualSixScale, 0, 40 * CEqualSixScale, 43 *CEqualSixScale)];
        [tryBtn setTitle:@"试听" forState:UIControlStateNormal];
        [tryBtn setTitleColor:[Util hexStringToColor:@"73d6ff"] forState:UIControlStateNormal];
        tryBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0 * CEqualSixScale];
        [self.contentView addSubview:tryBtn];
        
        UIButton *playVideoBtn = [[UIButton alloc]initWithFrame:CGRectMake(CSCREEN_WIDTH - 45*CEqualSixScale , 0, 43 * CEqualSixScale, 43 *CEqualSixScale)];
        [playVideoBtn setTitle:@"播放" forState:UIControlStateNormal];
        [playVideoBtn setTitleColor:[Util hexStringToColor:@"73d6ff"] forState:UIControlStateNormal];
        playVideoBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0 * CEqualSixScale];
        [self.contentView addSubview:playVideoBtn];

        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
