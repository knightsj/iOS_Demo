//
//  ViewController.m
//  block_demo
//
//  Created by Sun Shijie on 2017/3/20.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>

int main()
{
    void (^blk)(void) = ^{printf("Global Block\n");};
    blk();
}
