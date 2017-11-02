//
//  CHBTableView.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBTableView.h"

@interface CHBTableView ()
{
    CHBTimelineRefreshView   *_refreshHeadView;
    CHBTimelineLoadMoreView  *_loadMoreView;
    CHBMessageInterceptor    *_delegateInterceptor;
    
    ShareLineTableViewType  _type;
    BOOL _isRefreshing;
    BOOL _isMoreLoading;
    BOOL _isClosePerLoad;
    
    BOOL _isEnableLoadMore;
    NSDate *_dateLastUpdated;
    
    BOOL    _isPerLoading;
    CGFloat _rate;
}
@end

@implementation CHBTableView

@synthesize type = _type;
@synthesize shareListDelegate;
@synthesize rate = _rate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame style:(UITableViewStyle) Style
{
    self = [super initWithFrame:frame style:Style];
    if(self)
    {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setUp];
}

- (void) dealloc
{
    if(_bPerLoad && [self isLoadMoreAvailable] && _isClosePerLoad)
    {
        [self removeObserver:self forKeyPath:@"contentOffset"];
        [self removeObserver:self forKeyPath:@"contentSize"];
    }
}

- (void)setUp
{
    _delegateInterceptor = [[CHBMessageInterceptor alloc] init];
    _delegateInterceptor.interceptor = self;
    _delegateInterceptor.delegateReceiver = super.delegate;
    _delegateInterceptor.dataSourceReceiver = super.dataSource;
    
    if(super.delegate)
        super.delegate = (id)_delegateInterceptor;
    else
        super.delegate = nil;
    
    if(super.dataSource)
        super.dataSource = (id)_delegateInterceptor;
    else
        super.dataSource = nil;
    
    _rate = 2;
    
    _isRefreshing = NO;
    _isMoreLoading = NO;
    _isPerLoading = NO;
    _bPerLoad = NO;
    _isEnableLoadMore = NO;
    _isClosePerLoad = NO;
    self.type = SHARE_LINE_NONE;
}

/**
 * 设置正在预加载标识位
 */
-(void) setPerLoading:(BOOL) bState
{
    @synchronized(self)
    {
        _isPerLoading = bState;
    }
}

/*
 * 获取正在预加载标识位
 */
-(BOOL) getPerLoading
{
    @synchronized(self)
    {
        return _isPerLoading;
    }
}

-(void) setRate:(CGFloat)rate
{
    _rate = rate;
    if(_rate < 0)
        _rate = 0;
}

