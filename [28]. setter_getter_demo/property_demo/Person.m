//
//  Person.m
//  property_demo
//
//  Created by Sun Shijie on 2017/8/9.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "Person.h"

@interface Person()



@end


@implementation Person

@synthesize name=_name;

- (void)setName:(NSString *)name
{
    _name = name;
}

- (NSString *)name
{
    return self.name;
}

@end
