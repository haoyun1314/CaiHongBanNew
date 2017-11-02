//
//  RootViewController.h
//  bumeng
//
//  Created by cashyoon on 15/3/5.
//  Copyright (c) 2015年 GUWH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController


//添加方法，用信息字典进行初始化
@property (retain,nonatomic) NSDictionary * infoDict;

//定制tabBar
- (void)customTabBarItem;



@end
