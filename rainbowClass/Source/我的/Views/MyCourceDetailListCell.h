//
//  MyCourceDetailListCell.h
//  rainbowClass
//
//  Created by WangYu on 25/2/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCourceDetailListModel.h"

typedef enum {
    CourceListCellLive,//直播
    CourceListCellToLive,//即将直播
    CourceListCellHistory,//历史视频
    CourceListCellUpload,//未上传习作
    CourceListCellComment,//老师已经点评过习作
}CourceListCellType;

@protocol MyCourceDetailListDelegate <NSObject>

- (void)uploadMyCourceByIndexPath:(NSIndexPath *)indexPath;//上传习作
- (void)commentMyCourceByIndexPath:(NSIndexPath *)indexPath;//观看点评
- (void)shareMyCourceByIndexPath:(NSIndexPath *)indexPath;//分享

@end

@interface MyCourceDetailListCell : UITableViewCell

@property (nonatomic, assign) CourceListCellType type;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) id<MyCourceDetailListDelegate> delegate;

- (void)setValueByModel:(MyCourceDetailListModel *)model;

@end
