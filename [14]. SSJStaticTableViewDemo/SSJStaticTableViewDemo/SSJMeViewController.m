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
#import "SSJSettingViewController.h"
#import "SSJStaticTavleviewDataSource.h"
#import "SJStaticTableViewCell.h"

#import "SJStaticTableViewCell+AccessoryDisclosureIndicator.h"
#import "SJStaticTableViewCell+MeAvatar.h"


#import "Factory.h"


@interface SSJMeViewController ()

@property (nonatomic, strong) SSJStaticTavleviewDataSource *dataSource;

@end

@implementation SSJMeViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];

    self.navigationItem.title = @"我";
    
    self.dataSource = [[SSJStaticTavleviewDataSource alloc] initWithViewModelsArray:[Factory mePageData] configureBlock:^(SJStaticTableViewCell *cell, SSJStaticTableviewCellViewModel *viewModel) {
      
        switch (viewModel.staticCellType) {
            case SSJStaticCellTypeSystemAccessoryDisclosureIndicator:
            {
                [cell configureAccessoryDisclosureIndicatorCellWithViewModel:viewModel];
            }
                break;
                
            case SSJStaticCellTypeMeAvatar:{
                [cell configureMeAvatarTableViewCellWithViewModel:viewModel];
            }
                break;
                
            default:
                break;
        }
    }];
    
    
    self.tableView.dataSource = self.dataSource;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = SSJColorWithRGB(240, 239, 245, 1);
    self.tableView.scrollEnabled = NO;
}
#pragma mark - Tableview Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SSJStaticTableviewSectionViewModel *sectionViewModel = self.dataSource.viewModelsArray[indexPath.section];
    SSJStaticTableviewCellViewModel *cellViewModel = sectionViewModel.itemArray[indexPath.row];
    return cellViewModel.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    SSJStaticTableviewSectionViewModel *vm = self.dataSource.viewModelsArray[section];
    return vm.sectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    SSJStaticTableviewSectionViewModel *vm = self.dataSource.viewModelsArray[section];
    return vm.sectionFooterHeight;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SSJStaticTableviewSectionViewModel *sectionViewModel = self.dataSource.viewModelsArray[indexPath.section];
    SSJStaticTableviewCellViewModel *cellViewModel = sectionViewModel.itemArray[indexPath.row];
    
}


@end
