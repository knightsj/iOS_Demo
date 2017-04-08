//
//  ViewController.m
//  block_demo
//
//  Created by Sun Shijie on 2017/3/20.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^blk_t)();

int main()
{
    __block id obj = [[NSObject alloc] init];
    
    blk_t blk = ^{
        
        NSLog(@"%@",obj);
    
    };
    
    blk();
    
}
