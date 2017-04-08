//
//  ViewController.m
//  block_demo
//
//  Created by Sun Shijie on 2017/3/20.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^blk_t)(id object);

int main()
{
    blk_t blk;
    {
        id array = [NSMutableArray new];
        id __weak array2 = array;
        blk = ^(id object){
            [array2 addObject:object];
            NSLog(@"array count = %ld",[array2 count]);
        };
    }
    
    blk([NSObject new]);
    blk([NSObject new]);
    blk([NSObject new]);
    
}
