//
//  Product.m
//  [18]. kvc_demo
//
//  Created by Sun Shijie on 2017/5/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "Product.h"

@implementation Product

- (instancetype)initWithPrice:(NSString *)price
{
    self = [super init];
    if (self) {
        _price = price;
    }
    return self;
}

@end
