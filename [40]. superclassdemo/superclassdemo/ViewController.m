//
//  ViewController.m
//  superclassdemo
//
//  Created by Sun Shijie on 2018/5/16.
//  Copyright © 2018年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "Father.h"
#import "Son.h"
#import "SJApplication.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    Son *s = (Son *)[[Father alloc]init];
//    [s run];
////    [s speak];
    
//     [(SJApplication*)[UIApplication sharedApplication] run];
    
    id app = [UIApplication sharedApplication];
    id app2 = (SJApplication*)[UIApplication sharedApplication];
    
    NSLog(@"%@",[app class]);
    NSLog(@"%@",[app2 class]);
    
    NSLog(@"%@",[app2 class]);
//    NSLog(@"%@",app);
//    NSLog(@"%@",app.name);
//    NSLog(@"%@",app.name);
//
    
    NSString *some = @"232341";
    NSLog(@"%p",some);
    NSLog(@"%@",some);
    
     NSString *some1 = @"23234122222222";
    
    NSLog(@"%p",some1);
    NSLog(@"%@",some1);
    
    Father *f1 = [[Father alloc] init];
    NSLog(@"1============%p",f1);
                     
    
    if(1){
//        NSString *some1 = @"2323434555555";
//        NSLog(@"%p",some1);
//        NSLog(@"%@",some1);
//        NSLog(@"%@",some);
        Father *f1 = [[Father alloc] init];
        NSLog(@"2============%p",f1);
        
        [f1 run];
        Father *f = [[Father alloc] init];
        
    }else{
        Father *f = [[Father alloc] init];
    }
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
