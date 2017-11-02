//
//  CourceNotBuyDetailVC.m
//  rainbowClass
//
//  Created by cashyoon on 16/3/14.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CourceNotBuyDetailVC.h"

@interface CourceNotBuyDetailVC ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation CourceNotBuyDetailVC

#pragma mark - 事件处理
- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 视图加载
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [super viewWillAppear:animated];
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *_requestStr = [[[request URL] absoluteString] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"网络请求 %@", _requestStr);
    if ([_requestStr containsString:@"?word="]) {
        NSString *_keyword = [[[[_requestStr componentsSeparatedByString:@"?word="] objectAtIndex:1] componentsSeparatedByString:@"&"] objectAtIndex:0];
        UIAlertView *_alertView = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"不能搜索\"%@\"", _keyword] message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [_alertView show];
        return NO;
    }
    return YES;
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
