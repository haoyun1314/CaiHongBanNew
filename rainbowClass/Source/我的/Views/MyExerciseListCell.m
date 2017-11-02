//
//  MyExerciseListCell.m
//  rainbowClass
//
//  Created by WangYu on 26/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "MyExerciseListCell.h"

@interface MyExerciseListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *banner;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *centerBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIImageView *statusImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftBtnLeftConstraint;

@end

@implementation MyExerciseListCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    if (CScreenWidth < 375) {
       _leftBtnLeftConstraint.constant = 8;
    }
    if (CScreenWidth > 375) {
        _leftBtnLeftConstraint.constant = 45;
    }
}

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

- (void)setValueByModel:(MyExerciseListModel *)model
{
    _banner.image = [UIImage imageNamed:@"我的习作-01"];
    _dateLabel.text = @"2015-12-04";
    _timeLabel.text = @"12:00";
    
    switch (_cellType) {
        case submitMyExerciseType:
        {
            _statusImageView.hidden = YES;
            _leftBtn.hidden = NO;
            _centerBtn.hidden = YES;
            _rightBtn.hidden = NO;
            
            [_leftBtn setTitle:@"提交" forState:UIControlStateNormal];
        }
            break;
        case shotMyExerciseType:
        {
            _statusImageView.hidden = YES;
            _leftBtn.hidden = YES;
            _centerBtn.hidden = NO;
            _rightBtn.hidden = YES;
            
            [_centerBtn setTitle:@"拍摄" forState:UIControlStateNormal];
        }
            break;
        case recallMyExerciseType:
        {
            _statusImageView.hidden = NO;
            _leftBtn.hidden = NO;
            _centerBtn.hidden = YES;
            _rightBtn.hidden = NO;
            
            [_leftBtn setTitle:@"撤回" forState:UIControlStateNormal];
        }
            break;
        case shareMyExerciseType:
        {
            _statusImageView.hidden = YES;
            _leftBtn.hidden = YES;
            _centerBtn.hidden = NO;
            _rightBtn.hidden = YES;
            
            [_centerBtn setTitle:@"分享" forState:UIControlStateNormal];
        }
            break;
            
        default:
            break;
    }
}

@end
