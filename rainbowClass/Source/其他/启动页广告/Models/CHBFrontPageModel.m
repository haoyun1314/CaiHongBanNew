//
//  CHBFrontPageModel.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/27.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBFrontPageModel.h"

@implementation CHBFrontPageModel

+ (CHBFrontPageModel *)loadDataFromJson:(NSDictionary *)items
{
    if (!items) {
        return nil;
    }
    
    CHBFrontPageModel *model = [[CHBFrontPageModel alloc]init];
    model.ImgSrc = [items stringForKey:@"ImgSrc"];
    model.ImgUrl = [items stringForKey:@"ImgUrl"];
    model.Type = [items stringForKey:@"Type"];
    model.ID = [items stringForKey:@"Id"];
    
    return model;
}

@end
