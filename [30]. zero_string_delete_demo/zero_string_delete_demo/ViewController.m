//
//  ViewController.m
//  zero_string_delete_demo
//
//  Created by Sun Shijie on 2017/8/10.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *dict = @{@"A":@"",@"B":@"SDF",@"C":@""};
    NSMutableDictionary *dict_m = [dict mutableCopy];
    NSLog(@"%@",dict_m);
    
    NSMutableArray *deleteKeys = [NSMutableArray array];
    NSArray *keys = [dict allKeys];
    
    for (NSInteger i = 0; i < keys.count; i++) {
        NSString * key = keys[i];
        NSString * value = [dict_m objectForKey:key];
        if ([value isEqualToString:@""]) {
            [deleteKeys addObject:key];
        }
    }
    for (NSInteger j = 0; j<deleteKeys.count; j++) {
        NSString *key = deleteKeys[j];
        [dict_m removeObjectForKey:key];
    }
    
    NSLog(@"%@",dict_m);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
