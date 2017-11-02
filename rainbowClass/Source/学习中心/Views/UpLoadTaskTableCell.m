//
//  UpLoadTaskTableCell.m
//  rainbowClass
//
//  Created by cashyoon on 16/3/9.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "UpLoadTaskTableCell.h"

@interface UpLoadTaskTableCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bannerView;
@property (weak, nonatomic) IBOutlet UIImageView *statusView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btnWidth;

@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondBtn;
@property (weak, nonatomic) IBOutlet UIButton *thirdBtn;

@end

@implementation UpLoadTaskTableCell
- (IBAction)leftBtnAction:(id)sender {
    switch (_cellType) {
        case submitMyExerciseType:
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(submitMyExerciseByIndex:)]) {
                [self.delegate submitMyExerciseByIndex:_indexPath];
            }
        }
            break;
        case recallMyExerciseType:
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(recallMyExerciseByIndex:)]) {
                [self.delegate recallMyExerciseByIndex:_indexPath];
            }
        }
            break;
            
        default:
            break;
    }
}

- (IBAction)centerBtnAction:(id)sender {
    switch (_cellType) {
        case shotMyExerciseType:
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(shotMyExerciseByIndex:)]) {
                [self.delegate shotMyExerciseByIndex:_indexPath];
            }
        }
            break;
        case shareMyExerciseType:
        {
            if (self.delegate && [self.delegate respondsToSelector:@selector(shareMyExerciseByIndex:)]) {
                [self.delegate shareMyExerciseByIndex:_indexPath];
            }
        }
            break;
            
        default:
            break;
    }
}

- (IBAction)rightBtnAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(shareMyExerciseByIndex:)]) {
        [self.delegate shareMyExerciseByIndex:_indexPath];
    }
}

- (void)awakeFromNib {
    // Initialization code
    if (CScreenWidth < 375) {
        _btnWidth.constant = 30;
    }
    
}

- (void)setValueByModel:(MyExerciseListModel *)model
{
    _bannerView.image = [UIImage imageNamed:@"我的习作-01"];
    _bottomView.hidden = NO;
    _dateLabel.text = @"2015-12-04";
    _timeLabel.text = @"12:00";
    
    switch (_cellType) {
        case submitMyExerciseType:
        {
            _statusView.hidden = YES;
            _firstBtn.hidden = NO;
            _secondBtn.hidden = YES;
            _thirdBtn.hidden = NO;
            
            [_firstBtn setTitle:@"提交" forState:UIControlStateNormal];
        }
            break;
        case shotMyExerciseType:
        {
            _bannerView.image = [UIImage imageNamed:@"xizuo_bj"];
            _bottomView.hidden = YES;
            
            _statusView.hidden = YES;
            _firstBtn.hidden = YES;
            _secondBtn.hidden = NO;
            _thirdBtn.hidden = YES;
            
            [_secondBtn setTitle:@"拍摄" forState:UIControlStateNormal];
        }
            break;
        case recallMyExerciseType:
        {
            _statusView.hidden = NO;
            _firstBtn.hidden = NO;
            _secondBtn.hidden = YES;
            _thirdBtn.hidden = NO;
            
            [_firstBtn setTitle:@"撤回" forState:UIControlStateNormal];
        }
            break;
        case shareMyExerciseType:
        {
            _statusView.hidden = YES;
            _firstBtn.hidden = YES;
            _secondBtn.hidden = NO;
            _thirdBtn.hidden = YES;
            
            [_secondBtn setTitle:@"分享" forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
