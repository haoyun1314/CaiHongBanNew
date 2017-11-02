//
//  masterClassCell.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/3.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "masterClassCell.h"

@implementation masterClassCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //自定义单元格
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(20*CEqualSixScale, 30*CEqualSixScale, CSCREEN_WIDTH-(20*CEqualSixScale*2),
        (CSCREEN_WIDTH-(20*CEqualSixScale*2))*0.562)];
        [[_imgView layer] setMasksToBounds:YES];
        [_imgView.layer setCornerRadius:5.0];//设置矩形四个圆角半径
        _imgView.layer.borderWidth = 2.5;
        _imgView.layer.borderColor = [UIColor whiteColor].CGColor;
        [self.contentView addSubview:self.imgView];
        
        _lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(_imgView.frame.origin.x, _imgView.frame.origin.y+_imgView.frame.size.height, 80 * CEqualSixScale, 34*CEqualSixScale)];
        _lblTitle.font = [UIFont systemFontOfSize:13 * CEqualSixScale];
        _lblTitle.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_lblTitle];
        
        _lblPrice = [[UILabel alloc]initWithFrame:CGRectMake(_lblTitle.frame.origin.x + _lblTitle.frame.size.width + 5*CEqualSixScale, _lblTitle.frame.origin.y, 40*CEqualSixScale, 34*CEqualSixScale)];
        _lblPrice.textColor = [UIColor whiteColor];
        _lblPrice.textAlignment = NSTextAlignmentCenter;
        _lblPrice.textColor = [UIColor redColor];
//        _lblPrice.backgroundColor = [UIColor yellowColor];
        _lblPrice.font = [UIFont systemFontOfSize:13 * CEqualSixScale];
        [self.contentView addSubview:_lblPrice];
        
        _lblName = [[UILabel alloc]initWithFrame:CGRectMake(_lblPrice.frame.origin.x + _lblPrice.frame.size.width + 5*CEqualSixScale, _lblPrice.frame.origin.y, 40*CEqualSixScale, 34*CEqualSixScale)];
        _lblName.textColor = [UIColor whiteColor];
//        _lblName.backgroundColor = [UIColor lightGrayColor];
        _lblName.font = [UIFont systemFontOfSize:13 * CEqualSixScale];
        [self.contentView addSubview:_lblName];
        
        _lblsubtitle = [[UILabel alloc]initWithFrame:CGRectMake(_lblName.frame.origin.x + _lblName.frame.size.width + 5*CEqualSixScale, _lblName.frame.origin.y, 165 * CEqualSixScale, 34 * CEqualSixScale)];
        _lblsubtitle.textColor = [UIColor whiteColor];
        _lblsubtitle.font = [UIFont systemFontOfSize:13 * CEqualSixScale];
        [self.contentView addSubview:_lblsubtitle];
        
        
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
