//
//  Person.h
//  kvc_demo_1
//
//  Created by Sun Shijie on 2017/6/19.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Person : NSObject
{
    NSString *_country;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, assign) CGPoint point;



@end
