//
//  CHVideoPayerVC.m
//  rainbowClass
//
//  Created by cashyoon on 16/3/7.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHVideoPayerVC.h"
#import "CHAVPlayerView.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>


#define OFFSET 5.0 // 快进和快退的时间跨度
#define ALPHA 0.5 // headerView和bottomView的透明度

static void * playerItemDurationContext = &playerItemDurationContext;
static void * playerItemStatusContext = &playerItemStatusContext;
static void * playerPlayingContext = &playerPlayingContext;



@interface CHVideoPayerVC ()
{
    CGFloat screenWidth;
    CGFloat screenHeight;
    CGFloat brightness; // 屏幕亮度
    CGFloat sysVolume; // 系统声音
    CGFloat playerProgress; // 播放进度
    UISlider *volumeSlider; // 改变系统声音的 MPVolumeSlider (UISlider的子类)
    
    
    
    // 手势初始X和Y坐标
    CGFloat beginTouchX;
    CGFloat beginTouchY;
    
    
    // 手势相对于初始X和Y坐标的偏移量
    CGFloat offsetX;
    CGFloat offsetY;



}

@property (weak, nonatomic) IBOutlet CHAVPlayerView *playerView;

@property (nonatomic, strong) AVPlayer *player; // 播放器
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) NSURL *mediaURL; // 视频资源的url
@property (nonatomic, assign) BOOL playing; // 是否正在播放
@property (nonatomic, assign) BOOL canPlay; // 是否可以播放
@property (nonatomic, assign) CMTime duration; // 视频总时间
@property (nonatomic, strong) id timeObserver;

@property (weak, nonatomic) IBOutlet UISlider *ProgressView;//播放进度
@property (weak, nonatomic) IBOutlet UILabel *remainTimeLabel;//剩余时间
@property (weak, nonatomic) IBOutlet UIButton *PlayButton;//播放



@end

@implementation CHVideoPayerVC


- (instancetype)initWithLocalMediaURL:(NSURL *)url
{
    if (self = [super init])
    {
        self.mediaURL = url;
        
        //---创建playerTtem
        [self createLocalMediaPlayerItem];
    }
    return self;
}

- (instancetype)initWithHTTPLiveStreamingMediaURL:(NSURL *)url
{
    if (self = [super init]) {
        self.mediaURL = url;
        
        //---创建playerTtem
        [self createHLSPlayerItem];
    }
    return self;
}







- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    screenWidth = [[UIScreen mainScreen] bounds].size.width;
    screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    if (screenHeight > screenWidth) { // 让宽度比高度大，即横屏的宽高
        CGFloat tmp = screenWidth;
        screenWidth = screenHeight;
        screenHeight = tmp;
    }
    
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7 以上
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    }
    
    [self.ProgressView setMinimumTrackImage:[[UIImage imageNamed:@"video_num_front.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
    [self.ProgressView setMaximumTrackImage:[[UIImage imageNamed:@"video_num_bg.png"]  resizableImageWithCapInsets:UIEdgeInsetsMake(0, 5, 0, 5) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
    [self.ProgressView setThumbImage:[UIImage imageNamed:@"progressThumb.png"] forState:UIControlStateNormal];
    
    // KVO观察self.playing属性的变化以改变playButton的状态
    [self addObserver:self forKeyPath:@"playing" options:NSKeyValueObservingOptionNew context:playerPlayingContext];
    
    [self createPlayer];// 创建播放器
    
//     监控 app 活动状态，打电话/锁屏 时暂停播放
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidBecomActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
}


#pragma mark - touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [super touchesBegan:touches withEvent:event];
    // 显示或隐藏播放工具栏
    if (self.headView.alpha == 0.0)
    {
        // 隐藏状态下就显示
        [self showHeaderViewAndBottomView];
        
    } else {
        // 显示状态下就隐藏
        [self hideHeaderViewAndBottomView];
        
        // 在显示状态下点击后就隐藏，那么之前的延迟调用就要取消，不取消也不会有问题
        [self cancelPerformSelector:@selector(hideHeaderViewAndBottomView)];
    }
    
}

- (void)appWillResignActive:(NSNotification *)aNotification {
    [self.player pause];
    self.playing = NO;
}

- (void)appDidBecomActive:(NSNotification *)aNotification
{
    
}



- (IBAction)sliderTapGesture:(UITapGestureRecognizer *)sender {
    
    
    [self cancelPerformSelector:@selector(hideHeaderViewAndBottomView)];
    CGFloat tapX = [sender locationInView:sender.view].x;
    CGFloat sliderWidth = sender.view.bounds.size.width;
    Float64 totalSeconds = CMTimeGetSeconds(self.duration); // 总时间
    CMTime dstTime = CMTimeMakeWithSeconds(totalSeconds * (tapX / sliderWidth), self.duration.timescale);
    [self seekToCMTime:dstTime progress:self.ProgressView.value];
    [self delayHideHeaderViewAndBottomView];
    
    
}

// 调整播放点
- (void)seekToCMTime:(CMTime)time progress:(CGFloat)progress{
    
    
    // 如果正在播放先暂停播放（但是不改变_playing的值为NO，因为拖动进度完成后要根据_playing来判断是否要继续播放），再根据进度条表示的值进行播放定位
    if (_playing) {
        [self.player pause];
    }
    
    if (time.flags == 0) {
        return;
    }
    
    [self.player seekToTime:time completionHandler:^(BOOL finished) {
        if (_playing) {
            // 如果拖动前正在播放，拖动后也要在播放状态
            [self.player play];
        }
    }];
    
}

#pragma mark - 拖动进度条改变播放点(playhead)
// valueChanged
- (IBAction)slidingProgress:(UISlider *)slider {
    
    // 取消调用hideHeaderViewAndBottomView方法，不隐藏
    [self cancelPerformSelector:@selector(hideHeaderViewAndBottomView)];
    
    Float64 totalSeconds = CMTimeGetSeconds(self.duration);
    
    CMTime time = CMTimeMakeWithSeconds(totalSeconds * slider.value, self.duration.timescale);
    
    [self seekToCMTime:time progress:slider.value];
}

// touchUpInside/touchUpOutside
- (IBAction)slidingEnded:(UISlider *)sender {
    // 拖动手势取消后延迟调用hideHeaderViewAndBottomView
    [self delayHideHeaderViewAndBottomView];
}



#pragma mark 根据CMTime生成一个时间字符串
- (NSString *)timeStringWithCMTime:(CMTime)time {
    Float64 seconds = time.value / time.timescale;
    // 把seconds当作时间戳得到一个date
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
    
    // 格林威治标准时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    // 设置时间显示格式
    [formatter setDateFormat:(seconds / 3600 >= 1) ? @"h:mm:ss" : @"mm:ss"];
    
    // 返回这个date的字符串形式
    return [formatter stringFromDate:date];
}


#pragma mark - 创建播放器

- (void)createPlayer
{
    
    // 1.控制器初始化时创建playerItem对象
    // 2.观察self.currentItem.status属性变化，变为AVPlayerItemStatusReadyToPlay时就可以播放了
    [self addObserver:self forKeyPath:@"playerItem.status" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:playerItemStatusContext];
    
    // 监听播放到最后的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidPlayToEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    
    // 3.playerItem关联创建player
    self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
    
    // 4.player关联创建playerView
    [self.playerView setPlayer:self.player];
    
    [self.playerView.layer setBackgroundColor:[UIColor blackColor].CGColor];
}

- (void)createLocalMediaPlayerItem {
    // 如果是本地视频，创建AVURLAsset对象
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:self.mediaURL options:nil];
    
    self.playerItem = [[AVPlayerItem alloc] initWithAsset:asset];
}

- (void)createHLSPlayerItem {
    // HTTPLiveStreaming视频流不能直接创建AVAsset，直接从url创建playerItem对象
        self.playerItem = [AVPlayerItem playerItemWithURL:self.mediaURL];
}


#pragma mark 播放到最后时
- (void)playerItemDidPlayToEnd:(NSNotification *)aNotification {
    [self.playerItem seekToTime:kCMTimeZero];
    self.playing = NO;
}





- (IBAction)PlayBtn:(id)sender {
    [self cancelPerformSelector:@selector(hideHeaderViewAndBottomView)];
    
    if (!self.playing) {
        [self.player play];
        
        self.playing = YES; // KVO观察playing属性的变化
    } else {
        [self.player pause];
        
        self.playing = NO;
    }
    
    [self delayHideHeaderViewAndBottomView];

}


#pragma mark 取消调用某个方法
- (void)cancelPerformSelector:(SEL)selector {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:selector object:nil];
}
#pragma mark 延迟调用hideHeaderViewAndBottomView方法
- (void)delayHideHeaderViewAndBottomView {
    [self performSelector:@selector(hideHeaderViewAndBottomView) withObject:nil afterDelay:5.0f];
}
#pragma mark 隐藏headerView和bottomView
- (void)hideHeaderViewAndBottomView {
    [UIView animateWithDuration:0.5 animations:^{
        [self.headView setAlpha:0.0];
        [self.bottomView setAlpha:0.0];
    }];
}
#pragma mark 显示headerView和bottomView
- (void)showHeaderViewAndBottomView {
    [UIView animateWithDuration:0.5 animations:^{
        [self.headView setAlpha:ALPHA];
        [self.bottomView setAlpha:ALPHA];
    }];
}


- (IBAction)goBackPage:(id)sender {
    [self.player pause];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)delayDismissPlayerViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == playerItemStatusContext) {
        
        if (self.playerItem.status == AVPlayerItemStatusReadyToPlay) {
            // 视频准备就绪
            dispatch_async(dispatch_get_main_queue(), ^{
                [self readyToPlay];
            });
        } else {
            // 如果一个不能播放的视频资源加载进来会进到这里
            NSLog(@"视频无法播放");
            // 延迟dismiss播放器视图控制器
            [self performSelector:@selector(delayDismissPlayerViewController) withObject:nil afterDelay:3.0f];
        }
        
    } else if (context == playerPlayingContext){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([[change objectForKey:@"new"] intValue] == 1) {
                // 如果playing变为YES就显示暂停按钮
                [self.PlayButton setImage:[UIImage imageNamed:@"pause_nor.png"] forState:UIControlStateNormal];
            } else {
                // 如果playing变为NO就显示播放按钮
                [self.PlayButton setImage:[UIImage imageNamed:@"play_nor.png"] forState:UIControlStateNormal];
            }
        });
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}


