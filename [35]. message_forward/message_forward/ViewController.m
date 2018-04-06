//
//  ViewController.m
//  message_forward
//
//  Created by Sun Shijie on 2018/3/12.
//  Copyright © 2018年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "GreetingClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    GreetingClass *instance = [[GreetingClass alloc] init];
    [instance hello];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
