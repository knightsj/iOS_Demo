//
//  ViewController.m
//  autoresizing_demo
//
//  Created by Sun Shijie on 2017/3/10.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *bgView;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    self.bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.bgView];
    
    UIView *subview = [[NSBundle mainBundle] loadNibNamed:@"subview" owner:nil options:nil].firstObject;
    
    //不让xib的view随着父控件的大小而变化
    subview.autoresizingMask = UIViewAutoresizingNone;
    
    [self.bgView addSubview:subview];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGRect frame = self.bgView.frame;
    frame.size.width -= 10;
    frame.size.height += 10;
    self.bgView.frame = frame;
}
@end
