//
//  ViewController.m
//  [19]. bad_access_demo
//
//  Created by Sun Shijie on 2017/5/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:5];
    [array release];
    [array addObject:@""];
}


- (IBAction)jump:(id)sender {
    
}


- (IBAction)post:(id)sender {

}


@end
