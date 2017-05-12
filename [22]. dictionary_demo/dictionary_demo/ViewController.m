//
//  ViewController.m
//  dictionary_demo
//
//  Created by Sun Shijie on 2017/5/12.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dict = @{@"fsdf":@"sdfsdf",@"sdfsdf":@"342342"};
    NSMutableDictionary *dictm = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSLog(@"%@",dictm);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
