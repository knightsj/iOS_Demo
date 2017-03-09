//
//  SJView.m
//  mvc_delegate_demo_shijie
//
//  Created by Sun Shijie on 2017/1/26.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJView.h"
#import "SJViewModel.h"
#import "NSObject+FBKVOController.h"

@interface SJView()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) SJViewModel *viewModel;

@end

@implementation SJView

- (instancetype)initWithViewModel:(SJViewModel *)viewModel
{
    self = [super init];
    
    if (self) {
        
        self.viewModel = viewModel;
        
        //view监听viewmodel的contentStr属性的改变，一旦改变，刷新自己
        [self.KVOController observe:self.viewModel keyPath:@"contentStr" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
            NSLog(@"当view监听到了viewmodel的改变后，立即改变自己");
            NSLog(@"=======================================");
            self.label.text = self.viewModel.contentStr;
        }];
    }
    return self;
}


//点击按钮，再次请求
- (void)buttonIsClicked:(UIButton *)button
{
    [self.viewModel networkRequest];
}

- (void)layoutSubviews
{
    self.button = [[UIButton alloc] init];
    self.button.frame = CGRectMake(100, 100, 100, 40);
    [self.button setTitle:@"click" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonIsClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.button];
    
    self.label = [[UILabel alloc] init];
    self.label.frame = CGRectMake(50, 200, 300, 30);
    self.label.backgroundColor = [UIColor redColor];
    self.label.textColor = [UIColor blackColor];
    [self addSubview:self.label];
}


@end
