//
//  SecondViewController.h
//  block_practice
//
//  Created by Sun Shijie on 2017/2/9.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^PassValueBlock)(NSString *string);

@interface SecondViewController : UIViewController

@property (nonatomic, copy) PassValueBlock block;

- (void)passValueWithBlock:(PassValueBlock)block;

@end
