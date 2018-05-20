//
//  SJApplication.h
//  superclassdemo
//
//  Created by Sun Shijie on 2018/5/16.
//  Copyright © 2018年 Shijie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJApplication : UIApplication

@property (nonatomic, copy) NSString *name;

+ (UIApplication *)sharedApplication;
- (void)run;
@end
