//
//  NSDictionary+Custom.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/27.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Custom)
- (NSDictionary *)dictionaryForKey:(NSString *)aKey;
- (NSArray *)arrayForKey:(NSString *)aKey;
- (NSString *)stringForKey:(NSString *)aKey;
@end
