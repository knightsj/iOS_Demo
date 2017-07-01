//
//  ViewController.m
//  pick_demo
//
//  Created by Sun Shijie on 2017/6/30.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *array = @[@"2011",@"2011",@"2012",@"2012",@"2012",@"2013",@"2013",@"2013",@"2013"];
    NSMutableArray *finalArray = [NSMutableArray arrayWithCapacity:10];
    NSMutableArray *sectionArray = [NSMutableArray arrayWithCapacity:10];
    NSString *temp = @"";
    
    for (NSInteger i = 0; i < array.count; i++) {
        
        if (![temp isEqualToString:array[i]]) {
            
            if (sectionArray.count > 0) {
                
                [finalArray addObject:[sectionArray copy]];
                [sectionArray removeAllObjects];
                [sectionArray addObject:array[i]];
                NSLog(@"add %@",finalArray);
                
            }else{
                //第一次
                [sectionArray addObject:array[i]];
                [finalArray addObject:sectionArray];
                NSLog(@"第一次 add %@",finalArray);
            }
        }else{
            
            [sectionArray addObject:array[i]];
            NSLog(@"add %@",finalArray);
        }
        
        
        temp = array[i];
        
    }
    NSLog(@"%@",finalArray);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
