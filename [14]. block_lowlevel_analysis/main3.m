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
    __block int val = 10;
    
    void (^blk)(void) = ^{
        val = 1;
    };
    return 0;
}
