//
//  Product.h
//  [18]. kvc_demo
//
//  Created by Sun Shijie on 2017/5/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *price;

- (instancetype)initWithPrice:(NSString *)price;

@end
