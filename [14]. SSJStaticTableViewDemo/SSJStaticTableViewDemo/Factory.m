//
//  Factory.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "Factory.h"
#import "SSJStaticTableviewCellViewModel.h"
#import "SSJStaticTableviewSectionViewModel.h"



@implementation Factory

+ (NSArray *)mePageData
{
    // ========== section 0
    SSJStaticTableviewCellViewModel *vm0 = [[SSJStaticTableviewCellViewModel alloc] init];
    vm0.cellID = @"avatarCell";
    vm0.cellHeight = 80;
    vm0.avatarImage = [UIImage imageNamed:@"avatar"];
    vm0.userName = @"世杰";
    vm0.userID = @"微信号：xxxxxx";
    vm0.staticCellType = SSJStaticCellTypeMeAvatar;
    SSJStaticTableviewSectionViewModel *section0 = [[SSJStaticTableviewSectionViewModel alloc] init];
    section0.itemArray = @[vm0];
    
    
    // ========== section 1
    SSJStaticTableviewCellViewModel *vm1 = [[SSJStaticTableviewCellViewModel alloc] init];
    vm1.defaultImage = [UIImage imageNamed:@"favorites"];
    vm1.defaultTitle = @"相册";
    vm1.staticCellType = SSJStaticCellTypeSystemAccessoryDisclosureIndicator;
    
    SSJStaticTableviewCellViewModel *vm2 = [[SSJStaticTableviewCellViewModel alloc] init];
    vm2.defaultImage = [UIImage imageNamed:@"favorites"];
    vm2.defaultTitle = @"收藏";
    vm2.staticCellType = SSJStaticCellTypeSystemAccessoryDisclosureIndicator;
    
    SSJStaticTableviewCellViewModel *vm3 = [[SSJStaticTableviewCellViewModel alloc] init];
    vm3.defaultImage = [UIImage imageNamed:@"favorites"];
    vm3.defaultTitle = @"钱包";
    vm3.staticCellType = SSJStaticCellTypeSystemAccessoryDisclosureIndicator;
    
    SSJStaticTableviewCellViewModel *vm4 = [[SSJStaticTableviewCellViewModel alloc] init];
    vm4.defaultImage = [UIImage imageNamed:@"favorites"];
    vm4.defaultTitle = @"卡包";
    vm4.staticCellType = SSJStaticCellTypeSystemAccessoryDisclosureIndicator;
    
    SSJStaticTableviewSectionViewModel *section1 = [[SSJStaticTableviewSectionViewModel alloc] init];
    section1.itemArray = @[vm1,vm2,vm3,vm4];
    
    // ========== section 2
    SSJStaticTableviewCellViewModel *vm5 = [[SSJStaticTableviewCellViewModel alloc] init];
    vm5.defaultImage = [UIImage imageNamed:@"favorites"];
    vm5.defaultTitle = @"表情";
    vm5.staticCellType = SSJStaticCellTypeSystemAccessoryDisclosureIndicator;
    
    SSJStaticTableviewSectionViewModel *section2 = [[SSJStaticTableviewSectionViewModel alloc] init];
    section2.itemArray = @[vm5];
    
    // ========== section 3
    SSJStaticTableviewCellViewModel *vm6 = [[SSJStaticTableviewCellViewModel alloc] init];
    vm6.defaultImage = [UIImage imageNamed:@"favorites"];
    vm6.defaultTitle = @"设置";
    vm6.staticCellType = SSJStaticCellTypeSystemAccessoryDisclosureIndicator;
    
    
    SSJStaticTableviewSectionViewModel *section3 = [[SSJStaticTableviewSectionViewModel alloc] init];
    section3.itemArray = @[vm6];
    
    return @[section0,section1,section2,section3];
}
@end
