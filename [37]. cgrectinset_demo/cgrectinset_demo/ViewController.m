//
//  ViewController.m
//  cgrectinset_demo
//
//  Created by Sun Shijie on 2018/4/8.
//  Copyright © 2018年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self p_CGRectInset];
    [self p_CGRectOffset];
    
}

- (void)p_CGRectInset{
    
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    NSLog(@"%@",[NSValue valueWithCGRect:view1.frame]);
    //{{100, 100}, {100, 100}}
    
    UIView * view2 = [UIView new];
    view2.frame = CGRectInset(view1.frame, 30, 30);
    view2.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view2];
    NSLog(@"%@",[NSValue valueWithCGRect:view2.frame]);
    //{{130, 130}, {40, 40}}
}

- (void)p_CGRectOffset{
    
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    NSLog(@"%@",[NSValue valueWithCGRect:view1.frame]);
    //{{100, 100}, {100, 100}}
    
    UIView * view2 = [UIView new];
    view2.frame = CGRectOffset(view1.frame, 30, 30);
    view2.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view2];
    NSLog(@"%@",[NSValue valueWithCGRect:view2.frame]);
    //{{130, 130}, {100, 100}}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
