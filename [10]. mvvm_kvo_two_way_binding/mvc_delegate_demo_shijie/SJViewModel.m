//
//  SJViewModel.m
//  mvc_delegate_demo_shijie
//
//  Created by Sun Shijie on 2017/1/26.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJViewModel.h"
#import "SJModel.h"
#import "NSObject+FBKVOController.h"

@interface SJViewModel()

@property (nonatomic, copy, readwrite) NSString *contentStr;
@property (nonatomic ,strong) SJModel *model;

@end

@implementation SJViewModel

- (void)networkRequest
{
    //模拟网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //新请求下来一个model
        self.model = [[SJModel alloc] init];
        self.model.number = arc4random() % 100;;
        
        //viewmodel监听model的改变
        [self.KVOController observe:self.model keyPath:@"number" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
             NSLog(@"viewmodel监听到了model的改变后，立即改变自己被控制器监听的属性");
             self.contentStr = [self convertNumber:self.model.number];
            
        }];
    });
}



//业务逻辑：直接返回label上需要显示的字符串
- (NSString *)convertNumber:(NSInteger )originalNum
{
    return [NSString stringWithFormat:@"显示的数字：%ld",originalNum];
}


@end
