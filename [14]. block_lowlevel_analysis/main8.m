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
        blk = [^(id object){
            [array addObject:object];
            NSLog(@"array count = %ld",[array count]);
            
        } copy];
    }
    
    blk([NSObject new]);
    blk([NSObject new]);
    blk([NSObject new]);
    
}
