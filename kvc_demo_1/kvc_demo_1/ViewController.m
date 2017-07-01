//
//  ViewController.m
//  kvc_demo_1
//
//  Created by Sun Shijie on 2017/6/19.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()




@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    Person *person = [[Person alloc] init];
//    id person = [[Person alloc] init];
    
    //只有实例变量 公开的实例变量
    [person setValue:@"china" forKey:@"_country"];
    
    //只有实例变量 私有的实例变量
    [person setValue:@"male" forKey:@"_sex"];
    
    //走了访问器 公开属性
    [person setValue:@"jack" forKey:@"name"];
    NSLog(@"%@",person);
    
    //走了访问器 私有属性
    [person setValue:@"chinaBank" forKey:@"bankName"];
    NSLog(@"%@",person);
    
    //没走访问器
    [person setValue:@"bruce" forKey:@"_name"];
    NSLog(@"%@",person);
    
    [person setValue:@"lalala" forKey:@"keyNotExists"];
    
    [person setValue:@"lalala1" forKey:@"keyNotExists1"];
    
    [person valueForKey:@"school"];
    
    
    //取值
    //取不到值
    NSString *value = [person valueForKey:@"abc"];
    NSLog(@"%@",value);
    
    
    
    //包装非对象
    //非对象（整型，布尔型，实数）：NSNumber
    [person setValue:[NSNumber numberWithInteger:12] forKey:@"age"];
    NSLog(@"%@",person);
    
    id age = [person valueForKey:@"age"];//__NSCFNumber
    NSLog(@"%@",age);
    
    //非对象（结构体）：NSValue
    [person setValue:[NSValue valueWithCGPoint:CGPointMake(1, 1)] forUndefinedKey:@"point"];
    id point = [person valueForKey:@"point"];//NSConcreteValue
    NSLog(@"%@",point);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
