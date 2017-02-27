//
//  Person+Job.m
//  associate_object
//
//  Created by Sun Shijie on 2017/2/27.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "Person+Job.h"
#import <objc/runtime.h>

static char salaryKey;

@implementation Person (Job)

- (NSString *)salary
{
    return objc_getAssociatedObject(self, &salaryKey);
}

- (void)setSalary:(NSString *)salary
{
    objc_setAssociatedObject(self, &salaryKey, salary, OBJC_ASSOCIATION_COPY);
}

@end
