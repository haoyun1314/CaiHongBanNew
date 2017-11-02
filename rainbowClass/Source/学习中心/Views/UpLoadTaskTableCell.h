//
//  UpLoadTaskTableCell.h
//  rainbowClass
//
//  Created by cashyoon on 16/3/9.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyExerciseListModel.h"

typedef enum {
    submitMyExerciseType,//只可以提交和分享习作
    shotMyExerciseType,//只可以拍摄习作
    recallMyExerciseType,//只可以撤回和分享习作
    shareMyExerciseType,//只可以分享习作
} MyExerciseListCellType;

@protocol MyExerciseListCellDelegate <NSObject>

- (void)submitMyExerciseByIndex:(NSIndexPath *)indexPath;//提交习作
- (void)shareMyExerciseByIndex:(NSIndexPath *)indexPath;//分享习作
- (void)shotMyExerciseByIndex:(NSIndexPath *)indexPath;//拍摄习作
- (void)recallMyExerciseByIndex:(NSIndexPath *)indexPath;//撤回习作

@end

@interface UpLoadTaskTableCell : UITableViewCell

@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) id<MyExerciseListCellDelegate> delegate;
@property (nonatomic, assign) MyExerciseListCellType cellType;

- (void)setValueByModel:(MyExerciseListModel *)model;

@end
