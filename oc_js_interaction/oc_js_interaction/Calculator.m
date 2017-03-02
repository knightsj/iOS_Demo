//
//  Calculator.m
//  oc_js_interaction
//
//  Created by Sun Shijie on 2017/3/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

@synthesize sum = _sum;
@synthesize subtraction = _subtraction;

//重写setter方法
- (void)setSum:(NSInteger)sum
{
    if (sum !=_sum) {
        _sum = sum;
    }
}

- (void)setSubtraction:(NSInteger)subtraction
{
    if (subtraction!=_subtraction) {
        _subtraction = subtraction;
    }
}

//实现协议方法
- (NSInteger)a:(NSInteger)a addB:(NSInteger)b
{
    return a+b;
}

- (NSInteger)a:(NSInteger)a minusB:(NSInteger)b
{
    return a-b;
}

@end
