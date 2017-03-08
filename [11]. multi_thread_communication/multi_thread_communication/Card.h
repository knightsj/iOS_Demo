//
//  Card.h
//  multi_thread_communication
//
//  Created by Sun Shijie on 2017/2/28.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSThread *thread;
@property (nonatomic, assign) NSUInteger index;

- (instancetype)initWithIndex:(NSUInteger)index;

@end
