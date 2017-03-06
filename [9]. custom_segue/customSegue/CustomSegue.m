//
//  CustomSegue.m
//  customSegue
//
//  Created by Sun Shijie on 2017/2/27.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue

- (void)perform
{
    UIViewController *fromVC = (UIViewController *)self.sourceViewController;
    UIViewController *toVC = (UIViewController*)self.destinationViewController;
    
    //获取第一个页面初始状态的frame
    CGRect f = fromVC.view.frame;
    CGRect originalSourceRect = fromVC.view.frame;
    
    f.origin.y = f.size.height;
    
     //令第二个页面在开始的时候位于屏幕底部
     toVC.view.frame = f;
     toVC.view.alpha = 0.0f;
    [[fromVC.view superview] addSubview:toVC.view];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        //令第二个页面的frame等于第一个页面初始状态的frame（满屏）
        toVC.view.frame = originalSourceRect;
        toVC.view.alpha = 1.0f;
        
    } completion:^(BOOL finished) {
        
        [toVC.view removeFromSuperview];
         fromVC.view.alpha = 1.0f;
        [fromVC.navigationController pushViewController:toVC animated:NO];
        
    }];
}

@end
