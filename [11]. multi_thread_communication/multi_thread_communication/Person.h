//
//  Person.h
//  multi_thread_communication
//
//  Created by Sun Shijie on 2017/2/28.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Card;

@interface Person : NSObject

@property (nonatomic, strong, readonly) NSArray *cards;

- (void)addCard:(Card *)card;
- (void)printAllCards;

@end
