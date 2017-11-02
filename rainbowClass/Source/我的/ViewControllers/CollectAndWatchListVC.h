//
//  CollectAndWatchListVC.h
//  rainbowClass
//
//  Created by WangYu on 7/3/16.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    CollectListType,
    WatchListType,
}CollectAndWatchListType;

@interface CollectAndWatchListVC : UIViewController

@property (nonatomic, assign) CollectAndWatchListType listType;

@end
