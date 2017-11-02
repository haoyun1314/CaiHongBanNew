//
//  CHBTimelineRefreshView.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CHBTimelineRefreshViewDelegate;

@interface CHBTimelineRefreshView : UIView

@property (nonatomic, strong) UIImageView *arrowView;
@property (nonatomic, strong) UIActivityIndicatorView *progressIndicator;

@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UILabel *lastUpdatedLabel;

@property (nonatomic, weak) id <CHBTimelineRefreshViewDelegate> delegate;


+(CHBTimelineRefreshView *)createInstanseWinthFrame:(CGRect) frame;

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

- (void)scrollViewDataSourceDidStartRefreshing:(UIScrollView *)scrollView;
- (void)scrollViewDataSourceDidFinishRefreshing:(UIScrollView *)scrollView;

@end

@protocol CHBTimelineRefreshViewDelegate <NSObject>

- (void)didTriggerRefresh:(CHBTimelineRefreshView *)refreshView;
- (NSDate *)refreshViewDataSourceLastUpdated:(CHBTimelineRefreshView *)refreshView;

@end
