//
//  CHBTableView.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHBSharedList.h"

#import "CHBMessageInterceptor.h"
#import "CHBTimelineRefreshView.h"
#import "CHBTimelineLoadMoreView.h"
@interface CHBTableView : UITableView <CHBTimelineRefreshViewDelegate,CHBTimelineLoadMoreViewDelegate>

/**
 * 列表类型
 */
@property (nonatomic,assign) ShareLineTableViewType type;

/**
 * 下拉或更多刷新回调代理
 */
@property (nonatomic,weak) id<CHBTimelineDelegate> shareListDelegate;

/**
 * 是否开启预加载
 */
@property (nonatomic,assign) BOOL bPerLoad;

/**
 * 预加载率,默认为2，表明当滚动到距离下边缘小于2倍的时候开始预加载
 */
@property (nonatomic) CGFloat rate;

- (id) init __attribute__((unavailable("init not available")));
- (id) initWithCoder:(NSCoder *)aDecoder __attribute__((unavailable("initWithCoder not available")));

/*
 * 设置更多是否可用
 */
-(void) setEnableLoadMore:(BOOL) enable;

/*
 * 获取更多是否可用
 */
-(BOOL) getEnableLoadMore;

/*
 * 下拉刷新完成
 */
-(void) stopRefreshView;

/*
 * 更多请求完成
 */
-(void) stopLoadMoreView;
/*
 * 刷新界面
 */
-(void) reloadData;

@end
