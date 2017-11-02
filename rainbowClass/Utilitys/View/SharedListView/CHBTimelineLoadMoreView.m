//
//  CHBTimelineLoadMoreView.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBTimelineLoadMoreView.h"
#import <QuartzCore/QuartzCore.h>
static const NSTimeInterval ANIMATION_DURATION = 0.2;
@interface CHBTimelineLoadMoreView ()
{
    CHBTimelineFooterViewState _state;
}

@end;

@implementation CHBTimelineLoadMoreView

+(CHBTimelineLoadMoreView *)createInstanseWinthFrame:(CGRect) frame
{
    CHBTimelineLoadMoreView *timeLineMore = [[CHBTimelineLoadMoreView alloc] initWithFrame:frame];
    timeLineMore.progressIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(151*BASE_RATE, 13*BASE_RATE, 20*BASE_RATE, 20*BASE_RATE)];
    timeLineMore.progressIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [timeLineMore addSubview:timeLineMore.progressIndicator];
    [timeLineMore setState:CHBTimelineFooterViewStateNormal];
    return timeLineMore;
}

- (void)setState:(CHBTimelineFooterViewState)state
{
    _state = state;
}

- (void)startLoadingMore:(UIScrollView *)scrollView completion:(void(^)(BOOL finished))completion
{
    [self.progressIndicator startAnimating];
    
    [UIView animateWithDuration:ANIMATION_DURATION
                     animations:^{
                         UIEdgeInsets currentInsets = scrollView.contentInset;
                         currentInsets.bottom = self.frame.size.height + MAX(0, scrollView.frame.size.height - scrollView.contentSize.height);
                         scrollView.contentInset = currentInsets;
                     } completion:^(BOOL finished) {
                         if (completion != nil) {
                             completion(finished);
                         }
                     }];
    
    [self setState:CHBTimelineFooterViewStateLoadingMore];
}

- (void)startLoadingMore:(UIScrollView *)scrollView {
    [self startLoadingMore:scrollView completion:nil];
}

- (void)stopLoadingMore:(UIScrollView *)scrollView
{
    [self.progressIndicator stopAnimating];
    
    [UIView animateWithDuration:ANIMATION_DURATION
                     animations:^{
                         UIEdgeInsets currentInsets = scrollView.contentInset;
                         currentInsets.bottom = 0;
                         scrollView.contentInset = currentInsets;
                     }];
    
    [self setState:CHBTimelineFooterViewStateNormal];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
{
    if (_state == CHBTimelineFooterViewStateNormal) {
        
    } else if (_state == CHBTimelineFooterViewStatePulling) {
        if ([_delegate didSupportLoadMore:self]) {
            [self startLoadingMore:scrollView completion:^(BOOL finished) {
                [_delegate didTriggerLoadMore:self];
            }];
        }
    } else if (_state == CHBTimelineFooterViewStateLoadingMore) {
        /*if ([_delegate didSupportLoadMore:self]) {
         [self startLoadingMore:scrollView completion:^(BOOL finished) {
         [_delegate didTriggerLoadMore:self];
         }];
         }*/
    }
}

- (CGFloat)scrollViewOffsetFromBottom:(UIScrollView *)scrollView
{
    return MAX(0, scrollView.contentSize.height - scrollView.frame.size.height) - scrollView.contentOffset.y;
}

- (NSInteger)scrollOffsetY:(UIScrollView *)scrollView
{
    /*if (_isFooter) {
     return [self scrollViewOffsetFromBottom:scrollView];
     }
     return scrollView.contentOffset.y;*/
    return [self scrollViewOffsetFromBottom:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_state == CHBTimelineFooterViewStateNormal) {
        if (scrollView.isDragging && [self scrollOffsetY:scrollView] < - self.frame.size.height) {
            [self setState:CHBTimelineFooterViewStatePulling];
        }
    } else if (_state == CHBTimelineFooterViewStatePulling) {
        if (scrollView.isDragging && [self scrollOffsetY:scrollView] > - self.frame.size.height) {
            [self setState:CHBTimelineFooterViewStateNormal];
        }
        
    } else if (_state == CHBTimelineFooterViewStateLoadingMore) {
        
    }
}

- (void)scrollViewDataSourceDidStartLoadingMore:(UIScrollView *)scrollView
{
    if (_state == CHBTimelineFooterViewStateNormal ||
        _state == CHBTimelineFooterViewStatePulling) {
        [self startLoadingMore:scrollView];
    }
}

- (void)scrollViewDataSourceDidFinishLoadingMore:(UIScrollView *)scrollView
{
    if (_state == CHBTimelineFooterViewStateLoadingMore) {
        double delayInSeconds = 0.5;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self stopLoadingMore:scrollView];
        });
        
    }
}


@end
