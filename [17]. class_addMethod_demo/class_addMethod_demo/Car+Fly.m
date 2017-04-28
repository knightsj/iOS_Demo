//
//  Car+Fly.m
//  class_addMethod_demo
//
//  Created by Sun Shijie on 2017/4/28.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "Car+Fly.h"
#import <objc/runtime.h>

void beginToFly(id self, SEL _cmd) {
    NSLog(@"begin to fly");
}


@implementation Car (Fly)

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    //如果是fly方法，目前没有，于是就添加一个fly方法
    if (sel == @selector(fly)) {
        class_addMethod([self class], sel, (IMP)beginToFly, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}


@end
