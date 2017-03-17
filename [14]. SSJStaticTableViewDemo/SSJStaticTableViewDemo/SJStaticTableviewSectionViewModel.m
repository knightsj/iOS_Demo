//
//  SJStaticTableviewSectionViewModel.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableviewSectionViewModel.h"

@implementation SJStaticTableviewSectionViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sectionHeaderHeight = 10;
        _sectionFooterHeight = 10;
    }
    return self;
}


@end
