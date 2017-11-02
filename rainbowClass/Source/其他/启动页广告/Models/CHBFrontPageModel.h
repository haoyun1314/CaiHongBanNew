//
//  CHBFrontPageModel.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/27.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "AppModel.h"

@interface CHBFrontPageModel : AppModel

@property (nonatomic, strong) NSString *ImgSrc;
@property (nonatomic, strong) NSString *ImgUrl;
@property (nonatomic, strong) NSString *Type;
@property (nonatomic, strong) NSString *ID;
+ (CHBFrontPageModel *)loadDataFromJson:(NSDictionary *)items;

@end
