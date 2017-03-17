//
//  SJSettingViewController.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/16.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJSettingViewController.h"
#import "SJStaticTableViewCell+Logout.h"
#import "SJStaticTableViewCell+Switch.h"

@interface SJSettingViewController ()

@end

@implementation SJSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
}


- (void)createDataSource
{
    self.dataSource = [[SJStaticTableViewDataSource alloc] initWithViewModelsArray:[Factory settingPageData] configureBlock:^(SJStaticTableViewCell *cell, SJStaticTableviewCellViewModel *viewModel) {
        
        switch (viewModel.staticCellType)
        {
            case SSJStaticCellTypeSystemAccessoryDisclosureIndicator:
            {
                [cell configureAccessoryDisclosureIndicatorCellWithViewModel:viewModel];
            }
                break;
                
            case SSJStaticCellTypeSystemAccessorySwitch:
            {
                [cell configureAccessorySwitchCellWithViewModel:viewModel];
            }
                break;
                
            case SSJStaticCellTypeSystemLogout:
            {
                [cell configureLogoutTableViewCellWithViewModel:viewModel];
            }
                break;
                
            default:
                break;
        }
    }];
}


- (void)didSelectViewModel:(SJStaticTableviewCellViewModel *)viewModel atIndexPath:(NSIndexPath *)indexPath
{
    
    switch (viewModel.identifier)
    {
            
        case 6:
        {
            NSLog(@"退出登录");
            [self showAlertWithMessage:@"真的要退出登录嘛？"];
        }
            break;
            
            
        default:
            break;
    }
}

- (void)showAlertWithMessage:(NSString *)alertTitle
{
    
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:alertTitle message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"是的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [vc addAction:actionCancel];
    [vc addAction:actionOK];
    [self presentViewController:vc animated:YES completion:nil];
    
}



@end
