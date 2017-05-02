//
//  ViewController.m
//  [18]. kvc_demo
//
//  Created by Sun Shijie on 2017/5/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Friend.h"

//- (id)valueForKey:(NSString *)key;
//- (void)setValue:(id)value forKey:(NSString *)key;

//kvc的缺点
//因为KVC需要解析字符串来计算你需要的答案，因此速度比较慢。另外编译器无法对它进行错误检查

//取值 和 设值 都要使用对象，即使属性是基本类型
//当使用-valueForKey:时，它自动将这些标量值从这些对象中取出。仅KVC具有这种自动包装功能，常规方法调用和属性语法不具备该功能。
//如果在调用-setValue:forKey:之中设置一个标量值，需要将他包装起来。
//比如[car setValue: [NSNumber numberWithFloat: 25062.4] forKey: @”mileage”];
//属性mileage是标量（float类型），所以要用NSNumber包装起来。

//首先查找属性name的setter方法-setName，并使用参数@”Harold”调用它。如果不存在setter方法，它将在类中产找名为name或_name的实例变量，然后为它赋值。

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    Person *person = [[Person alloc] init];
    
    //set public ivar
    [person setValue:@"Peter" forKey:@"name"];
    NSLog(@"name:%@",person.name);
    
    //set public _ivar
    [person setValue:@"male" forKey:@"_sex"];
    NSLog(@"sex:%@",[person valueForKey:@"_sex"]);
    
    //set privacy ivar
    [person setValue:@"centry road" forKey:@"address"];
    NSLog(@"address: %@",[person valueForKey:@"address"]);
    
    //set privacy _ivar
    [person setValue:@"China" forKey:@"_country"];
    NSLog(@"country: %@",[person valueForKey:@"_country"]);
    
    //set primary type
    [person setValue:[NSNumber numberWithInteger:12] forKey:@"money"];
    NSLog(@"set money: %ld",person.money);
    NSLog(@"query money: %@",[person valueForKey:@"money"]);
    
    //set keypath
    [person setValue:@"Apple" forKeyPath:@"company.name"];
    NSLog(@"name of company: %@",[person valueForKeyPath:@"company.name"]);
    
    //collection
    person.friends = @[@"Jim",@"Brunce",@"Nancy"];
    NSNumber *count = [person valueForKeyPath: @"friends.@count"];
    NSLog(@"number of friend: %ld", [count integerValue]);
    
    //start from person
    NSNumber *avg = [person valueForKeyPath: @"products.@avg.price"];
    NSLog(@"avg of products: %ld", [avg integerValue]);
    
    NSNumber *max = [person valueForKeyPath: @"products.@max.price"];
    NSLog(@"max of products: %ld", [max integerValue]);
    
    NSNumber *min = [person valueForKeyPath: @"products.@min.price"];
    NSLog(@"min of products: %ld", [min integerValue]);
    
    NSNumber *sum = [person valueForKeyPath: @"products.@sum.price"];
    NSLog(@"sum of products: %ld", [sum integerValue]);
    
    //start from products
    NSArray *products = person.products;
    
    NSNumber *avg1 = [products valueForKeyPath: @"@avg.price"];
    NSLog(@"avg1 of products: %ld", [avg1 integerValue]);
    
    NSNumber *max1 = [products valueForKeyPath: @"@max.price"];
    NSLog(@"max1 of products: %ld", [max1 integerValue]);
    
    NSNumber *min1 = [products valueForKeyPath: @"@min.price"];
    NSLog(@"min1 of products: %ld", [min1 integerValue]);
    
    NSNumber *sum1 = [products valueForKeyPath: @"@sum.price"];
    NSLog(@"sum1 of products: %ld", [sum1 integerValue]);


    //model and dictionary
    NSDictionary *dict = @{
                           @"name":@"Rose",
                           @"sex":@"female"
                           };
    
    Friend *friend = [[Friend alloc] init];
    [friend setValuesForKeysWithDictionary:dict];
    NSLog(@"%@  %@",friend.name, friend.sex);
    
    NSDictionary *dict1 = [friend dictionaryWithValuesForKeys:[dict allKeys]];
    NSLog(@"%@",dict1);
    
    //error : undefined key
    [person setValue:@"China" forKey:@"_country1"];
    NSLog(@"country:%@",[person valueForKey:@"_country1"]);
    
    
}


@end
