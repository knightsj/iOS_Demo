//
//  UIImage+ImageLoadResult.m
//  method_swizzling
//
//  Created by Sun Shijie on 2017/4/26.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "UIImage+ImageLoadResult.h"
#import <objc/runtime.h>

@implementation UIImage (ImageLoadResult)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL originalSelector = @selector(imageNamed:);
        SEL swizzledSelector = @selector(sj_imageNamed:);
        
        Method originalMethod = class_getClassMethod(self, originalSelector);
        Method swizzledMethod = class_getClassMethod(self, swizzledSelector);
        
        //交换实现
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

+ (UIImage *)sj_imageNamed:(NSString *)name
{

    UIImage *image = [UIImage sj_imageNamed:name];
    
    if (image) {
        NSLog(@"图片加载成功");
    } else {
        NSLog(@"图片加载失败");
    }
    
    return image;
}

@end
