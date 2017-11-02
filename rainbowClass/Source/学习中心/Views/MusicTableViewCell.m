//
//  MusicTableViewCell.m
//  rainbowClass
//
//  Created by cashyoon on 16/2/19.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MusicTableViewCell.h"

@implementation MusicTableViewCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        [self reloadMusicTableViewCell];
    }
    return self;
}




-(void)reloadMusicTableViewCell
{
    
    
//    @property (nonatomic,strong) UILabel * ruleName;
//    @property (nonatomic,strong) UILabel * ruleLevel;
//    @property (nonatomic,strong) UILabel * levelDevelopLabel;
//    @property (nonatomic,strong) UILabel * increaseLevelLabel;
    

    
//    self.VideoImageView  = [[UIImageView alloc]initWithFrame:CGRectMake(75*CEqualSixScale, 14*CEqualSixScale,101*CEqualSixScale,76*CEqualSixScale)];
//    _VideoImageView.image  = [UIImage imageNamed:@"mecourse.png"];
//    [self.contentView addSubview:_VideoImageView];
//    
//    
    self.ruleName = [VBase UILabelWithFrame:CGRectMake(30*CEqualSixScale,19*CEqualSixScale,40*CEqualSixScale, 20*CEqualSixScale) AndText:@"节奏" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:self.contentView];
    self.ruleName.font = [UIFont systemFontOfSize:16*CEqualSixScale];
    
    self.ruleLevel = [VBase UILabelWithFrame:CGRectMake(self.ruleName.right + 10,19*CEqualSixScale,200*CEqualSixScale, 20*CEqualSixScale) AndText:nil AndtextColor:nil AndSuperView:self.contentView];
    self.ruleLevel.backgroundColor = [Util hexStringToColor:@"86defd"];
//
    self.levelDevelopLabel = [VBase UILabelWithFrame:CGRectMake(self.ruleLevel.right - 40*CEqualSixScale,0, 40*CEqualSixScale, 15*CEqualSixScale) AndText:@"上升" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:self.contentView];
    self.levelDevelopLabel.font = [UIFont systemFontOfSize:12*CEqualSixScale];
//
    self.increaseLevelLabel = [VBase UILabelWithFrame:CGRectMake(self.ruleLevel.right+30*CEqualSixScale,19*CEqualSixScale,40*CEqualSixScale, 20*CEqualSixScale) AndText:@"提升" AndtextColor:[Util hexStringToColor:@"fe6636"] AndSuperView:self.contentView];
    self.increaseLevelLabel.font = [UIFont systemFontOfSize:16*CEqualSixScale];
    
    
   
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
