//
//  AppStartModel.m
//  bumeng
//
//  Created by cashyoon on 15/3/31.
//  Copyright (c) 2015年 GUWH. All rights reserved.
//

#import "AppStartModel.h"

@implementation AppStartModel

+ (instancetype)defaultManager
{
    static AppStartModel * model = nil;
    @synchronized(self){
        if (model == nil) {
            model = [[AppStartModel alloc] init];
        }
    }
    return model;
}

+ (AppStartModel *)sharedInstance {
    static dispatch_once_t s_once;
    static id s_instance;
    dispatch_once(&s_once, ^{
        s_instance = [self new];
    });
    return s_instance;
}



@end
