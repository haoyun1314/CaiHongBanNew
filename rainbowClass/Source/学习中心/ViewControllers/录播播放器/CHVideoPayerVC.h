//
//  CHVideoPayerVC.h
//  rainbowClass
//
//  Created by cashyoon on 16/3/7.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "RootViewController.h"

@interface CHVideoPayerVC : RootViewController


@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

- (instancetype)initWithHTTPLiveStreamingMediaURL:(NSURL *)url;
- (instancetype)initWithLocalMediaURL:(NSURL *)url;
@end
