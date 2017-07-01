//
//  ViewController.m
//  nsstring_demo
//
//  Created by Sun Shijie on 2017/6/16.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *constString = @"123";//0x101c89068
    NSLog(@"%p",constString);
    
    NSString *stackString = [NSString stringWithFormat:@"123"];
    NSLog(@"%p",stackString);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
