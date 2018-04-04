//
//  ViewController.m
//  copy_mCopy_array
//
//  Created by Sun Shijie on 2018/4/2.
//  Copyright © 2018年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *originalArray1 = @[@"1",@"2",@"3"];
    NSArray *copy1 = [originalArray1 copy];
    NSArray *copy2 = [originalArray1 mutableCopy];
    
    NSLog(@"original array1 : %p %p  %p",originalArray1,&originalArray1,originalArray1.firstObject);
    NSLog(@"copy array1 : %p %p  %p",copy1,&copy1,copy1.firstObject);
    NSLog(@"mutable copy2 array : %p %p  %p",copy2,&copy2 , copy2.firstObject);
    
    NSLog(@"\n");
    
    NSMutableArray *originalArray2 = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3"]];
    NSArray *copy11 = [originalArray2 copy];
    NSArray *copy22 = [originalArray2 mutableCopy];
    
    NSLog(@"original array2 : %p %p  %p",originalArray2,&originalArray2,originalArray2.firstObject);
    NSLog(@"copy array11 : %p %p  %p",copy11,&copy11,copy11.firstObject);
    NSLog(@"mutable copy array22 : %p %p  %p",copy22,&copy22 , copy22.firstObject);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
