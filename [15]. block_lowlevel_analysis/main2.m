//
//  ViewController.m
//  block_demo
//
//  Created by Sun Shijie on 2017/3/20.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>

int global_val = 1;//全局变量
static int static_global_val = 2;//全局静态变量

int main()
{
    static int static_val = 3;//静态变量
    
    void (^blk)(void) = ^{
        global_val *=1;
        static_global_val *=2;
        static_val *=3;
    };
    return 0;
}
