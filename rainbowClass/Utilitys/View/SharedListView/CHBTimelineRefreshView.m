//
//  CHBTimelineRefreshView.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBTimelineRefreshView.h"
typedef enum {
    CHBTimelineHeaderViewStateNormal,
    CHBTimelineHeaderViewStatePulling,
    CHBTimelineHeaderViewStateRefreshing
} CHBTimelineHeaderViewState;

static const NSTimeInterval ANIMATION_DURATION = 0.2;

@interface CHBTimelineRefreshView ()
{
    CHBTimelineHeaderViewState _state;
}
@end;

@implementation CHBTimelineRefreshView

+(CHBTimelineRefreshView *)createInstanseWinthFrame:(CGRect) frame
{
    CGFloat xOffset = 30*BASE_RATE;
    CHBTimelineRefreshView *timeLineRefreshView = [[CHBTimelineRefreshView alloc] initWithFrame:frame];
    timeLineRefreshView.arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(70*BASE_RATE + xOffset, 15*BASE_RATE, 12*BASE_RATE, 18*BASE_RATE)];
    timeLineRefreshView.arrowView.image = [UIImage imageNamed:@"arrow"];
    [timeLineRefreshView addSubview:timeLineRefreshView.arrowView];
    
    timeLineRefreshView.lastUpdatedLabel = [[UILabel alloc] initWithFrame:CGRectMake(90*BASE_RATE + xOffset, 28*BASE_RATE, 140*BASE_RATE, 14*BASE_RATE)];
    timeLineRefreshView.lastUpdatedLabel.text = @"最后更新";
    timeLineRefreshView.lastUpdatedLabel.font = [UIFont systemFontOfSize:11*BASE_RATE];
    timeLineRefreshView.lastUpdatedLabel.backgroundColor = [UIColor clearColor];
    timeLineRefreshView.lastUpdatedLabel.textColor = [UIColor colorWithRed:131.0/255 green:131.0/255 blue:131.0/255 alpha:1.0];
    [timeLineRefreshView addSubview:timeLineRefreshView.lastUpdatedLabel];
    
    timeLineRefreshView.statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(90*BASE_RATE + xOffset, 12*BASE_RATE, 140*BASE_RATE, 14*BASE_RATE)];
    timeLineRefreshView.statusLabel.text = @"松开即可刷新...";
    timeLineRefreshView.statusLabel.font = [UIFont systemFontOfSize:11*BASE_RATE];
    timeLineRefreshView.statusLabel.backgroundColor = [UIColor clearColor];
    timeLineRefreshView.statusLabel.textColor = [UIColor colorWithRed:131.0/255 green:131.0/255 blue:131.0/255 alpha:1.0];
    [timeLineRefreshView addSubview:timeLineRefreshView.statusLabel];
    
    timeLineRefreshView.progressIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(67*BASE_RATE + xOffset, 17*BASE_RATE, 20*BASE_RATE, 20*BASE_RATE)];
    timeLineRefreshView.progressIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [timeLineRefreshView addSubview:timeLineRefreshView.progressIndicator];
    
    [timeLineRefreshView setState:CHBTimelineHeaderViewStateNormal];
    return timeLineRefreshView;
}

static const NSTimeInterval aMinute = 60;
static const NSTimeInterval anHour  = 3660;
static const NSTimeInterval aDay    = 86400;

- (void)refreshLastUpdatedDate {
    NSDate * date = [_delegate refreshViewDataSourceLastUpdated:self];
    
    if (date) {
        NSTimeInterval timeSinceLastUpdate = [date timeIntervalSinceNow];
        NSInteger timeToDisplay = 0;
        timeSinceLastUpdate *= -1;
        
        if(timeSinceLastUpdate < anHour) {
            timeToDisplay = (NSInteger) (timeSinceLastUpdate / aMinute);
            
            if (timeToDisplay <= 3) {
                _lastUpdatedLabel.text = @"上次更新：刚刚";
            } else {
                /* Plural */
                _lastUpdatedLabel.text = [NSString stringWithFormat:@"上次更新：%ld分钟前", (long)timeToDisplay];
            }
            
        } else if (timeSinceLastUpdate < aDay) {
            timeToDisplay = (NSInteger) (timeSinceLastUpdate / anHour);
            
            if(timeToDisplay == /* Singular*/ 1) {
                _lastUpdatedLabel.text = [NSString stringWithFormat:@"上次更新：%ld小时前", (long)timeToDisplay];
            } else {
                /* Plural */
                _lastUpdatedLabel.text = [NSString stringWithFormat:@"上次更新：%ld小时前", (long)timeToDisplay];
            }
            
        } else {
            timeToDisplay = (NSInteger) (timeSinceLastUpdate / aDay);
            if(timeToDisplay == /* Singular*/ 1) {
                _lastUpdatedLabel.text = [NSString stringWithFormat:@"上次更新：%ld天前", (long)timeToDisplay];
            } else {
                /* Plural */
                _lastUpdatedLabel.text = [NSString stringWithFormat:@"上次更新：%ld天前", (long)timeToDisplay];
            }
        }
        
    } else {
        _lastUpdatedLabel.text = nil;
    }
}

