//
//  CHBMessageInterceptor.m
//  rainbowClass
//
//  Created by 彩虹班 on 16/2/2.
//  Copyright © 2016年 guoyun. All rights reserved.
//

#import "CHBMessageInterceptor.h"

@implementation CHBMessageInterceptor
- (id)forwardingTargetForSelector:(SEL)selector {
    if ([_interceptor respondsToSelector:selector]) { return _interceptor; }
    if ([_delegateReceiver respondsToSelector:selector]) { return _delegateReceiver; }
    if ([_dataSourceReceiver respondsToSelector:selector]) { return _dataSourceReceiver; }
    return [super forwardingTargetForSelector:selector];
}

- (BOOL)respondsToSelector:(SEL)selector {
    if ([_interceptor respondsToSelector:selector]) { return YES; }
    if ([_delegateReceiver respondsToSelector:selector]) { return YES; }
    if ([_dataSourceReceiver respondsToSelector:selector]) { return YES; }
    return [super respondsToSelector:selector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *sig = [super methodSignatureForSelector:aSelector];
    if(!sig)
        sig = [_interceptor methodSignatureForSelector:aSelector];
    if(!sig)
        sig = [_delegateReceiver methodSignatureForSelector:aSelector];
    if(!sig)
        sig = [_dataSourceReceiver methodSignatureForSelector:aSelector];
    return sig;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL name = [anInvocation selector];
    if([_interceptor respondsToSelector:name])
        [anInvocation invokeWithTarget:_interceptor];
    else if([_delegateReceiver respondsToSelector:name])
        [anInvocation invokeWithTarget:_delegateReceiver];
    else if([_dataSourceReceiver respondsToSelector:name])
        [anInvocation invokeWithTarget:_dataSourceReceiver];
    else
        [super forwardInvocation:anInvocation];
}
@end
