//
//  ViewController.m
//  class_addMethod_demo
//
//  Created by Sun Shijie on 2017/4/28.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Car+Fly.h"

@interface ViewController ()

@property (nonatomic) Car *car;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.car = [[Car alloc] init];
    [self.car run];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //没有fly这个方法
    [self.car performSelector:@selector(fly)];
}


@end
