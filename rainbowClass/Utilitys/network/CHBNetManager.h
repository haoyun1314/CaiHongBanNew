//
//  CHBNetManager.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/1/27.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHBNetManager : NSObject
// post request
+ (void)POST:(NSString *)URLString parameters:(id)parameters
     success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

// get request
+ (void)Get:(NSString *)URLString parameters:(id)parameters
    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
