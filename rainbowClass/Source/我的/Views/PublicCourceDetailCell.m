//
//  PublicCourceDetailCell.m
//  rainbowClass
//
//  Created by cashyoon on 16/3/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "PublicCourceDetailCell.h"

@interface PublicCourceDetailCell ()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bannerImageView;
@property (weak, nonatomic) IBOutlet UIImageView *liveStatus;
@property (weak, nonatomic) IBOutlet UIImageView *toLiveStatus;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *teacherLabel;
@property (weak, nonatomic) IBOutlet UIImageView *starView;

@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondBtn;
@property (weak, nonatomic) IBOutlet UIButton *uploadBtn;
@property (weak, nonatomic) IBOutlet UIButton *playbackBtn;

@end

@implementation PublicCourceDetailCell

#pragma mark - 点击事件

//第一个按钮响应响应 上传 或者 点评 事件
- (IBAction)firstBtnAction:(id)sender {
    switch (_type) {
        case CourceListCellUpload:
        {
            [self uploadAction:sender];
        }
            break;
        case CourceListCellComment:
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(commentMyCourceByIndexPath:)]) {
                [self.delegate commentMyCourceByIndexPath:_indexPath];
            }
        }
            break;
        default:
            break;
    }
}

//第二个按钮只响应分享事件
- (IBAction)secondBtnAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(shareMyCourceByIndexPath:)]) {
        [self.delegate shareMyCourceByIndexPath:_indexPath];
    }
}

//第三个按钮一直未为上传按钮
- (IBAction)uploadAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(uploadMyCourceByIndexPath:)]) {
        [self.delegate uploadMyCourceByIndexPath:_indexPath];
    }
    
}

#pragma mark - 界面渲染
- (void)setValueByModel:(MyCourceDetailListModel *)model
{
    _nameLabel.text = @"钢琴入门第十课";
    _teacherLabel.text = @"老师：朗朗";
    _firstBtn.enabled = YES;
    _secondBtn.enabled = YES;
    switch (_type) {
        case CourceListCellLive:
        {
            _timeLabel.text = @"上课了";
            _liveStatus.hidden = NO;
            _toLiveStatus.hidden = YES;
            
            _firstBtn.hidden = NO;
            _firstBtn.enabled = NO;
            [_firstBtn setTitle:@"上课" forState:UIControlStateNormal];
            
            _secondBtn.hidden = YES;
            _playbackBtn.hidden = YES;
            _uploadBtn.hidden = YES;
            
            _starView.image = nil;
        }
            break;
        case CourceListCellToLive:
        {
            _timeLabel.text = @"还有1天";
            _liveStatus.hidden = YES;
            _toLiveStatus.hidden = NO;
            
            _firstBtn.hidden = YES;
            _secondBtn.hidden = YES;
            _playbackBtn.hidden = YES;
            _uploadBtn.hidden = YES;
            
            _starView.image = nil;
        }
            break;
        case CourceListCellUpload:
        {
            _timeLabel.text = @"3月5号";
            _liveStatus.hidden = YES;
            _toLiveStatus.hidden = YES;
            
            _firstBtn.hidden = NO;
            [_firstBtn setTitle:@"上传" forState:UIControlStateNormal];
            
            _secondBtn.hidden = NO;
            _secondBtn.enabled = NO;
            [_secondBtn setTitle:@"回看" forState:UIControlStateNormal];
            
            _playbackBtn.hidden = YES;
            _uploadBtn.hidden = YES;
            
            _starView.image = [UIImage imageNamed:@"kecheng_star3.png"];
        }
            break;
        case CourceListCellComment:
        {
            _timeLabel.text = @"3月2号";
            _liveStatus.hidden = YES;
            _toLiveStatus.hidden = YES;
            
            _firstBtn.hidden = NO;
            [_firstBtn setTitle:@"点评" forState:UIControlStateNormal];
            
            _secondBtn.hidden = NO;
            [_secondBtn setTitle:@"分享" forState:UIControlStateNormal];
            
            _playbackBtn.hidden = NO;
            _uploadBtn.hidden = NO;
            
            _starView.image = [UIImage imageNamed:@"kecheng_star5.png"];
        }
            break;
            
        default:
            break;
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
