//
//  Person.m
//  [18]. kvc_demo
//
//  Created by Sun Shijie on 2017/5/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "Person.h"
#import "Company.h"
#import "Product.h"

@interface Person()

@property (nonatomic, copy) NSString *address;
@property (nonatomic, strong) Company *company;

@end

@implementation Person
{
    NSString *_country;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        
        _company = [[Company alloc] init];
        _products = @[[[Product alloc] initWithPrice:@"200"],[[Product alloc] initWithPrice:@"300"],[[Product alloc] initWithPrice:@"400"]];
                
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"Cannot set anything for this key. The key %@ is not valid.", key);
    if ([key isEqualToString:@"_country1"]) {
        [self setValue:@"unknown country" forKey:@"_country"];
    }
}

- (id)valueForUndefinedKey:(NSString *)key {
    
        if ([key isEqualToString:@"_country1"]) {
            return @"unknown country";
        }else{
            return @"";
        }
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"name"])
        [self setValue:@"unkown name" forKey:@"name"];
    else
        [super setNilValueForKey:key];
}



@end
