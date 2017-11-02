//
//  AppDelegate+UMSocial_Sdk.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/23.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "AppDelegate+UMSocial_Sdk.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "WXApi.h"

#import "UMSocial.h"

@implementation AppDelegate (UMSocial_Sdk)

- (void)configSocialShareInfo
{
    // 友盟分享
    [UMSocialData setAppKey:@"56ca6d52e0f55af9940021df"];

    //如果你要支持不同的屏幕方向，需要这样设置，否则在iPhone只支持一个竖屏方向
    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskAll];
    
//    设置微信AppId，设置分享url，默认使用友盟的网址
//    [UMSocialWechatHandler setWXAppId:@"wx889a66cccba6e836" appSecret:@"9b5e162322a8da32ee981c57fadb3fce" url:@"http://www.umeng.com/social"];
    

    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。
//    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"4273112729"
//                                              secret:@"65c9f5ea3eed2d067dd884b34796af54"
//                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];

}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}

@end
