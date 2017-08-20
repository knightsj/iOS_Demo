//
//  SuperView.m
//  touch_demo
//
//  Created by Sun Shijie on 2017/7/25.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SuperView.h"

@implementation SuperView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"父视图被点击了");
}

@end
