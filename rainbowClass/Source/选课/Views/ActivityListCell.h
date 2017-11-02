//
//  ActivityListCell.h
//  rainbowClass
//
//  Created by WangYu on 2/3/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *bannerImage;
@property (weak, nonatomic) IBOutlet UIImageView *backgroudImage;
@property (weak, nonatomic) IBOutlet UILabel *activityName;

@end
