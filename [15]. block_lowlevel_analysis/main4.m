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
    
    void (^blk0)(void) = ^{
        val = 12;
    };
    
    void (^blk1)(void) = ^{
        val = 13;
    };
    return 0;
}
