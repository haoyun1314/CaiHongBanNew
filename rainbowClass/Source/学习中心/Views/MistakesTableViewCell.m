//
//  MistakesTableViewCell.m
//  rainbowClass
//
//  Created by cashyoon on 16/2/19.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MistakesTableViewCell.h"

@implementation MistakesTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
//        self.backgroundColor = [UIColor greenColor];
        [self reloadMusicTableViewCell];

    }
    return self;
}



-(void)reloadMusicTableViewCell
{
    
    

    self.kindsLabel = [VBase UILabelWithFrame:CGRectMake(30*CEqualSixScale,19*CEqualSixScale,40*CEqualSixScale, 20*CEqualSixScale) AndText:@"节奏" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:self.contentView];
    self.kindsLabel.font = [UIFont systemFontOfSize:16*CEqualSixScale];
    
    self.frequencyLabel = [VBase UILabelWithFrame:CGRectMake(self.kindsLabel.right + 40*CEqualSixScale,19*CEqualSixScale,60*CEqualSixScale, 20*CEqualSixScale) AndText:@"20次" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:self.contentView];
    //
    self.mistakeLevel = [VBase UILabelWithFrame:CGRectMake(self.frequencyLabel.right+40*CEqualSixScale,19*CEqualSixScale, 60*CEqualSixScale, 15*CEqualSixScale) AndText:@"上升" AndtextColor:[Util hexStringToColor:@"655241"] AndSuperView:self.contentView];
    self.mistakeLevel.font = [UIFont systemFontOfSize:16*CEqualSixScale];
    //
    self.relatedTeaching = [VBase UILabelWithFrame:CGRectMake(self.mistakeLevel.right+40*CEqualSixScale,19*CEqualSixScale,60*CEqualSixScale, 20*CEqualSixScale) AndText:@"提升" AndtextColor:[Util hexStringToColor:@"fe6636"] AndSuperView:self.contentView];
    self.relatedTeaching.font = [UIFont systemFontOfSize:16*CEqualSixScale];
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