#pragma mark AVPlayerItemStatusReadyToPlay
- (void)readyToPlay {
    // 视频可以播放时才自动延迟隐藏headerView和bottomView
    [self delayHideHeaderViewAndBottomView];
    
    // 可以播放
    self.canPlay = YES;
    [self.PlayButton setEnabled:YES];
    [self.ProgressView setEnabled:YES];
    
    self.duration = self.playerItem.duration;
    
    // 未播放前剩余时间就是视频长度
    self.remainTimeLabel.text = [NSString stringWithFormat:@"-%@", [self timeStringWithCMTime:self.duration]];
    
    __weak typeof(self) weakSelf = self;
    // 更新当前播放条目的已播时间, CMTimeMake(3, 30) == (Float64)3/30 秒
    self.timeObserver = [self.player addPeriodicTimeObserverForInterval:CMTimeMake(3, 30) queue:nil usingBlock:^(CMTime time) {
        NSString *text = [weakSelf timeStringWithCMTime:CMTimeSubtract(weakSelf.duration, time)];
          weakSelf.remainTimeLabel.text = [NSString stringWithFormat:@"-%@", text];
//        
        // 更新进度
        weakSelf.ProgressView.value = CMTimeGetSeconds(time) / CMTimeGetSeconds(weakSelf.duration);
        
    }];
    [self PlayBtn:nil];
    NSLog(@"状态准备就绪 -> %@", @(AVPlayerItemStatusReadyToPlay));
}
#pragma --mark---屏幕旋转------
- (BOOL)shouldAutorotate{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscapeRight;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation

{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}






#pragma mark -

- (void)dealloc
{
    [self.player pause];
    [self removeObserver:self forKeyPath:@"playerItem.status" context:playerItemStatusContext];
    [self removeObserver:self forKeyPath:@"playing" context:playerPlayingContext];
    [self.player removeTimeObserver:self.timeObserver];
     self.timeObserver = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    self.player = nil;
    self.playerItem = nil;
    self.mediaURL = nil;
}

@end
