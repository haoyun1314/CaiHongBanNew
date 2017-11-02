//
//  MeCourseTableViewCell.m
//  rainbowClass
//
//  Created by cashyoon on 16/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MeCourseTableViewCell.h"

@implementation MeCourseTableViewCell





- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
//        self.backgroundColor = [UIColor purpleColor];
        [self reloadCourseCellUI];
    }
    return self;
}

-(void)reloadCourseCellUI
{

//    @property (nonatomic,strong) UILabel * courseNameLabel;
//    @property (nonatomic,strong) UILabel * livingLabel;
//    @property (nonatomic,strong) UILabel * teacherNameLabel;
    
    
    self.LineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,20*CEqualSixScale,96*CEqualSixScale)];
    _LineImageView.image  = [UIImage imageNamed:@"kedu.png"];
    [self.contentView addSubview:_LineImageView];
    
    self.VideoImageView  = [[UIImageView alloc]initWithFrame:CGRectMake(75*CEqualSixScale, 14*CEqualSixScale,101*CEqualSixScale,76*CEqualSixScale)];
    _VideoImageView.image  = [UIImage imageNamed:@"mecourse.png"];
    [self.contentView addSubview:_VideoImageView];
    
    
    self.courseNameLabel = [VBase UILabelWithFrame:CGRectMake(self.VideoImageView.right +7*CEqualSixScale,20*CEqualSixScale,100*CEqualSixScale, 20*CEqualSixScale) AndText:@"钢琴入门第三课" AndtextColor:[Util hexStringToColor:@"000000"] AndSuperView:self.contentView];
    self.courseNameLabel.font = [UIFont systemFontOfSize:14*CEqualSixScale];
    
    
    
    self.livingLabel = [VBase UILabelWithFrame:CGRectMake(self.VideoImageView.right +7*CEqualSixScale,self.courseNameLabel.bottom,100*CEqualSixScale, 20*CEqualSixScale) AndText:@"还有一天上课" AndtextColor:[Util hexStringToColor:@"000000"] AndSuperView:self.contentView];
    self.livingLabel.font = [UIFont systemFontOfSize:12*CEqualSixScale];

    
    self.teacherNameLabel = [VBase UILabelWithFrame:CGRectMake(self.VideoImageView.right +7*CEqualSixScale,self.livingLabel.bottom,100*CEqualSixScale, 20*CEqualSixScale) AndText:@"老师：周杰伦" AndtextColor:[Util hexStringToColor:@"717783"] AndSuperView:self.contentView];
    self.teacherNameLabel.font = [UIFont systemFontOfSize:12*CEqualSixScale];

}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
