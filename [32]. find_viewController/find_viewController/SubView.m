//
//  SubView.m
//  find_viewController
//
//  Created by Sun Shijie on 2018/4/3.
//  Copyright © 2018年 Shijie. All rights reserved.
//

#import "SubView.h"

@implementation SubView

- (UIViewController*)viewController{
    
    for (UIView* next = [self superview]; next; next = next.superview){
        
        UIResponder* nextResponder = [next nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]]){
            
            return (UIViewController*)nextResponder;
            
        }
    }
    
    return nil;
    
}

- (UIViewController *)belongVC
{
    
    id target = self;
    
    while (target) {
        
        target = ((UIResponder *)target).nextResponder;
        
        if ([target isKindOfClass:[UIViewController class]]) {
            break;
        }
    }
    
    return target;
}

@end
