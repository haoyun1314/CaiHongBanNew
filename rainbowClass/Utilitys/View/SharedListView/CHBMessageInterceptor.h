//
//  CHBMessageInterceptor.h
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHBMessageInterceptor : NSObject
@property (nonatomic, weak) id interceptor;
@property (nonatomic, weak) id delegateReceiver;
@property (nonatomic, weak) id dataSourceReceiver;
@end
