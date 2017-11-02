//
//  CHAVPlayerView.m
//  rainbowClass
//
//  Created by cashyoon on 16/3/7.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHAVPlayerView.h"
#import <AVFoundation/AVFoundation.h>

@implementation CHAVPlayerView

// 使PlayerView的layer为AVPlayerLayer类型
+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (AVPlayer *)player {
    return [(AVPlayerLayer *)[self layer] player];
}

- (void)setPlayer:(AVPlayer *)player {
    [(AVPlayerLayer *)[self layer] setPlayer:player];
}

- (void)dealloc
{
    self.player = nil;
}
@end
