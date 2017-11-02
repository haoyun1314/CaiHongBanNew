//
//  MyCourceDetailListCell.m
//  rainbowClass
//
//  Created by WangYu on 25/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MyCourceDetailListCell.h"

@interface MyCourceDetailListCell ()

@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UILabel *sectionTitle;

@property (weak, nonatomic) IBOutlet UILabel *orderLabel;
@property (weak, nonatomic) IBOutlet UIImageView *courceBanner;
@property (weak, nonatomic) IBOutlet UIImageView *liveStatus;
@property (weak, nonatomic) IBOutlet UIImageView *toLiveStatus;
@property (weak, nonatomic) IBOutlet UILabel *courceName;
@property (weak, nonatomic) IBOutlet UILabel *courceTime;
@property (weak, nonatomic) IBOutlet UILabel *teacherName;

@property (weak, nonatomic) IBOutlet UIButton *liveBtn;
@property (weak, nonatomic) IBOutlet UIButton *playbackBtn;
@property (weak, nonatomic) IBOutlet UIButton *uploadBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentPlaybackBtn;
@property (weak, nonatomic) IBOutlet UIButton *seeCommentBtn;


@end

@implementation MyCourceDetailListCell

#pragma mark - 点击事件
- (IBAction)uploadAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(uploadMyCourceByIndexPath:)]) {
        [self. delegate uploadMyCourceByIndexPath:_indexPath];
    }
}
- (IBAction)shareAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(shareMyCourceByIndexPath:)]) {
        [self. delegate shareMyCourceByIndexPath:_indexPath];
    }
}

- (IBAction)seeCommentAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(commentMyCourceByIndexPath:)]) {
        [self. delegate commentMyCourceByIndexPath:_indexPath];
    }
}

#pragma mark - 界面渲染
- (void)setValueByModel:(MyCourceDetailListModel *)model
{
    NSInteger _order = 10 - _indexPath.row - _indexPath.section;
    if (_order > 10) {
        _orderLabel.text = [NSString stringWithFormat:@"%ld", _order];
    } else {
        _orderLabel.text = [NSString stringWithFormat:@"0%ld", _order];
    }
    
    
    _courceBanner.image = [UIImage imageNamed:@"课程详情-3"];
    _courceName.text = @"钢琴入门第十课";
    _teacherName.text = @"老师：朗朗";
    if (_indexPath.row == 0) {
        _lineView.hidden = NO;
        _sectionTitle.hidden = NO;
        if (_type == CourceListCellLive) {
            _sectionTitle.text = @"上课啦";
        } else {
            _sectionTitle.text = @"还有1天";
        }
    } else {
        _lineView.hidden = YES;
        _sectionTitle.hidden = YES;
    }
    switch (_type) {
        case CourceListCellLive:
        {
            _liveStatus.hidden = NO;
            _toLiveStatus.hidden = YES;
            _courceTime.text = @"正在直播";
            
            _liveBtn.hidden = NO;
            _playbackBtn.hidden = YES;
            _uploadBtn.hidden = YES;
            _shareBtn.hidden = YES;
            _commentPlaybackBtn.hidden = YES;
            _seeCommentBtn.hidden = YES;
        }
            break;
        case CourceListCellToLive:
        {
            _liveStatus.hidden = YES;
            _toLiveStatus.hidden = NO;
            _courceTime.text = @"还有1天上课";
            
            _liveBtn.hidden = YES;
            _playbackBtn.hidden = YES;
            _uploadBtn.hidden = YES;
            _shareBtn.hidden = YES;
            _commentPlaybackBtn.hidden = YES;
            _seeCommentBtn.hidden = YES;
        }
            break;
        case CourceListCellHistory:
        {
            _liveStatus.hidden = YES;
            _toLiveStatus.hidden = YES;
            _courceTime.text = @"还有1天上课";
            
            _liveBtn.hidden = YES;
            _playbackBtn.hidden = YES;
            _uploadBtn.hidden = YES;
            _shareBtn.hidden = YES;
            _commentPlaybackBtn.hidden = YES;
            _seeCommentBtn.hidden = YES;
        }
            break;
        case CourceListCellUpload:
        {
            _liveStatus.hidden = YES;
            _toLiveStatus.hidden = YES;
            _courceTime.text = @"";
            
            _liveBtn.hidden = YES;
            _playbackBtn.hidden = NO;
            _uploadBtn.hidden = NO;
            _shareBtn.hidden = YES;
            _commentPlaybackBtn.hidden = YES;
            _seeCommentBtn.hidden = YES;
        }
            break;
        case CourceListCellComment:
        {
            _liveStatus.hidden = YES;
            _toLiveStatus.hidden = YES;
            _courceTime.text = @"";
            
            _liveBtn.hidden = YES;
            _playbackBtn.hidden = YES;
            _uploadBtn.hidden = YES;
            _shareBtn.hidden = NO;
            _commentPlaybackBtn.hidden = NO;
            _seeCommentBtn.hidden = NO;
        }
            break;
            
        default:
            break;
    }
}

@end
