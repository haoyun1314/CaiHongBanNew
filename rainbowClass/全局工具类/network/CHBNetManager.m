//
//  CHBNetManager.m
//  rainbowClass
//
//  Created by 张佳伟 on 16/1/4.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBNetManager.h"

@implementation CHBNetManager

+ (void)POST:(NSString *)URLString parameters:(id)parameters
     success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
     failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer ];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer ];
    
    [manager POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error;
        NSDictionary *resultData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
        if (!error) {
            if (success) {
                success (operation, resultData);
                
                
            }
        }
        else {
            if (success) {
                success (operation, nil);
            }
        }
    } failure:failure];
}

+ (void)Get:(NSString *)URLString parameters:(id)parameters
    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer ];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer ];
    
    [manager GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error;
        NSDictionary *resultData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:&error];
        if (!error) {
            if (success) {
                success (operation, resultData);
            }
        }
        else {
            if (success) {
                success (operation, nil);
            }
        }
        
    } failure:failure];
}


@end
