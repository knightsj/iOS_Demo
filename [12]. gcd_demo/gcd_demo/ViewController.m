//
//  ViewController.m
//  gcd_demo
//
//  Created by Sun Shijie on 2017/3/6.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    [self serialQueue];
//    [self concurrentQueue];
    [self multiSerialQueue_1];
//    [self setTargetQueue_3];
//    [self dispatch_after];
//    [self dispatch_group];
//    [self dispatch_wait_3];
//    [self dispatch_barrier];
//    [self dispatch_sync_4];
//    [self dispatch_apply_3];
//    [self dispatch_once_1];
}

//一次的代码
- (void)dispatch_once_1
{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (NSInteger index = 0; index < 5; index++) {
        
        dispatch_async(queue, ^{
            [self onceCode];
        });
    }
}

- (void)onceCode
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"只执行一次的代码");
    });
}

//简单重复调用
- (void)dispatch_apply_1
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@"%ld",index);
    });
    NSLog(@"完毕");
}

//遍历数组
- (void)dispatch_apply_2
{
    NSArray *array = @[@1,@10,@43,@13,@33];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply([array count], queue, ^(size_t index) {
        NSLog(@"%@",array[index]);
    });
    NSLog(@"完毕");
}

//异步遍历
- (void)dispatch_apply_3
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        NSArray *array = @[@1,@10,@43,@13,@33];
        __block  NSInteger sum = 0;
    
        dispatch_apply([array count], queue, ^(size_t index) {
            NSNumber *number = array[index];
            NSInteger num = [number integerValue];
            sum += num;
        });
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //回到主线程，拿到总和
            NSLog(@"完毕");
            NSLog(@"%ld",sum);
        });
    });
}

//同步阻塞
- (void)dispatch_sync_1
{
    //同步处理
    NSLog(@"%@",[NSThread currentThread]);
    NSLog(@"同步处理开始");
    
    __block NSInteger num = 0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(queue, ^{
        
        for (NSInteger i = 0; i< 1000000000; i ++) {
            num++;
        }
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"同步处理完毕");
    });
    NSLog(@"%ld",num);
    NSLog(@"%@",[NSThread currentThread]);
}

//异步
- (void)dispatch_sync_2
{
    //异步处理
    NSLog(@"%@",[NSThread currentThread]);
    NSLog(@"异步处理开始");
    
    __block NSInteger num = 0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        for (NSInteger i = 0; i< 1000000000; i ++) {
            num++;
        }
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"异步处理完毕");
    });
    NSLog(@"%ld",num);
    NSLog(@"%@",[NSThread currentThread]);
}

//死锁1
- (void)dispatch_sync_3
{
    NSLog(@"任务1");
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        
        NSLog(@"任务2");
    });
    NSLog(@"任务3");
}

//死锁2
- (void)dispatch_sync_4
{
    NSLog(@"任务1");
    dispatch_queue_t queue = dispatch_queue_create("dead lock queue", NULL);
    dispatch_async(queue, ^{
        NSLog(@"任务2");
        dispatch_sync(queue, ^{
            
            NSLog(@"任务3");
        });
        
    });
    NSLog(@"任务4");
}

//开会签合同例子
- (void)dispatch_barrier
{
    dispatch_queue_t meetingQueue = dispatch_queue_create("com.meeting.queue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"总裁查看合同");
    });
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"董事1查看合同");
    });
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"董事2查看合同");
    });
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"董事3查看合同");
    });
    
    dispatch_barrier_async(meetingQueue, ^{
        NSLog(@"总裁签字");
    });
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"总裁审核合同");
    });
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"董事1审核合同");
    });
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"董事2审核合同");
    });
    
    dispatch_async(meetingQueue, ^{
        NSLog(@"董事3审核合同");
    });
    
}

//没有超时
- (void)dispatch_wait_1
{
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (NSInteger index = 0; index < 5; index ++) {
        dispatch_group_async(group, queue, ^{
            for (NSInteger i = 0; i< 100000000; i ++) {
                
            }
            NSLog(@"任务%ld",index);
        });
    }
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC);
    long result = dispatch_group_wait(group, time);
    if (result == 0) {
        
        NSLog(@"group内部的任务全部结束");
        
    }else{
        
        NSLog(@"虽然过了超时时间，group还有任务没有完成");
    }
    
}

//超时
- (void)dispatch_wait_2
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (NSInteger index = 0; index < 5; index ++) {
        dispatch_group_async(group, queue, ^{
            for (NSInteger i = 0; i< 1000000000; i ++) {
                
            }
            NSLog(@"任务%ld",index);
        });
    }
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC);
    long result = dispatch_group_wait(group, time);
    if (result == 0) {
        
        NSLog(@"group内部的任务全部结束");
        
    }else{
        
        NSLog(@"虽然过了超时时间，group还有任务没有完成");
    }
    
}

