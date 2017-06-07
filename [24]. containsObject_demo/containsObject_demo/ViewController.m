//
//  ViewController.m
//  containsObject_demo
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
    
    NSString *string1 = @"123";
    NSArray *array = @[string1,@"4234",@"435345"];
    
    
    NSString *string2 = [NSString stringWithFormat:@"12"];
    NSLog(@"%p %p",string1,string2);
    
    NSLog(@"%ld %ld",string1.hash,string2.hash);
    
    if ([array indexOfObject:string2] == NSNotFound) {
        NSLog(@"不包含");
    }else{
        NSLog(@"包含");
    }
    
    if ([array containsObject:string2]) {
        NSLog(@"包含");
    }else{
        NSLog(@"不包含");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
