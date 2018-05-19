//
//  ViewController.m
//  synthesize
//
//  Created by Sun Shijie on 2018/5/19.
//  Copyright © 2018年 Shijie. All rights reserved.
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
    p.name = @"sdfsdf";
    [p sayName];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
