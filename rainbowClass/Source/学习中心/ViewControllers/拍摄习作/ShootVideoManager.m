//
//  ShootVideoManager.m
//  rainbowClass
//
//  Created by cashyoon on 16/3/17.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "ShootVideoManager.h"

@interface ShootVideoManager ()

@property (nonatomic, strong) AVCaptureMovieFileOutput *output;
@property (nonatomic, strong) AVCaptureSession *session;

@end

@implementation ShootVideoManager

//初始化录制视频的设备和设置条件
- (BOOL)initDeviceAndSettingsOnShowView:(UIView *)showView
{
    //创建视频设备(摄像头前，后)
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    
    //初始化一个摄像头输入设备(first是后摄像头，last是前摄像头)
    AVCaptureDeviceInput *inputVideo = [AVCaptureDeviceInput deviceInputWithDevice:[devices firstObject] error:NULL];
    
    if (inputVideo == nil) {//无法获取摄像头
        return NO;
    }
    //创建麦克风设备
    AVCaptureDevice *deviceAudio = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    //初始化麦克风输入设备
    AVCaptureDeviceInput *inputAudio = [AVCaptureDeviceInput deviceInputWithDevice:deviceAudio error:NULL];
    
//    if (inputAudio == nil) {//无法获取麦克风
//        return NO;
//    }
    
    //初始化一个movie的文件输出
    _output = [[AVCaptureMovieFileOutput alloc] init];
    
    //初始化一个会话
    _session = [[AVCaptureSession alloc] init];
    
    //将输入输出设备添加到会话中
    if ([_session canAddInput:inputVideo]) {
        [_session addInput:inputVideo];
    }
    if ([_session canAddInput:inputAudio]) {
        [_session addInput:inputAudio];
    }
    if ([_session canAddOutput:_output]) {
        [_session addOutput:_output];
    }
    
    //创建一个预览图层
    AVCaptureVideoPreviewLayer *preLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    [preLayer setFrame:showView.bounds];
    [preLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    [showView.layer setMasksToBounds:YES];
    [showView.layer addSublayer:preLayer];
    
    //开始会话，出现视频画面
    [_session startRunning];
    
    return YES;
    
}

//准备录制
- (void)readyRecordVideo
{
    [_session startRunning];
}

//开始录制
- (void)startRecordVideoWithName:(NSString *)videoName
{
    //设置录制视频保存的路径
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:videoName];
    NSURL *_fileUrl = [NSURL fileURLWithPath:path];
    
    //开始录制,并设置控制器为录制的代理
    [_output startRecordingToOutputFileURL:_fileUrl recordingDelegate:_delegate];
}

//结束录制
- (void)stopRecordVideo
{
    if ([_output isRecording]) {//判断是否在录制
        [_output stopRecording];
        [_session stopRunning];
        
    }
}

- (void)dealloc
{
    NSLog(@"dealloc %@", [self class]);
}


@end
