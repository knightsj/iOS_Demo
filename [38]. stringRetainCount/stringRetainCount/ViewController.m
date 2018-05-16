//
//  ViewController.m
//  stringRetainCount
//
//  Created by Sun Shijie on 2018/5/16.
//  Copyright © 2018年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString * string1 = @"123";
    NSLog(@"string1: content:%@  address:%p retaincount:%lu",string1,string1,[string1 retainCount]);
    
    NSString * string2 = @"123";
    NSLog(@"string2: content:%@  address:%p retaincount:%lu",string2,string2,[string2 retainCount]);
    
    NSString * string3 = [NSString stringWithString:@"123"];
    NSLog(@"string3: content:%@  address:%p retaincount:%lu",string3,string3,[string3 retainCount]);
    
    NSString * string4 = [NSString stringWithFormat:@"123"];
    NSLog(@"string4: content:%@  address:%p retaincount:%lu",string4,string4,[string4 retainCount]);
    
    NSString * string5 = @"456";
    NSLog(@"string5: content:%@  address:%p retaincount:%lu",string5,string5,[string5 retainCount]);
    
    NSString * string6 = [NSString stringWithString:@"678"];
    NSLog(@"string6: content:%@  address:%p retaincount:%lu",string6,string6,[string6 retainCount]);
    
    NSString * string7 = [NSString stringWithFormat:@"890"];
    NSLog(@"string7: content:%@  address:%p retaincount:%lu",string7,string7,[string7 retainCount]);
    
    NSString * string8 = [[NSString alloc] initWithString:@"aaa"];
    NSLog(@"string8: content:%@  address:%p retaincount:%lu",string8,string8,[string8 retainCount]);
    
    NSString * string9 = [[NSString alloc] initWithFormat:@"水电费"];
    NSLog(@"string9: content:%@  address:%p retaincount:%lu",string9,string9,[string9 retainCount]);
    
    NSString * string10 = [[NSString alloc] initWithFormat:@"sss"];
    NSLog(@"string10: content:%@  address:%p retaincount:%lu",string10,string10,[string10 retainCount]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
