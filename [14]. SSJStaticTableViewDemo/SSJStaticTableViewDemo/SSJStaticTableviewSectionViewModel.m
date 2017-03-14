//
//  SSJStaticTableviewSectionViewModel.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SSJStaticTableviewSectionViewModel.h"

@implementation SSJStaticTableviewSectionViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sectionHeaderHeight = 20;
        _sectionFooterHeight = 0;
    }
    return self;
}


@end
