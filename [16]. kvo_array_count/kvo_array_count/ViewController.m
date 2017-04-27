//
//  ViewController.m
//  kvo_array_count
//
//  Created by Sun Shijie on 2017/4/18.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, retain)NSMutableArray *modelArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _modelArray = [NSMutableArray arrayWithCapacity:10];
    [self addObserver:self forKeyPath:@"modelArray"options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
        NSLog(@"添加元素");
        [[self mutableArrayValueForKey:@"modelArray"] addObject:@"啦啦啦"];
    
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"modelArray"]) {
        NSLog(@"添加了元素");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
