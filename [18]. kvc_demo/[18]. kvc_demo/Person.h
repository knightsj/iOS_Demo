//
//  Person.h
//  [18]. kvc_demo
//
//  Created by Sun Shijie on 2017/5/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *_sex;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger money;
@property (nonatomic, copy) NSArray *friends;
@property (nonatomic, copy) NSArray *products;

@end
