//
//  searchViewCell.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "searchViewCell.h"

@implementation searchViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code  10 + 8 + 107 + 20 + 10
        //自定义单元格
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(8 * CEqualSixScale, 10 * CEqualSixScale, 176 * CEqualSixScale,107 * CEqualSixScale)];
        [self.contentView addSubview:self.imgView];
        
        UIImage *iconImg = [UIImage imageNamed:@"SearchVC_chakan"];
        UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(_imgView.frame.size.width - 34 *CEqualSixScale , _imgView.frame.size.height - 17 * CEqualSixScale, 34 *CEqualSixScale, 17 * CEqualSixScale)];
        icon.image = iconImg;
        [_imgView addSubview:icon];
        
        
        _lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(7 * CEqualSixScale , _imgView.bottom + 8 * CEqualSixScale , CSCREEN_WIDTH/2 - 60 *CEqualSixScale, 20*CEqualSixScale)];
        _lblTitle.font = [UIFont systemFontOfSize:15 * CEqualSixScale];
        [self.contentView addSubview:_lblTitle];
        
        
        _lblPrice = [[UILabel alloc]initWithFrame:CGRectMake(_lblTitle.right , _lblTitle.frame.origin.y , CSCREEN_WIDTH/2 - _lblTitle.right - 1 * CEqualSixScale  , 20*CEqualSixScale)];
        _lblPrice.textAlignment = NSTextAlignmentRight;
        _lblPrice.textColor = [Util hexStringToColor:@"ff6634"];
        _lblPrice.font = [UIFont systemFontOfSize:15 * CEqualSixScale];
        [self.contentView addSubview:_lblPrice];
        
        //右边
        _imgView2 = [[UIImageView alloc]initWithFrame:CGRectMake(CSCREEN_WIDTH/2 + 3.5 * CEqualSixScale, 10 * CEqualSixScale, 176 * CEqualSixScale,107 * CEqualSixScale)];
        [self.contentView addSubview:self.imgView2];
        
        UIImage *iconImg2 = [UIImage imageNamed:@"SearchVC_chakan"];
        UIImageView *icon2 = [[UIImageView alloc]initWithFrame:CGRectMake(_imgView2.frame.size.width - 34 *CEqualSixScale , _imgView2.frame.size.height - 17 * CEqualSixScale, 34 *CEqualSixScale, 17 * CEqualSixScale)];
        icon2.image = iconImg2;
        [_imgView2 addSubview:icon2];
        
        
        _lblTitle2 = [[UILabel alloc]initWithFrame:CGRectMake(CSCREEN_WIDTH/2 + 2.5 * CEqualSixScale , _imgView2.bottom + 8 * CEqualSixScale , CSCREEN_WIDTH/2 - 60 *CEqualSixScale, 20*CEqualSixScale)];
        _lblTitle2.font = [UIFont systemFontOfSize:15 * CEqualSixScale];
        [self.contentView addSubview:_lblTitle2];
        
        
        _lblPrice2 = [[UILabel alloc]initWithFrame:CGRectMake(_lblTitle2.right , _lblTitle2.frame.origin.y , CSCREEN_WIDTH - _lblTitle2.right - 5 * CEqualSixScale, 20*CEqualSixScale)];
        _lblPrice2.textAlignment = NSTextAlignmentRight;
        _lblPrice2.textColor = [Util hexStringToColor:@"ff6634"];
        _lblPrice2.font = [UIFont systemFontOfSize:15 * CEqualSixScale];
        [self.contentView addSubview:_lblPrice2];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
