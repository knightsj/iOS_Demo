//
//  UIView+ViewController.m
//  find_viewController
//
//  Created by Sun Shijie on 2018/4/3.
//  Copyright © 2018年 Shijie. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)belongingVC{
    
    id target = self;
    
    while (target) {
        
        target = ((UIResponder *)target).nextResponder;
        
        if ([target isKindOfClass:[UIViewController class]]) {
            return target;
        }
    }
    
    return nil;
}


@end
