//
//  TestView.m
//  init_demo
//
//  Created by Sun Shijie on 2017/2/23.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"调用了 init");
    };
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"调用了 initWithFrame:");
    }
    return self;
}

@end
