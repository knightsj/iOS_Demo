//
//  ViewController.m
//  nsurl_demo
//
//  Created by Sun Shijie on 2017/6/26.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    NSString *baseUrl = @"www.baidu.com";
    NSURL *url = [NSURL URLWithString:baseUrl];
    //如果没有/则添加/
    if (baseUrl.length > 0 && ![baseUrl hasSuffix:@"/"]) {
        url = [url URLByAppendingPathComponent:@""];
    }
    NSLog(@"%@",url.absoluteString);//www.baidu.com/
    
    url = [url URLByAppendingPathComponent:@"images"];
    NSLog(@"%@",url.absoluteString);//www.baidu.com/images
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