//超时时间为：DISPATCH_TIME_NOW：无超时时间
- (void)dispatch_wait_3
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    for (NSInteger index = 0; index < 5; index ++) {
        dispatch_group_async(group, queue, ^{
            for (NSInteger i = 0; i< 1000000000; i ++) {
                
            }
            NSLog(@"任务%ld",index);
        });
    }
    
    long result = dispatch_group_wait(group, DISPATCH_TIME_NOW);
    if (result == 0) {
        
        NSLog(@"group内部的任务全部结束");
        
    }else{
        
        NSLog(@"虽然过了超时时间，group还有任务没有完成");
    }
    
}

//group
- (void)dispatch_group
{
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_notify(group, queue, ^{
        NSLog(@"最后的任务");
    });
    
    for (NSInteger index = 0; index < 5; index ++) {
        dispatch_group_async(group, queue, ^{
            NSLog(@"任务%ld",index);
        });
    }
    
    
}

//推迟追加队列
- (void)dispatch_after
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"三秒之后追加到队列");
    });
}

//target
- (void)setTargetQueue_1
{
    //需求：生成一个后台的串行队列
    dispatch_queue_t queue = dispatch_queue_create("queue", NULL);
    dispatch_queue_t bgQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    //第一个参数：需要改变优先级的队列；
    //第二个参数：目标队列
    dispatch_set_target_queue(queue, bgQueue);
}


- (void)setTargetQueue_2
{
    //多个串行队列，没有设置target queue
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger index = 0; index < 5; index ++) {
        
        dispatch_queue_t serial_queue = dispatch_queue_create("serial_queue", NULL);
        [array addObject:serial_queue];
    }
    
    [array enumerateObjectsUsingBlock:^(dispatch_queue_t queue, NSUInteger idx, BOOL * _Nonnull stop) {
        
        dispatch_async(queue, ^{
            NSLog(@"任务%ld",idx);
        });
    }];
    
}

- (void)setTargetQueue_3
{
    //多个串行队列，设置了target queue
    NSMutableArray *array = [NSMutableArray array];
    dispatch_queue_t serial_queue_target = dispatch_queue_create("queue_target", NULL);

    for (NSInteger index = 0; index < 5; index ++) {
        
        dispatch_queue_t serial_queue = dispatch_queue_create("serial_queue", NULL);
        dispatch_set_target_queue(serial_queue, serial_queue_target);
        [array addObject:serial_queue];
    }
    
    [array enumerateObjectsUsingBlock:^(dispatch_queue_t queue, NSUInteger idx, BOOL * _Nonnull stop) {
        
        dispatch_async(queue, ^{
            NSLog(@"任务%ld",idx);
        });
    }];
    
}

//多个串行队列队列，多个线程
- (void)multiSerialQueue
{
    for (NSInteger index = 0; index < 10; index ++) {
        
        dispatch_queue_t queue = dispatch_queue_create("different serial queue", NULL);
        dispatch_async(queue, ^{
            NSLog(@"serial queue index : %@",[NSThread currentThread]);
        });
    }
}

//dispatch_sync 不开启线程 ； dispatch_async 开启线程
- (void)multiSerialQueue_1
{
    for (NSInteger index = 0; index < 20; index ++) {
        
        dispatch_queue_t queue = dispatch_queue_create("different serial queue", NULL);
        
        if (index%2 == 0) {
            dispatch_sync(queue, ^{
                NSLog(@"serial queue index : %@",[NSThread currentThread]);
            });
        }else{
            dispatch_async(queue, ^{
                NSLog(@"serial queue index : %@",[NSThread currentThread]);
            });
        }
        
    }
}


//并行
- (void)concurrentQueue
{
    dispatch_queue_t queue = dispatch_queue_create("concurrent queue", DISPATCH_QUEUE_CONCURRENT);
    for (NSInteger index = 0; index < 10; index ++) {
        dispatch_async(queue, ^{
            NSLog(@"task index %ld in concurrent queue",index);
        });
    }
}

//串行
- (void)serialQueue
{
    dispatch_queue_t queue = dispatch_queue_create("serial queue", DISPATCH_QUEUE_SERIAL);
    for (NSInteger index = 0; index < 10; index ++) {
        dispatch_async(queue, ^{
            NSLog(@"task index %ld in serial queue",index);
        });
    }
}


@end
