//
//  ViewController.m
//  associate_object
//
//  Created by Sun Shijie on 2017/2/27.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Person+Job.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *p = [[Person alloc]init];
    p.salary = @"12k";
    NSLog(@"薪水是：%@",p.salary);
}

@end
