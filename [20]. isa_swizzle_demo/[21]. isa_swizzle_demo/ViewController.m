//
//  ViewController.m
//  [21]. isa_swizzle_demo
//
//  Created by Sun Shijie on 2017/5/4.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"

#import <objc/runtime.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *person = [[Person alloc] init];
    person.name = @"Jack";
    NSLog(@"before:%@",person);
    object_setClass(person, [Student class]);
//    person.name = @"John";//崩溃
    Student *student = (Student *)person;
    NSLog(@"student school:%@",student.schoolName);

//    NSLog(@"student class:%@",student.className);
    
    student.schoolName = @"Good";
    NSLog(@"student school:%@",student.schoolName);
    
    student.gradeName = @"1";
    NSLog(@"student grade:%@",student.gradeName);
    
    student.className = @"2";
    NSLog(@"student class:%@",student.className);
    
    NSLog(@"after:%@",person);
    NSLog(@"student:%@",student);
    
}

@end
