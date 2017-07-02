//
//  ViewController.m
//  indexset_demo
//
//  Created by Sun Shijie on 2017/7/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableIndexSet *idxSet = [[NSMutableIndexSet alloc] init];
    [idxSet addIndex:2];
    NSLog(@"%@",idxSet);
    [idxSet addIndexesInRange:NSMakeRange(5, 3)];
    NSLog(@"%@",idxSet);
    
    [idxSet addIndex:9];
    NSLog(@"%@",idxSet);
    
    //重复增加会去重
    [idxSet addIndex:9];
    NSLog(@"%@",idxSet);
    
//   <NSMutableIndexSet: 0x608000056950>[number of indexes: 1 (in 1 ranges), indexes: (2)]
//   <NSMutableIndexSet: 0x608000056950>[number of indexes: 4 (in 2 ranges), indexes: (2 5-7)]
//   <NSMutableIndexSet: 0x608000056950>[number of indexes: 5 (in 3 ranges), indexes: (2 5-7 9)]
    
    NSArray *arr = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9];
    NSArray *res = [arr objectsAtIndexes:idxSet];
    
    for(id item in res) {
        NSLog(@"%@", item);
    }
    
//    indexset_demo[8113:186218] 2
//    indexset_demo[8113:186218] 5
//    indexset_demo[8113:186218] 6
//    indexset_demo[8113:186218] 7
//    indexset_demo[8113:186218] 9
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
