//
//  CHBTeacherHomePage.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/18.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>
 // 老师个人页面
@interface CHBTeacherHomePage : UIViewController<UITableViewDelegate,UITableViewDataSource>

/**
 *  标记 isPresent == yes 则是以模态视图返回 NO 则以nav返回
 */
@property(nonatomic , assign) BOOL isPresent;

@end
