//
//  MeCourseDetailFirstTableViewCell.m
//  rainbowClass
//
//  Created by cashyoon on 16/2/17.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MeCourseDetailFirstTableViewCell.h"

@implementation MeCourseDetailFirstTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        [self reloadMecourseCellUI];
        
  
    }
    return self;
}




-(void)reloadMecourseCellUI
{

    
    
    
    
    
    
    self.firstCellLine = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,20*CEqualSixScale,96*CEqualSixScale)];
    _firstCellLine.image  = [UIImage imageNamed:@"kedu.png"];
    [self.contentView addSubview:_firstCellLine];

    
    self.redLine = [VBase UILabelWithFrame:CGRectMake(0,48*CEqualSixScale,15*CEqualSixScale, 1) AndText:nil AndtextColor:nil AndSuperView:self.contentView];
    self.redLine.backgroundColor = [Util hexStringToColor:@"e56b30"];
    self.redLine.hidden = YES;
    
    self.redSingContent = [VBase UILabelWithFrame:CGRectMake(self.redLine.right,38*CEqualSixScale,56*CEqualSixScale, 20*CEqualSixScale) AndText:@"还有一天" AndtextColor:[Util hexStringToColor:@"e56b30"] AndSuperView:self.contentView];
    self.redSingContent.hidden = YES;
    self.redSingContent.font = [UIFont systemFontOfSize:14*CEqualSixScale];
    
    
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


-(void)setIndexPath:(NSIndexPath *)indexPath
{


    
    if (_indexPath != indexPath) {
        _indexPath  = indexPath;
    }
    if (indexPath.section == 0 && indexPath.row == 0  ) {
        _firstCellLine.frame = CGRectMake(0, 0,20*CEqualSixScale,111*CEqualSixScale);
        self.redLine.hidden =NO;
        self.redSingContent.hidden = NO;
        self.redSingContent.text = @"上课啦";
        
        _VideoImageView.frame = CGRectMake(75*CEqualSixScale, 29*CEqualSixScale,101*CEqualSixScale,76*CEqualSixScale);
        _courseNameLabel.frame = CGRectMake(self.VideoImageView.right +7*CEqualSixScale,35*CEqualSixScale,100*CEqualSixScale, 20*CEqualSixScale);
        self.livingLabel.frame = CGRectMake(self.VideoImageView.right +7*CEqualSixScale,self.courseNameLabel.bottom,100*CEqualSixScale, 20*CEqualSixScale);
        self.teacherNameLabel.frame = CGRectMake(self.VideoImageView.right +7*CEqualSixScale,self.livingLabel.bottom,100*CEqualSixScale, 20*CEqualSixScale);
        

    }
    
   else  if (indexPath.section == 1 && indexPath.row == 0) {
        
        _firstCellLine.frame = CGRectMake(0, 0,20*CEqualSixScale,111*CEqualSixScale);
        self.redLine.hidden =NO;
        self.redSingContent.hidden = NO;
        self.redSingContent.text = @"还有一天";
        _VideoImageView.frame = CGRectMake(75*CEqualSixScale, 29*CEqualSixScale,101*CEqualSixScale,76*CEqualSixScale);
        _courseNameLabel.frame = CGRectMake(self.VideoImageView.right +7*CEqualSixScale,35*CEqualSixScale,100*CEqualSixScale, 20*CEqualSixScale);
        self.livingLabel.frame = CGRectMake(self.VideoImageView.right +7*CEqualSixScale,self.courseNameLabel.bottom,100*CEqualSixScale, 20*CEqualSixScale);
        self.teacherNameLabel.frame = CGRectMake(self.VideoImageView.right +7*CEqualSixScale,self.livingLabel.bottom,100*CEqualSixScale, 20*CEqualSixScale);


    }
    else
    {
    
    
    
        _firstCellLine.frame = CGRectMake(0, 0,20*CEqualSixScale,96*CEqualSixScale);
        self.redLine.hidden =YES;
        self.redSingContent.hidden = YES;
        _VideoImageView.frame = CGRectMake(75*CEqualSixScale, 14*CEqualSixScale,101*CEqualSixScale,76*CEqualSixScale);
        _courseNameLabel.frame = CGRectMake(self.VideoImageView.right +7*CEqualSixScale,20*CEqualSixScale,100*CEqualSixScale, 20*CEqualSixScale);
        self.livingLabel.frame = CGRectMake(self.VideoImageView.right +7*CEqualSixScale,self.courseNameLabel.bottom,100*CEqualSixScale, 20*CEqualSixScale);
        self.teacherNameLabel.frame = CGRectMake(self.VideoImageView.right +7*CEqualSixScale,self.livingLabel.bottom,100*CEqualSixScale, 20*CEqualSixScale);

    
    
    }

    
    
    
    
    
    
}










- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
