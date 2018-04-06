//
//  ViewController.m
//  static_demo
//
//  Created by Sun Shijie on 2018/4/7.
//  Copyright © 2018年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

static NSString *name = @"123";
NSString *const address = @"abc";


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@",name);
    name = @"456";
    NSLog(@"%@",name);
    
    NSLog(@"%@",address);
//    address = @"edf"; //can not be changed
    NSLog(@"%@",address);
    
    NSLog(@"%@",standard);
//    standard = @"not good"; //can not be changed
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
