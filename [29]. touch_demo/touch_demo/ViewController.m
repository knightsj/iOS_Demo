//
//  ViewController.m
//  touch_demo
//
//  Created by Sun Shijie on 2017/7/25.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "SubView.h"
#import "SuperView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SuperView *superView;
@property (weak, nonatomic) IBOutlet SubView *subView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
