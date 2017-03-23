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
    int dmy = 256;
    int val = 10;
    
    const char *fmt = "var = %d\n";
    
    void (^blk)(void) = ^{
        printf(fmt,val);
    };
    
    val = 2;
    fmt = "These values were changed. var = %d\n";
    
    blk();
    
    return 0;
}
