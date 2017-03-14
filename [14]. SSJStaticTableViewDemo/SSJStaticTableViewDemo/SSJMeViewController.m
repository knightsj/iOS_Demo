//
//  SSJMeViewController.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SSJMeViewController.h"
#import "SSJStaticTableviewCellViewModel.h"
#import "SSJStaticTableviewSectionViewModel.h"
#import "SSJStaticTableviewCell.h"
#import "SSJSettingViewController.h"
#import "SSJStaticTavleviewDataSource.h"
#import "SSJStaticMeAvatarTableViewCell.h"

@interface SSJMeViewController ()

@property (nonatomic, strong) SSJStaticTavleviewDataSource *dataSource;
@property (nonatomic, strong) NSArray *sectionArray;

@end

@implementation SSJMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我";
    
//    SSJStaticTavleviewDataSource *dataSource = [[SSJStaticTavleviewDataSource alloc] init];
//    self.tableView.dataSource = dataSource;
    [self setupDataSource];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = SSJColorWithRGB(240, 239, 245, 1);
    self.tableView.scrollEnabled = NO;
}


- (void)setupDataSource
{
    // ========== section 0
    SSJStaticTableviewCellViewModel *vm0 = [[SSJStaticTableviewCellViewModel alloc] init];
    vm0.cellID = @"avatarCell";
    vm0.cellHeight = 80;
    vm0.avatarImage = [UIImage imageNamed:@"avatar"];
    vm0.userName = @"世杰";
    vm0.userID = @"微信号：xxxxxx";
    vm0.staticCellType = SSJStaticCellTypeAvatar;
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
    vm6.cellDidTapBlock = ^{
        NSLog(@"点击了设置页");
        SSJSettingViewController *vc = [[SSJSettingViewController alloc] init];
        [self.navigationController pushViewController: vc animated:YES];
    };


    SSJStaticTableviewSectionViewModel *section3 = [[SSJStaticTableviewSectionViewModel alloc] init];
    section3.itemArray = @[vm6];
    
    self.sectionArray = @[section0,section1,section2,section3];
    
}

#pragma mark - Tableview data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SSJStaticTableviewSectionViewModel *sectionViewModel = self.sectionArray[indexPath.section];
    SSJStaticTableviewCellViewModel *cellViewModel = sectionViewModel.itemArray[indexPath.row];
    return cellViewModel.cellHeight;
}

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
    SSJStaticTableviewSectionViewModel *sectionViewModel = self.sectionArray[indexPath.section];
    SSJStaticTableviewCellViewModel *cellViewModel = sectionViewModel.itemArray[indexPath.row];
    if (cellViewModel.staticCellType == SSJStaticCellTypeAvatar) {
        
        SSJStaticMeAvatarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellViewModel.cellID];
        if (!cell) {
            cell = [[SSJStaticMeAvatarTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellViewModel.cellID];
        }
        cell.avatarViewModel = cellViewModel;
        return cell;
        
    }else{
        SSJStaticTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellViewModel.cellID];
        if (!cell) {
            cell = [[SSJStaticTableviewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellViewModel.cellID];
        }
        cell.viewModel = cellViewModel;
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SSJStaticTableviewSectionViewModel *sectionViewModel = self.sectionArray[indexPath.section];
    SSJStaticTableviewCellViewModel *cellViewModel = sectionViewModel.itemArray[indexPath.row];
    if (cellViewModel.cellDidTapBlock) {
        cellViewModel.cellDidTapBlock();
    }
}


@end
