//
//  SJViewController.m
//  mvc_delegate_demo_shijie
//
//  Created by Sun Shijie on 2017/1/26.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJViewController.h"
#import "SJView.h"
#import "SJModel.h"
#import "SJViewModel.h"
#import "NSObject+FBKVOController.h"


@interface SJViewController ()

@property (nonatomic, strong) SJView *sjView;
@property (nonatomic, strong) SJViewModel *viewModel;

@end

@implementation SJViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
     self.viewModel = [[SJViewModel alloc] init];
    [self createSubView];
    [self.viewModel networkRequest];
    
}


- (void)createSubView
{
    self.sjView = [[SJView alloc] initWithViewModel:self.viewModel];
    self.sjView.backgroundColor = [UIColor grayColor];
    self.sjView.frame = self.view.bounds;
    [self.view addSubview:self.sjView];
}

@end
