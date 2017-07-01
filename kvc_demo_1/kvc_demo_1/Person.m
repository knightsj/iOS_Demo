//
//  Person.m
//  kvc_demo_1
//
//  Created by Sun Shijie on 2017/6/19.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "Person.h"

@interface Person()

@property (nonatomic, copy) NSString *bankName;

@end

@implementation Person
{
    NSString *_sex;
}

- (void)setBankName:(NSString *)bankName
{
    _bankName = bankName;
}


//
//+ (BOOL)accessInstanceVariablesDirectly
//{
//    return YES;//如果设为NO，就不能直接访问实例变量；访问的话，就会调用- (void)setValue:(id)value forUndefinedKey:(NSString *)key
//    
//    //默认是YES
//}


- (void)setName:(NSString *)name
{
    NSLog(@"Access Name");
    _name = name;
}




- (NSString *)email
{
    NSLog(@"Access Email:");
    return _email;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"没有找到key：%@",key);
}


//- (id)valueForUndefinedKey:(NSString *)key
//{
//    if ([key isEqualToString:@"school"]) {
//        NSLog(@"there is no key : %@",key);
//    }else{
//        NSLog(@"there is no such key");
//    }
//    return nil;
//}

- (NSString *)description
{
    return [NSString stringWithFormat:@"sex:%@ name:%@ country:%@ bankName:%@ email:%@ age:%ld point:%@",_sex,_name,_country,_bankName,_email,_age,NSStringFromCGPoint(_point)];
}

@end
