//
//  ViewController.m
//  method_swizzling
//
//  Created by Sun Shijie on 2017/4/26.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image_1 = [UIImage imageNamed:@""];
    UIImage *image_2 = [UIImage imageNamed:@"emoji"];
    
    NSLog(@"[UIImage class] : %@",[UIImage class]);
    NSLog(@"[image class] : %@",[image_2 class]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
