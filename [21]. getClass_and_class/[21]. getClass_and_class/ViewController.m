//
//  ViewController.m
//  [21]. getClass_and_class
//
//  Created by Sun Shijie on 2017/5/4.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //object
    Person *p = [[Person alloc] init];
    NSLog(@"object class: %p",[p class]);                       //0x104660f18(up to class object)
    NSLog(@"object getClass: %p",object_getClass(p));           //0x104660f18(up to class object)
    
    //class object
    Class classObj = [p class];
    NSLog(@"classObj class: %p",[classObj class]);              //0x104660f18(class object self)
    NSLog(@"classObj getClass: %p",object_getClass(classObj));  //0x104660ef0(up to meta class object)
    
    //meta class object
    Class metaClassObj = object_getClass(classObj);
    NSLog(@"metaClassObj class: %p",[metaClassObj class]);              //0x104660ef0(meta class object self)
    NSLog(@"metaClassObj getClass: %p",object_getClass(metaClassObj));  //0x104ffee08(up to root meta class obj)
    
    //root meta class object
    Class rootMetaClassObj = object_getClass(metaClassObj);
    NSLog(@"rootMetaClassObj class: %p",[rootMetaClassObj class]);              //0x104ffee08(root meta class self)
    NSLog(@"rootMetaClassObj getClass: %p",object_getClass(rootMetaClassObj));  //0x104ffee08(root meta class self)
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//2017-05-04 16:48:50.012 [21]. getClass_and_class[58119:2885651] object class: 0x104660f18
//2017-05-04 16:48:50.012 [21]. getClass_and_class[58119:2885651] object getClass: 0x104660f18
//2017-05-04 16:48:50.014 [21]. getClass_and_class[58119:2885651] classObj class: 0x104660f18
//2017-05-04 16:48:50.015 [21]. getClass_and_class[58119:2885651] classObj getClass: 0x104660ef0
//2017-05-04 16:48:50.015 [21]. getClass_and_class[58119:2885651] metaClassObj class: 0x104660ef0
//2017-05-04 16:48:50.016 [21]. getClass_and_class[58119:2885651] metaClassObj getClass: 0x104ffee08
//2017-05-04 16:48:50.017 [21]. getClass_and_class[58119:2885651] rootMetaClassObj class: 0x104ffee08
//2017-05-04 16:48:50.017 [21]. getClass_and_class[58119:2885651] rootMetaClassObj getClass: 0x104ffee08


@end
