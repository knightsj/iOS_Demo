//
//  ViewController.m
//  equal_object_demo
//
//  Created by Sun Shijie on 2017/6/7.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
//    Person *p1 = [[Person alloc] init];
//    Person *p2 = [[Person alloc] init];
//    Person *p3 = [[Person alloc] init];
//    Person *p4 = [[Person alloc] init];
//    
//    NSLog(@"%p   %p",p1,p2);
//    NSLog(@"%ld   %ld",p1.hash,p2.hash);
//    
//    p1.name = @"123";
//    p2.name = @"123";
//    
//    NSLog(@"%p   %p",p1,p2);
//    NSLog(@"%ld   %ld",p1.hash,p2.hash);
//    
//    NSArray *array = @[p1,p3,p4];
//    
//    if ([array containsObject:p1]) {
//        NSLog(@"包含");
//    }else{
//        NSLog(@"不包含");
//    }
//    
//    if ([array indexOfObject:p1] == NSNotFound) {
//        NSLog(@"不包含");
//    }else{
//        NSLog(@"包含");
//    }
    
    UIView *p1 = [[UIView alloc] init];
    UIView *p2 = [[UIView alloc] init];
    UIView *p3 = [[UIView alloc] init];
    UIView *p4 = [[UIView alloc] init];
    
    NSLog(@"%p   %p",p1,p2);
    NSLog(@"%ld   %ld",p1.hash,p2.hash);
    
    p1.name = @"123";
    p2.name = @"123";
    
    NSLog(@"%p   %p",p1,p2);
    NSLog(@"%ld   %ld",p1.hash,p2.hash);
    
    NSArray *array = @[p1,p3,p4];
    
    if ([array containsObject:p1]) {
        NSLog(@"包含");
    }else{
        NSLog(@"不包含");
    }
    
    if ([array indexOfObject:p1] == NSNotFound) {
        NSLog(@"不包含");
    }else{
        NSLog(@"包含");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
