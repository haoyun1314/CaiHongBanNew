//
//  NSDictionary+Custom.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/27.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "NSDictionary+Custom.h"

@implementation NSDictionary (Custom)

- (NSDictionary *)dictionaryForKey:(NSString *)aKey
{
    if (aKey) {
        id value = [self objectForKey:aKey];
        if (value && [value isKindOfClass:[NSDictionary class]])
            return value;
    }
    
    return nil;
}

- (NSArray *)arrayForKey:(NSString *)aKey {
    if (aKey) {
        id value = [self objectForKey:aKey];
        if (value && [value isKindOfClass:[NSArray class]])
            return value;
    }
    
    return nil;
}

- (NSString *)stringForKey:(NSString*)aKey
{
    if (aKey) {
        id value = [self objectForKey:aKey];
        if (value) {
            if ([value isKindOfClass:[NSString class]])
                return value;
            else if ([value isKindOfClass:[NSNumber class]])
                return [value stringValue];
        }
    }
    
    return nil;
}
@end
