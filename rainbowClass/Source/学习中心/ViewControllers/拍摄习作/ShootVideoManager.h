//
//  ShootVideoManager.h
//  rainbowClass
//
//  Created by cashyoon on 16/3/17.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface ShootVideoManager : NSObject


@property (nonatomic, assign) id<AVCaptureFileOutputRecordingDelegate> delegate;

/**
 *  初始化录制视频的设备和设置条件
 *
 *  @param showView 拍摄画面展示在该视图上
 *
 *  @return 是否初始化成功
 */
- (BOOL)initDeviceAndSettingsOnShowView:(UIView *)showView;

/**
 *  准备录制
 */
- (void)readyRecordVideo;

/**
 *  开始录制
 *
 *  @param videoName 保存本地文件的路径
 */
- (void)startRecordVideoWithName:(NSString *)videoName;

/**
 *  结束录制
 */
- (void)stopRecordVideo;

@end
