//
//  SJViewModel.h
//  mvc_delegate_demo_shijie
//
//  Created by Sun Shijie on 2017/1/26.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJViewModel : NSObject

@property (nonatomic, copy, readonly) NSString *contentStr;

- (void)networkRequest;

@end
