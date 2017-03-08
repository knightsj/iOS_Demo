//
//  Person.m
//  multi_thread_communication
//
//  Created by Sun Shijie on 2017/2/28.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "Person.h"
#import "Card.h"

@interface Person()

@property (nonatomic, strong, readwrite) NSArray *cards;

@end

@implementation Person
{
    NSMutableArray *_cardsM;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cardsM = [NSMutableArray array];
        _cards = _cardsM.copy;
    }
    return self;
}


- (void)addCard:(Card *)card
{
    [_cardsM addObject:card];
     _cards = _cardsM.copy;
}

- (void)printAllCards
{
    NSLog(@"持有的卡片：\n");
    [_cards enumerateObjectsUsingBlock:^(Card *card, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"卡片%lu：%@ | 内存地址：%p \n",card.index,card.thread,card);
    }];
}

@end
