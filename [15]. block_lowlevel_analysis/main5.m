//
//  ViewController.m
//  block_demo
//
//  Created by Sun Shijie on 2017/3/20.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>

void (^blk)(void) = ^{printf("Global Block\n");};

int main()
{
    blk();
}