- (void)setState:(CHBTimelineHeaderViewState)state
{
    if (state == CHBTimelineHeaderViewStateNormal) {
        self.progressIndicator.hidden = YES;
        _arrowView.hidden = NO;
        _statusLabel.text = @"下拉可以刷新...";
        
    } else if (state == CHBTimelineHeaderViewStatePulling) {
        self.progressIndicator.hidden = YES;
        _arrowView.hidden = NO;
        _statusLabel.text = @"松开即可刷新...";
        
    } else if (state == CHBTimelineHeaderViewStateRefreshing) {
        self.progressIndicator.hidden = NO;
        _arrowView.hidden = YES;
        
        _statusLabel.text = @"正在刷新...";
        
    }
    
    _state = state;
}

- (void)startRefreshing:(UIScrollView *)scrollView
{
    self.arrowView.hidden = YES;
    self.progressIndicator.hidden = NO;
    [self.progressIndicator startAnimating];
    
    [UIView animateWithDuration:ANIMATION_DURATION
                     animations:^{
                         UIEdgeInsets currentInsets = scrollView.contentInset;
                         currentInsets.top += self.frame.size.height;
                         scrollView.contentInset = currentInsets;
                     }];
    
    
    [self setState:CHBTimelineHeaderViewStateRefreshing];
}

- (void)stopRefreshing:(UIScrollView *)scrollView
{
    _arrowView.transform = CGAffineTransformMakeRotation(0);
    
    self.arrowView.hidden = NO;
    
    [self.progressIndicator stopAnimating];
    self.progressIndicator.hidden = YES;
    
    
    [UIView animateWithDuration:ANIMATION_DURATION
                     animations:^{
                         UIEdgeInsets currentInsets = scrollView.contentInset;
                         currentInsets.top -= self.frame.size.height;
                         scrollView.contentInset = currentInsets;
                     }];
    
    [self setState:CHBTimelineHeaderViewStateNormal];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self refreshLastUpdatedDate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
{
    if (_state == CHBTimelineHeaderViewStateNormal) {
        
    } else if (_state == CHBTimelineHeaderViewStatePulling) {
        [self startRefreshing:scrollView];
        [self.delegate didTriggerRefresh:self];
        
    } else if (_state == CHBTimelineHeaderViewStateRefreshing) {
        
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_state == CHBTimelineHeaderViewStateNormal) {
        _arrowView.hidden = NO;
        if (scrollView.isDragging && scrollView.contentOffset.y + scrollView.contentInset.top < - self.frame.size.height) {
            [UIView animateWithDuration:ANIMATION_DURATION
                             animations:^{ _arrowView.transform = CGAffineTransformMakeRotation(M_PI); }];
            
            [self setState:CHBTimelineHeaderViewStatePulling];
        }
        
    } else if (_state == CHBTimelineHeaderViewStatePulling) {
        _arrowView.hidden = NO;
        if (scrollView.isDragging && scrollView.contentOffset.y + scrollView.contentInset.top > - self.frame.size.height) {
            [UIView animateWithDuration:ANIMATION_DURATION
                             animations:^{ _arrowView.transform = CGAffineTransformMakeRotation(0); }];
            
            [self setState:CHBTimelineHeaderViewStateNormal];
        }
        
    } else if (_state == CHBTimelineHeaderViewStateRefreshing) {
        _arrowView.hidden = YES;
    }
}

- (void)scrollViewDataSourceDidStartRefreshing:(UIScrollView *)scrollView
{
    if (_state == CHBTimelineHeaderViewStateNormal ||
        _state == CHBTimelineHeaderViewStatePulling) {
        [self refreshLastUpdatedDate];
        [self startRefreshing:scrollView];
    }
}

- (void)scrollViewDataSourceDidFinishRefreshing:(UIScrollView *)scrollView
{
    if (_state == CHBTimelineHeaderViewStateRefreshing) {
        [self refreshLastUpdatedDate];
        [self stopRefreshing:scrollView];
    }
}


@end
