//
//  ViewController.m
//  selector_demo
//
//  Created by Sun Shijie on 2017/6/21.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *person = [[Person alloc] init];
    [person nameWithAge:1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
