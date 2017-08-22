//
//  ViewController.m
//  string_demo
//
//  Created by Sun Shijie on 2017/7/31.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *string = @"FDD";
    
    NSString *copyStr =  [string copy];
    
    NSMutableString *mutableStr = [string mutableCopy];
    
    NSString *string3 = [NSString stringWithFormat:@"1234"];
//    NSLog(@"修改前 %@",mutableStr);
//    [mutableStr appendString:@"11111111"];
//    NSLog(@"修改后 %@",mutableStr);
    
    
    NSLog(@"%@--string=%p  %@--copyStr=%p, %@--copyStr=%p",[string class],string,[copyStr class],copyStr,[mutableStr class],mutableStr);
    
    NSMutableString *newString = [NSMutableString stringWithFormat:@"哈哈哈"];
    
    NSMutableString *oneTwo =  [newString mutableCopy];
    
    NSLog(@"修改前 %@",oneTwo);
    [oneTwo appendString:@"11111111"];
    NSLog(@"修改后 %@",oneTwo);
    
    NSMutableString *string1 = [oneTwo copy];
     [string1 appendString:@"11111111"];
    
    
    //    [[newString mutableCopy] insertString:@"1" atIndex:1];
    
    NSLog(@"%@--newString=%p  %@--[newString copy]=%p, %@--[newString mutableCopy]=%p",[newString class],newString,[[newString copy] class],[newString copy],[oneTwo class],oneTwo);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
