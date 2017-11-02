//
//  CHBSharedList.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#ifndef CHBSharedList_h
#define CHBSharedList_h

typedef enum
{
    // 没有
    SHARE_LINE_NONE,
    // 头部和底部
    SHARE_LINE_STANDARD,
    // 底部
    SHARE_LINE_LOADMORE_FOOTER,
    // 头部
    SHARE_LINE_REFRESH_HEADER,
    
}ShareLineTableViewType;


@protocol CHBTimelineDelegate <NSObject>

@optional
- (void)sharelineTableViewDidTriggerRefresh:(id)sharelineTableView;
- (void)shareineTableViewDidTriggerLoadMore:(id)sharelineTableView;

@end

#endif /* CHBSharedList_h */
