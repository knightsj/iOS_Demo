//
//  ViewController.m
//  private_method
//
//  Created by Sun Shijie on 2017/6/20.
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
    Person *p = [[Person alloc] init];
    [p eat];
    [p performSelector:@selector(sleep)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
