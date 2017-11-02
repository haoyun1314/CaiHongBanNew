//
//  CHBHudCenter.m
//  rainbowClass
//
//  Created by 张佳伟 on 16/1/5.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBHudCenter.h"
#import "MBProgressHUD.h"
//#import "iToast.h"

@implementation CHBHudCenter

{
    MBProgressHUD *HUD;
}

static CHBHudCenter *SINGLETON = nil;

static bool isFirstAccess = YES;

#pragma mark - Public Method

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[CHBHudCenter alloc] init];
}

- (id)mutableCopy
{
    return [[CHBHudCenter alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}

- (void)showLoadingWithMessage:(NSString*)message
{
    //    if (HUD.mode == MBProgressHUDModeIndeterminate) {
    //        return;
    //
    //    }
//    if (HUD) {
//        return;
//    }
    UIWindow *window = [[UIApplication sharedApplication].windows safeObjectAtIndex:0];
    HUD = [[MBProgressHUD alloc] initWithView:window];
    [window addSubview:HUD];
    HUD.removeFromSuperViewOnHide = YES;
    
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.labelText =message;
    [HUD show:YES];
    
}
- (void)popMessage:(NSString *)message
{
    UIWindow *window = [[UIApplication sharedApplication].windows safeObjectAtIndex:0];
    
    
    
    MBProgressHUD*hud = [[MBProgressHUD alloc] initWithView:window];
    [window addSubview:hud];
    hud.removeFromSuperViewOnHide = YES;
    
    
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.margin = 10.f;
    hud.yOffset = 150.f;
    [hud show:YES];
    [hud hide:YES afterDelay:0.5];
    
}

- (void)cancleLoadingHud
{
    if (HUD) {
        [HUD hide:YES];
        HUD = nil;
    }
}

+ (void)showLoadingWithMessage:(NSString*)message
{
    [[CHBHudCenter sharedInstance]showLoadingWithMessage:message];
}

+ (void)cancleLoadingHud
{
    [[CHBHudCenter sharedInstance]cancleLoadingHud];
}

//+ (void)popMessage:(NSString *)message
//{
//    //    [[ZZHudCenter sharedInstance]popMessage:message];
//    [iToast showText:message];
//}



@end
