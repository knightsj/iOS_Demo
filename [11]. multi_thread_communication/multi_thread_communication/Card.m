//
//  Card.m
//  multi_thread_communication
//
//  Created by Sun Shijie on 2017/2/28.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "Card.h"

@implementation Card

- (instancetype)initWithIndex:(NSUInteger)index
{
    self = [super init];
    if (self) {
        for (NSInteger index = 0; index < 1000; index++) {
            
        }
        self.thread = [NSThread currentThread];
        self.index = index;
    }
    return self;
}



@end
