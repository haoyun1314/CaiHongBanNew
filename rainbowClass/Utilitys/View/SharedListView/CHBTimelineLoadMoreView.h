//
//  CHBTimelineLoadMoreView.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    CHBTimelineFooterViewStateNormal,
    CHBTimelineFooterViewStatePulling,
    CHBTimelineFooterViewStateLoadingMore
} CHBTimelineFooterViewState;

@protocol CHBTimelineLoadMoreViewDelegate;

@interface CHBTimelineLoadMoreView : UIView
@property (nonatomic, strong) UIActivityIndicatorView *progressIndicator;

@property (nonatomic, weak) id <CHBTimelineLoadMoreViewDelegate> delegate;
@property (nonatomic, assign) BOOL isFooter;


+(CHBTimelineLoadMoreView *)createInstanseWinthFrame:(CGRect) frame;

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

- (void)scrollViewDataSourceDidStartLoadingMore:(UIScrollView *)scrollView;
- (void)scrollViewDataSourceDidFinishLoadingMore:(UIScrollView *)scrollView;

- (void)setState:(CHBTimelineFooterViewState)state;

@end

@protocol CHBTimelineLoadMoreViewDelegate <NSObject>

- (void)didTriggerLoadMore:(CHBTimelineLoadMoreView *)loadMoreView;
- (BOOL)didSupportLoadMore:(CHBTimelineLoadMoreView *)loadMoreView;

@end
