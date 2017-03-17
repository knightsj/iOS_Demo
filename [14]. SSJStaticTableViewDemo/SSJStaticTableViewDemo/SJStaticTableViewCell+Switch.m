//
//  SJStaticTableViewCell+Switch.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/17.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewCell+Switch.h"

@implementation SJStaticTableViewCell (Switch)
- (void)configureAccessorySwitchCellWithViewModel:(SJStaticTableviewCellViewModel *)viewModel
{
    [self layoutLeftPartSubViewsWithViewModel:viewModel];
    [self.contentView addSubview:self.indicatorSwitch];
}
@end
