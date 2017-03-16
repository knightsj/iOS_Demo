//
//  Factory.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "Factory.h"
#import "SJStaticTableviewCellViewModel.h"
#import "SJStaticTableviewSectionViewModel.h"



@implementation Factory

+ (NSArray *)mePageData
{
    // ========== section 0
    SJStaticTableviewCellViewModel *vm0 = [[SJStaticTableviewCellViewModel alloc] init];
    vm0.cellID = @"avatarCell";
    vm0.cellHeight = 80;
    vm0.avatarImage = [UIImage imageNamed:@"avatar"];
    vm0.userName = @"世杰";
    vm0.userID = @"微信号：xxxxxx";
    vm0.staticCellType = SSJStaticCellTypeMeAvatar;
    
    SJStaticTableviewSectionViewModel *section0 = [[SJStaticTableviewSectionViewModel alloc] init];
    section0.itemArray = @[vm0];
    
    
    
    // ========== section 1
    SJStaticTableviewCellViewModel *vm1 = [[SJStaticTableviewCellViewModel alloc] init];
    vm1.defaultImage = [UIImage imageNamed:@"favorites"];
    vm1.defaultTitle = @"相册";
    
    SJStaticTableviewCellViewModel *vm2 = [[SJStaticTableviewCellViewModel alloc] init];
    vm2.defaultImage = [UIImage imageNamed:@"favorites"];
    vm2.defaultTitle = @"收藏";
    
    
    SJStaticTableviewCellViewModel *vm3 = [[SJStaticTableviewCellViewModel alloc] init];
    vm3.defaultImage = [UIImage imageNamed:@"favorites"];
    vm3.defaultTitle = @"钱包";

    
    SJStaticTableviewCellViewModel *vm4 = [[SJStaticTableviewCellViewModel alloc] init];
    vm4.defaultImage = [UIImage imageNamed:@"favorites"];
    vm4.defaultTitle = @"卡包";
  
    
    SJStaticTableviewSectionViewModel *section1 = [[SJStaticTableviewSectionViewModel alloc] init];
    section1.itemArray = @[vm1,vm2,vm3,vm4];
    
    // ========== section 2
    SJStaticTableviewCellViewModel *vm5 = [[SJStaticTableviewCellViewModel alloc] init];
    vm5.defaultImage = [UIImage imageNamed:@"favorites"];
    vm5.defaultTitle = @"表情";
    
    
    SJStaticTableviewSectionViewModel *section2 = [[SJStaticTableviewSectionViewModel alloc] init];
    section2.itemArray = @[vm5];
    
    // ========== section 3
    SJStaticTableviewCellViewModel *vm6 = [[SJStaticTableviewCellViewModel alloc] init];
    vm6.defaultImage = [UIImage imageNamed:@"favorites"];
    vm6.defaultTitle = @"设置";
    
    
    SJStaticTableviewSectionViewModel *section3 = [[SJStaticTableviewSectionViewModel alloc] init];
    section3.itemArray = @[vm6];
    
    return @[section0,section1,section2,section3];
}
@end
