//
//  ViewController.m
//  multi_thread_communication
//
//  Created by Sun Shijie on 2017/2/28.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Card.h"
#import <Foundation/NSNotification.h>
#import <Foundation/Foundation.h>
#import <Foundation/NSRunLoop.h>



@interface ViewController ()<NSMachPortDelegate>

@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) NSThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
     self.person = [[Person alloc] init];
}


#pragma mark- performSel_1
- (void)performSel_1
{
    [self performSelectorInBackground:@selector(makeCard1) withObject:nil];
}

- (void)makeCard1
{
    NSLog(@"制作卡片：%@",[NSThread currentThread]);
    Card *card = [[Card alloc] initWithIndex:0];
    [self performSelectorOnMainThread:@selector(addCard:) withObject:card waitUntilDone:NO];
}

- (void)addCard:(Card *)card
{
    NSLog(@"添加卡片：%@",[NSThread currentThread]);
    [self.person addCard:card];
    [self.person printAllCards];
}


#pragma mark- performSel_2
- (void)performSel_2
{
    [self performSelectorInBackground:@selector(makeCard2) withObject:nil];
}

- (void)makeCard2
{
    NSLog(@"制作卡片：%@",[NSThread currentThread]);
    Card *card = [[Card alloc] initWithIndex:0];
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(fixCard:) object:card];
    [self.thread start];
}

- (void)fixCard:(Card *)card
{
    NSLog(@"修改卡片：%@",[NSThread currentThread]);
    card.index = 1;
    [self performSelectorOnMainThread:@selector(addCard:) withObject:card waitUntilDone:NO];
}

#pragma mark- gcd_1
- (void)gcd_1
{
    //开启一个全局队列的子线程
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        //异步获得card1对象
        Card *card = [[Card alloc] initWithIndex:0];
        
        //将block交给主队列
        dispatch_async(dispatch_get_main_queue(), ^{
            
            //拿到card1
            [self.person addCard:card];
            [self.person printAllCards];
        });        
    });
}

#pragma mark- gcd_2
- (void)gcd_2
{
    //队列组
    dispatch_group_t group = dispatch_group_create();
    
    //并行队列，无序执行
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    __block Card *card1;
    __block Card *card2;
    __block Card *card3;
    
    dispatch_group_async(group, queue, ^{
        Card *card = [[Card alloc] initWithIndex:0];
        card1 = card;
    });
    
    dispatch_group_async(group, queue, ^{
        Card *card = [[Card alloc] initWithIndex:1];
        card2 = card;
    });
    
    dispatch_group_async(group, queue, ^{
        Card *card = [[Card alloc] initWithIndex:2];
        card3 = card;
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{   // 在主线程刷新数据
        
        [self.person addCard:card1];
        [self.person addCard:card2];
        [self.person addCard:card3];
        
        [self.person printAllCards];
        
    });

}

#pragma mark- gcd_3
- (void)gcd_3
{
    //队列组
    dispatch_group_t group = dispatch_group_create();
    //串行队列，顺序执行
    dispatch_queue_t queue = dispatch_queue_create("serial queue", DISPATCH_QUEUE_SERIAL);

    __block Card *card1;
    __block Card *card2;
    __block Card *card3;
    
    dispatch_group_async(group, queue, ^{
        Card *card = [[Card alloc] initWithIndex:0];
        card1 = card;
    });
    
    dispatch_group_async(group, queue, ^{
        Card *card = [[Card alloc] initWithIndex:1];
        card2 = card;
    });
    
    dispatch_group_async(group, queue, ^{
        Card *card = [[Card alloc] initWithIndex:2];
        card3 = card;
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{   // 在主线程刷新数据
        
        [self.person addCard:card1];
        [self.person addCard:card2];
        [self.person addCard:card3];

        [self.person printAllCards];
        
    });
}

#pragma mark- operation_1
- (void)operation_1
{
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    __block Card *card1;
    __block Card *card2;
    __block Card *card3;
    
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        Card *card = [[Card alloc] initWithIndex:0];
        card1 = card;
    }];
    
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        Card *card = [[Card alloc] initWithIndex:1];
        card2 = card;
    }];
    
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        Card *card = [[Card alloc] initWithIndex:2];
        card3 = card;
    }];
    
    //将卡片添加到数组
    NSBlockOperation *finialOperation = [NSBlockOperation blockOperationWithBlock:^{
        
        [self.person addCard:card1];
        [self.person addCard:card2];
        [self.person addCard:card3];
        
        //在主队列添加block
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self.person printAllCards];
        }];
    }];
    
    //添加依赖：只有operation1，2，3都执行完了才能执行finialOperation
    [finialOperation addDependency:operation1];
    [finialOperation addDependency:operation2];
    [finialOperation addDependency:operation3];
    
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:operation3];
    [queue addOperation:finialOperation];
    
}

@end
