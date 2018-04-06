//
//  GreetingClass.m
//  message_forward
//
//  Created by Sun Shijie on 2018/3/12.
//  Copyright © 2018年 Shijie. All rights reserved.
//

#import "GreetingClass.h"
#import <objc/runtime.h>
#import "SecondGreetingClass.h"

@implementation GreetingClass

void functionForMethod(id self, SEL _cmd)
{
    NSLog(@"Hello!");
}

Class functionForClassMethod(id self, SEL _cmd)
{
    NSLog(@"Hi!");
    return [GreetingClass class];
}


+ (BOOL)resolveClassMethod:(SEL)sel
{
    NSLog(@"resolveClassMethod");
    NSString *selString = NSStringFromSelector(sel);
    if ([selString isEqualToString:@"hi"])
    {
        Class metaClass = objc_getMetaClass("GreetingClass");
        class_addMethod(metaClass, @selector(hi), (IMP)functionForClassMethod, "v@:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}


+ (BOOL)resolveInstanceMethod:(SEL)sel{

//    NSLog(@"resolveInstanceMethod");
//    NSString *selString = NSStringFromSelector(sel);
//    if ([selString isEqualToString:@"hello"])
//    {
//        class_addMethod(self, @selector(hello), (IMP)functionForMethod, "v@:");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}


//备用接受者
- (id)forwardingTargetForSelector:(SEL)aSelector
{
//    NSLog(@"forwardingTargetForSelector");
//    NSString *selectorString = NSStringFromSelector(aSelector);
//
//
//    if ([selectorString isEqualToString:@"hello"]) {
//
//        SecondGreetingClass *second = [[SecondGreetingClass alloc] init];
//        return second;
//    }
    
    return [super forwardingTargetForSelector:aSelector];
}



/*完整的消息转发*/
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel isEqualToString:@"hello"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}


- (void)forwardInvocation:(NSInvocation *)inInvocation
{
    NSLog(@"forwardInvocation");
    SecondGreetingClass * second = [[SecondGreetingClass alloc] init];
    SEL selector = [inInvocation selector];
    if ([second respondsToSelector:selector]) {
        [inInvocation invokeWithTarget:second];
    }
}

@end
