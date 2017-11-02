//
//  PublicCourceDetailCell.h
//  rainbowClass
//
//  Created by cashyoon on 16/3/15.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCourceDetailListModel.h"

typedef enum {
    CourceListCellLive,//直播
    CourceListCellToLive,//即将直播
    CourceListCellUpload,//历史视频,未上传习作
    CourceListCellComment,//历史视频,老师已经点评过习作
}CourceListCellType;

@protocol PublicCourceDetailCellDelegate <NSObject>

- (void)uploadMyCourceByIndexPath:(NSIndexPath *)indexPath;//上传习作
- (void)commentMyCourceByIndexPath:(NSIndexPath *)indexPath;//观看点评
- (void)shareMyCourceByIndexPath:(NSIndexPath *)indexPath;//分享

@end
@interface PublicCourceDetailCell : UITableViewCell

@property (nonatomic, assign) CourceListCellType type;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) id<PublicCourceDetailCellDelegate> delegate;

- (void)setValueByModel:(MyCourceDetailListModel *)model;
@end
