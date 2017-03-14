//
//  SSJStaticTavleviewDataSource.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SSJStaticTavleviewDataSource.h"
#import "SSJStaticTableviewCellViewModel.h"
#import "SSJStaticTableviewSectionViewModel.h"
#import "SSJStaticTableviewCell.h"
#import "SSJSettingViewController.h"

@interface SSJStaticTavleviewDataSource()

@property (nonatomic, strong) NSArray *sectionArray;

@end

@implementation SSJStaticTavleviewDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupDataSource];
    }
    return self;
}


- (void)setupDataSource
{
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
    section1.sectionHeaderHeight = 20;
    section1.sectionFooterHeight = 1;
    section1.itemArray = @[vm1,vm2,vm3,vm4];
    
    // ========== section 2
    SSJStaticTableviewCellViewModel *vm5 = [[SSJStaticTableviewCellViewModel alloc] init];
    vm5.defaultImage = [UIImage imageNamed:@"favorites"];
    vm5.defaultTitle = @"表情";
    vm5.staticCellType = SSJStaticCellTypeSystemAccessoryDisclosureIndicator;
    
    SSJStaticTableviewSectionViewModel *section2 = [[SSJStaticTableviewSectionViewModel alloc] init];
    section2.sectionHeaderHeight = 20;
    section2.sectionFooterHeight = 1;
    section2.itemArray = @[vm5];
    
    // ========== section 3
    SSJStaticTableviewCellViewModel *vm6 = [[SSJStaticTableviewCellViewModel alloc] init];
    vm6.defaultImage = [UIImage imageNamed:@"favorites"];
    vm6.defaultTitle = @"设置";
    vm6.staticCellType = SSJStaticCellTypeSystemAccessoryDisclosureIndicator;
    vm6.cellDidTapBlock = ^{
        NSLog(@"点击了设置页");
//        SSJSettingViewController *vc = [[SSJSettingViewController alloc] init];
//        [self.navigationController pushViewController: vc animated:YES];
    };
    
    
    SSJStaticTableviewSectionViewModel *section3 = [[SSJStaticTableviewSectionViewModel alloc] init];
    section3.sectionHeaderHeight = 20;
    section3.sectionFooterHeight = 1;
    section3.itemArray = @[vm6];
    
    self.sectionArray = @[section1,section2,section3];
    
}

#pragma mark - Tableview data source
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    SSJStaticTableviewSectionViewModel *vm = self.sectionArray[section];
    return vm.sectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    SSJStaticTableviewSectionViewModel *vm = self.sectionArray[section];
    return vm.sectionFooterHeight;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    SSJStaticTableviewSectionViewModel *vm = self.sectionArray[section];
    return vm.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"myPageCell";
    SSJStaticTableviewSectionViewModel *sectionViewModel = self.sectionArray[indexPath.section];
    SSJStaticTableviewCellViewModel *cellViewModel = sectionViewModel.itemArray[indexPath.row];
    
    SSJStaticTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SSJStaticTableviewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.viewModel = cellViewModel;
    return cell;
}


@end