-(void) setBPerLoad:(BOOL) perLoad
{
    if(perLoad && ![self getEnableLoadMore])
    {
        _bPerLoad = NO;
        return;
    }
    
    if(_bPerLoad == perLoad)
        return;
    
    _bPerLoad = perLoad;
    
    if(_bPerLoad && [self isLoadMoreAvailable] && !_isClosePerLoad)
    {
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        [self addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        _isClosePerLoad = YES;
    }
    else if(!_bPerLoad /*&& [self isLoadMoreAvailable]*/ && _isClosePerLoad)
    {
        [self removeObserver:self forKeyPath:@"contentOffset"];
        [self removeObserver:self forKeyPath:@"contentSize"];
        _isClosePerLoad = NO;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(object == self)
    {
        if ([keyPath isEqualToString:@"contentSize"]) {
        }
        else if([keyPath isEqualToString:@"contentOffset"])
        {
            if(![self getPerLoading] && [self getEnableLoadMore])
            {
                CGFloat height = MAX(self.contentSize.height, self.frame.size.height);
                CGFloat y = height - self.frame.size.height;
                if(y > 0)
                {
                    //CGFloat yRate = self.contentOffset.y / y;
                    //if(yRate >= 0.5)
                    if(y - self.contentOffset.y <= self.frame.size.height * _rate)
                    {
                        [self didTriggerLoadMore:_loadMoreView];
                    }
                }
            }
        }
    }
}

-(void) setDelegate:(id<UITableViewDelegate>)delegate
{
    if (_delegateInterceptor) {
        super.delegate = nil;
        _delegateInterceptor.delegateReceiver = delegate;
        if(delegate)
            super.delegate = (id)_delegateInterceptor;
        else
            super.delegate = nil;
    } else {
        super.delegate = delegate;
    }
}

-(void) setDataSource:(id<UITableViewDataSource>)dataSource
{
    if(_delegateInterceptor)
    {
        super.dataSource = nil;
        _delegateInterceptor.dataSourceReceiver = dataSource;
        if(dataSource)
            super.dataSource = (id)_delegateInterceptor;
        else
            super.dataSource = nil;
    }else{
        super.dataSource = dataSource;
    }
}

- (BOOL)isRefreshAvailable
{
    return (self.type == SHARE_LINE_STANDARD) || (self.type == SHARE_LINE_REFRESH_HEADER);
}

- (BOOL)isLoadMoreAvailable
{
    return (self.type == SHARE_LINE_STANDARD) || (self.type == SHARE_LINE_LOADMORE_FOOTER);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if ([self isLoadMoreAvailable]) {
        CGFloat footerViewTop = MAX(self.frame.size.height, self.contentSize.height);
        _loadMoreView.frame = CGRectMake(0, footerViewTop, _loadMoreView.frame.size.width, _loadMoreView.frame.size.height);
    }
}

-(void) setEnableLoadMore:(BOOL) enable
{
    @synchronized(self)
    {
        if(enable)
        {
            _loadMoreView.hidden = NO;
        }
        else
        {
            _loadMoreView.hidden = YES;
            self.bPerLoad = NO;
        }
        _isEnableLoadMore = enable;
    }
}

-(BOOL) getEnableLoadMore
{
    @synchronized(self)
    {
        return _isEnableLoadMore;
    }
}

-(void) loadRefreshView
{
    if(!_refreshHeadView)
    {
        //_refreshHeadView = [ZZTimelineRefreshView viewFromNib];
        _refreshHeadView = [CHBTimelineRefreshView createInstanseWinthFrame:CGRectMake(0, -55, CSCREEN_WIDTH, 55)];
        _refreshHeadView.delegate = self;
        [self addSubview:_refreshHeadView];
    }
}

-(void) loadMoreView
{
    if(!_loadMoreView)
    {
        _loadMoreView = [CHBTimelineLoadMoreView createInstanseWinthFrame:CGRectMake(0, self.frame.size.height, CSCREEN_WIDTH, 48)];//[ZZTimelineLoadMoreView viewFromNib];
        _loadMoreView.delegate = self;
        [self addSubview:_loadMoreView];
        [self setEnableLoadMore:YES];
    }
}

-(void) removeRefreshView
{
    if(_refreshHeadView)
    {
        [_refreshHeadView removeFromSuperview];
        _refreshHeadView = nil;
    }
}

-(void) removeMoreView
{
    if(_loadMoreView)
    {
        [_loadMoreView removeFromSuperview];
        _loadMoreView = nil;
    }
}

-(void) setType:(ShareLineTableViewType) type
{
    _type = type;
    
    if(_isRefreshing)
        [self setRefreshing:NO];
    
    if(_isMoreLoading)
        [self setMoreLoading:NO];
    
    self.contentInset = UIEdgeInsetsZero;
    
    if(_type == SHARE_LINE_STANDARD)
    {
        [self loadRefreshView];
        [self loadMoreView];
    }
    else if(_type == SHARE_LINE_REFRESH_HEADER)
    {
        [self loadRefreshView];
    }
    else if(_type == SHARE_LINE_LOADMORE_FOOTER)
    {
        [self loadMoreView];
    }
    else
    {
        [self removeRefreshView];
        [self removeMoreView];
    }
}

-(void) stopRefreshView
{
    [self setRefreshing:NO];
    [self setPerLoading:NO];
    
    //防止下拉和上拉同时刷新的时候容错处理
    [_loadMoreView setState:CHBTimelineFooterViewStateNormal];
}

-(void) stopLoadMoreView
{
    [self setMoreLoading:NO];
    [self setPerLoading:NO];
}

-(void) setRefreshing:(BOOL) isRefresh
{
    @synchronized(self)
    {
        if(![self isRefreshAvailable])
            return;
        
        if(!_isRefreshing && isRefresh)
            [_refreshHeadView scrollViewDataSourceDidStartRefreshing:self];
        else if(_isRefreshing && !isRefresh)
        {
            _dateLastUpdated = [NSDate date];
            [_refreshHeadView scrollViewDataSourceDidFinishRefreshing:self];
        }
        _isRefreshing = isRefresh;
    }
}

-(void) setMoreLoading:(BOOL) isMoreLoad
{
    @synchronized(self)
    {
        if(![self isLoadMoreAvailable])
            return;
        
        if(!_isMoreLoading && isMoreLoad)
            [_loadMoreView scrollViewDataSourceDidStartLoadingMore:self];
        else if(_isMoreLoading && !isMoreLoad)
            [_loadMoreView scrollViewDataSourceDidFinishLoadingMore:self];
        
        _isMoreLoading = isMoreLoad;
    }
}


-(void) reloadData
{
    [super reloadData];
    
}

#pragma mark --ZZTimelineRefreshViewDelegate
- (void)didTriggerRefresh:(CHBTimelineRefreshView *)refreshView
{
    if(![self getPerLoading])
    {
        if(shareListDelegate && [shareListDelegate respondsToSelector:@selector(sharelineTableViewDidTriggerRefresh:)])
        {
            [self setRefreshing:YES];
            [self setPerLoading:YES];
            [shareListDelegate sharelineTableViewDidTriggerRefresh:self];
        }
    }
}

- (NSDate *)refreshViewDataSourceLastUpdated:(CHBTimelineRefreshView *)refreshView
{
    return _dateLastUpdated;
}

#pragma mark --ZZTimelineLoadMoreViewDelegate
- (void)didTriggerLoadMore:(CHBTimelineLoadMoreView *)loadMoreView
{
    if(![self getPerLoading])
    {
        if(shareListDelegate && [shareListDelegate respondsToSelector:@selector(shareineTableViewDidTriggerLoadMore:)])
        {
            [self setPerLoading:YES];
            [self setMoreLoading:YES];
            [shareListDelegate shareineTableViewDidTriggerLoadMore:self];
        }
    }
}

- (BOOL)didSupportLoadMore:(CHBTimelineLoadMoreView *)loadMoreView
{
    if([self getPerLoading])
        return YES;
    
    if([self isLoadMoreAvailable] && [self getEnableLoadMore] && !_isMoreLoading)
        return [self getEnableLoadMore];
    else
        return NO;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if ([self isRefreshAvailable] && !_isRefreshing && !_isMoreLoading) {
        [_refreshHeadView scrollViewWillBeginDragging:scrollView];
    }
    
    if ([self isLoadMoreAvailable] /*&& [self getEnableLoadMore] && !_isMoreLoading && !_isRefreshing*/) {
        [_loadMoreView scrollViewWillBeginDragging:scrollView];
    }
    
    if (_delegateInterceptor.delegateReceiver != self) {
        if ([_delegateInterceptor.delegateReceiver respondsToSelector:_cmd]) {
            [_delegateInterceptor.delegateReceiver scrollViewWillBeginDragging:scrollView];
        }
    }
    
    if(_delegateInterceptor.dataSourceReceiver != self){
        if([_delegateInterceptor.dataSourceReceiver respondsToSelector:_cmd]){
            [_delegateInterceptor.dataSourceReceiver scrollViewWillBeginDragging:scrollView];
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if ([self isRefreshAvailable] && !_isRefreshing && !_isMoreLoading) {
        [_refreshHeadView scrollViewDidEndDragging:scrollView];
    }
    
    if(![self getPerLoading])
    {
        if ([self isLoadMoreAvailable] && [self getEnableLoadMore] && !_isMoreLoading && !_isRefreshing) {
            [_loadMoreView scrollViewDidEndDragging:scrollView];
        }
    }
    else
        [_loadMoreView scrollViewDidEndDragging:scrollView];
    
    if (_delegateInterceptor.delegateReceiver != self) {
        if ([_delegateInterceptor.delegateReceiver respondsToSelector:_cmd]) {
            [_delegateInterceptor.delegateReceiver scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
        }
    }
    
    if(_delegateInterceptor.dataSourceReceiver != self){
        if([_delegateInterceptor.dataSourceReceiver respondsToSelector:_cmd]){
            [_delegateInterceptor.dataSourceReceiver scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([self isRefreshAvailable] && !_isRefreshing && !_isMoreLoading) {
        
        [_refreshHeadView scrollViewDidScroll:scrollView];
    }
    
    if ([self isLoadMoreAvailable] /*&& [self getEnableLoadMore] && !_isRefreshing && !_isMoreLoading*/) {
        [_loadMoreView scrollViewDidScroll:scrollView];
    }
    
    if (_delegateInterceptor.delegateReceiver != self) {
        if ([_delegateInterceptor.delegateReceiver respondsToSelector:_cmd]) {
            [_delegateInterceptor.delegateReceiver scrollViewDidScroll:scrollView];
        }
    }
    
    if(_delegateInterceptor.dataSourceReceiver != self){
        if([_delegateInterceptor.dataSourceReceiver respondsToSelector:_cmd]){
            [_delegateInterceptor.dataSourceReceiver scrollViewDidScroll:scrollView];
        }
    }
}


@end
