//
//  ShootVideoVC.m
//  rainbowClass
//
//  Created by cashyoon on 16/3/17.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "ShootVideoVC.h"
#import "ShootVideoManager.h"
#import "CHVideoPayerVC.h"

#define RecordTime  600

@interface ShootVideoVC ()<AVCaptureFileOutputRecordingDelegate>

@property (weak, nonatomic) IBOutlet UIView *videoWindow;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *uploadBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *shootBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleDistance;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shootBtnHeight;

@property (nonatomic, assign) BOOL canShooting;
@property (nonatomic, assign) BOOL isShooting;

@property (nonatomic, strong) ShootVideoManager *manager;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int totalSeconds;

@end

@implementation ShootVideoVC

#pragma mark - 事件处理
//返回
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

//取消录制
- (IBAction)cancelBtnAction:(id)sender {
    [_manager readyRecordVideo];
    [self readyToShoot];
}

//上传
- (IBAction)uplaodBtnAction:(id)sender {
    NSLog(@"上传");
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"myVideo.mov"];
    NSURL *_fileUrl = [NSURL fileURLWithPath:path];
    CHVideoPayerVC *_playVC = [[CHVideoPayerVC alloc] initWithLocalMediaURL:_fileUrl];
    [self.navigationController pushViewController:_playVC animated:YES];
}

//按下按钮开始录制
- (IBAction)shootBtnTouchDown:(id)sender {
    if (_canShooting) {
        _isShooting = YES;
        _totalSeconds = RecordTime;
        [_manager startRecordVideoWithName:@"myVideo.mov"];
    }
}

//松开按钮停止录制
- (IBAction)shootBtnTouchUpInside:(id)sender {
    if (_isShooting) {
        [self readyToUpload];
    }
}

//移出按钮区域停止录制
- (IBAction)shootBtnDragOutside:(id)sender {
    if (_isShooting) {
        [self readyToUpload];
    }
}

#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if (CIS4SInchScreen) {
        _middleDistance.constant = 15;
        _shootBtnHeight.constant = 100;
    }
    if (CIS4InchScreen) {
        _middleDistance.constant = 25;
    }
    
    _totalSeconds = RecordTime;
    
    [self readyToShoot];
    
    [self setVideoControl];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDownRecordTime) userInfo:nil repeats:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    //置空计时器，保证视图释放
    [_timer invalidate];
    _timer = nil;
    [super viewDidDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDownRecordTime) userInfo:nil repeats:YES];
    }
}

//初始化录制控制器
- (void)setVideoControl
{
    _manager = [[ShootVideoManager alloc] init];
    _canShooting = [_manager initDeviceAndSettingsOnShowView:_videoWindow];
    _manager.delegate = self;
}

#pragma mark - 逻辑处理
//开始界面
- (void)readyToShoot
{
    _isShooting = NO;
    _timeLabel.text = @"10:00";
    _cancelBtn.hidden = YES;
    _uploadBtn.hidden = YES;
    _timeLabel.hidden = NO;
    _shootBtn.hidden = NO;
}

//录制结束等待上传
- (void)readyToUpload
{
    _isShooting = NO;
    
    [_manager stopRecordVideo];
    
    _cancelBtn.hidden = NO;
    _uploadBtn.hidden = NO;
    _timeLabel.hidden = YES;
    _shootBtn.hidden = YES;
}

//倒计时方法
- (void)countDownRecordTime
{
    if (_isShooting) {
        _totalSeconds--;
        int seconds = _totalSeconds % 60;
        
        NSString *_secondStr = [NSString stringWithFormat:@"%d", seconds];
        if (seconds < 9) {
            _secondStr = [NSString stringWithFormat:@"0%d", seconds];
        }
        
        _timeLabel.text = [NSString stringWithFormat:@"0%d:%@", _totalSeconds / 60, _secondStr];
    }
}

#pragma mark - AVCaptureFileOutputRecordingDelegate

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL fromConnections:(NSArray *)connections error:(NSError *)error
{
    if (error) {
        NSLog(@"录制失败");
        return;
    }
    NSLog(@"录制完成");
}

- (void)dealloc
{
    NSLog(@"dealloc %@", [self class]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
