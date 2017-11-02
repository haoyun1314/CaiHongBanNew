//
//  teacherCoursesCell.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/18.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "teacherCoursesCell.h"

@implementation teacherCoursesCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        //自定义单元格
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10*CEqualSixScale, 10*CEqualSixScale, 184.5*CEqualSixScale,
                                                                110*CEqualSixScale)];
        
        [self.contentView addSubview:self.imgView];
        
        UIImage *img;
        if ([_videoType isEqualToString:@"live"]) {
            img = [UIImage imageNamed:@"teacherHomePage_live"];
        } else if ([_videoType isEqualToString:@"lubo"]) {
            img = [UIImage imageNamed:@"teacherHomePage_lubo"];
        }else {
            img = [UIImage imageNamed:@"teacherHomePage_yugao"];
        }
        UIImageView *videoType = [[UIImageView alloc]initWithFrame:CGRectMake((184.5 - 34) * CEqualSixScale , 0, 34 * CEqualSixScale, 16 * CEqualSixScale)];
        videoType.image = img;
        [_imgView addSubview:videoType];

        
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 85*CEqualSixScale, _imgView.frame.size.width, 25 * CEqualSixScale)];
        bgView.backgroundColor = CMAIN_Color;
        [_imgView addSubview:bgView];
        
        UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(5 * CEqualSixScale, 6 * CEqualSixScale, 13 * CEqualSixScale, 13 * CEqualSixScale)];
        icon.image = [UIImage imageNamed:@"teacherHomePage_PlayIcon"];
        [bgView addSubview:icon];
        
        _lblTitle = [[UILabel alloc]initWithFrame:CGRectMake((icon.frame.origin.x + icon.frame.size.width + 5) * CEqualSixScale , icon.frame.origin.y * CEqualSixScale , bgView.frame.size.width - (icon.frame.origin.x + 5) * CEqualSixScale * 2 - icon.frame.size.width, icon.frame.size.width)];
        _lblTitle.font = [UIFont systemFontOfSize:12 * CEqualSixScale];
        _lblTitle.textColor = [UIColor colorWithRed:101/255 green:82/255 blue:65/255 alpha:1];
        [bgView addSubview:_lblTitle];
        
        // 收藏
        UIButton *collectionBtn = [VBase UIButtonWithFrame:CGRectMake(_imgView.frame.size.width + 20 * CEqualSixScale, 50 * CEqualSixScale ,40 * CEqualSixScale, 26 * CEqualSixScale) AndBackgroundImageName:nil AndTitle:@"收藏" AndTitleColor:CMAIN_Color AndSuperView:self.contentView];
        collectionBtn.titleLabel.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
        
        // 播放
        UILabel *lblPlay = [VBase UILabelWithFrame:CGRectMake(collectionBtn.frame.size.width + collectionBtn.frame.origin.x + 28 * CEqualSixScale, 50 * CEqualSixScale, 40 * CEqualSixScale, 26 * CEqualSixScale) AndText:@"播放" AndtextColor:CMAIN_Color AndSuperView:self.contentView];
        lblPlay.font = [UIFont systemFontOfSize: 16 *CEqualSixScale];

        // 价格
        _lblPrice = [[UILabel alloc]initWithFrame:CGRectMake(lblPlay.frame.origin.x + lblPlay.frame.size.width , lblPlay.frame.origin.y + 2 *CEqualSixScale, CSCREEN_WIDTH - lblPlay.frame.origin.x - lblPlay.frame.size.width - 5 * CEqualSixScale , lblPlay.frame.size.height)];
        _lblPrice.textAlignment = NSTextAlignmentRight;
        _lblPrice.textColor = [UIColor colorWithRed:255/255.f green:102/255.f blue:52/255.f alpha:1];
        _lblPrice.font = [UIFont systemFontOfSize:16 * CEqualSixScale];
        [self.contentView addSubview:_lblPrice];
        
        UIView *separatorView = [[UIView alloc]initWithFrame:CGRectMake(0, 130 * CEqualSixScale, CSCREEN_WIDTH, 10*CEqualSixScale)];
        separatorView.backgroundColor = [UIColor colorWithRed:243/255.f green:243/255.f blue:243/255.f alpha:1];
        [self.contentView addSubview:separatorView];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
