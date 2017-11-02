//
//  messageCell.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/3/7.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "messageCell.h"

@implementation messageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code  10 + 8 + 107 + 20 + 10
        //自定义单元格
        // 标题
        _lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(10 * CEqualSixScale , 8 * CEqualSixScale , CSCREEN_WIDTH - 100 * CEqualSixScale, 20*CEqualSixScale)];
        _lblTitle.font = [UIFont systemFontOfSize:15 * CEqualSixScale];
        [self.contentView addSubview:_lblTitle];
        
        // 日期
        _lblDate= [[UILabel alloc]initWithFrame:CGRectMake(CSCREEN_WIDTH - 50 * CEqualSixScale, 8 * CEqualSixScale , 40 * CEqualSixScale, 20 * CEqualSixScale)];
        _lblDate.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
        _lblDate.textColor = [Util hexStringToColor:@"969696"];
        [self.contentView addSubview:_lblDate];
        
        // 上传时间
        _lblUploadTime= [[UILabel alloc]initWithFrame:CGRectMake(10 * CEqualSixScale, _lblDate.bottom + 8 * CEqualSixScale , CSCREEN_WIDTH - 20 * CEqualSixScale, 16 * CEqualSixScale)];
        _lblUploadTime.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
        _lblUploadTime.textColor = [Util hexStringToColor:@"969696"];
        [self.contentView addSubview:_lblUploadTime];
        
        // 科目
        _lblSubject= [[UILabel alloc]initWithFrame:CGRectMake(10 * CEqualSixScale, _lblUploadTime.bottom + 8 * CEqualSixScale , CSCREEN_WIDTH - 20 * CEqualSixScale, 16 * CEqualSixScale)];
        _lblSubject.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
        _lblSubject.textColor = [Util hexStringToColor:@"969696"];
        [self.contentView addSubview:_lblSubject];
        
        // 老师
        _lblTeacher= [[UILabel alloc]initWithFrame:CGRectMake(10 * CEqualSixScale, _lblSubject.bottom + 8 * CEqualSixScale , CSCREEN_WIDTH - 20 * CEqualSixScale, 16 * CEqualSixScale)];
        _lblTeacher.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
        _lblTeacher.textColor = [Util hexStringToColor:@"969696"];
        [self.contentView addSubview:_lblTeacher];
        
        // 进入详情
        _lblEnter= [[UILabel alloc]initWithFrame:CGRectMake(CSCREEN_WIDTH - 70 * CEqualSixScale, _lblTeacher.frame.origin.y, 60 * CEqualSixScale, 16 * CEqualSixScale)];
        _lblEnter.font = [UIFont systemFontOfSize:14 * CEqualSixScale];
        _lblEnter.textColor = [Util hexStringToColor:@"77d7fd"];
        [self.contentView addSubview:_lblEnter];
        
        // 下面的灰条
        UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, _lblTeacher.bottom + 10 *CEqualSixScale, CSCREEN_WIDTH, 10 * CEqualSixScale)];
        bgView.backgroundColor = [Util hexStringToColor:@"f3f3f3"];
        [self.contentView addSubview:bgView];
     
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
