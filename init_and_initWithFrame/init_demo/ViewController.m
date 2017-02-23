//
//  ViewController.m
//  init_demo
//
//  Created by Sun Shijie on 2017/2/23.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    TestView *view = [[TestView alloc] init];
    view.frame = CGRectMake(100, 100, 100, 100);
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}

@end
