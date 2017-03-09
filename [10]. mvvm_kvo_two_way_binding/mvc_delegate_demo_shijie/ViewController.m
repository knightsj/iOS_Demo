//
//  ViewController.m
//  mvc_delegate_demo_shijie
//
//  Created by Sun Shijie on 2017/1/26.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "SJViewController.h"

@interface ViewController ()

@property (nonatomic, strong) SJViewController *viewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewController = [[SJViewController alloc] init];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self presentViewController: self.viewController animated: YES completion:nil];
    });
}


@end
