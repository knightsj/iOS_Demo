//
//  SJMeViewController.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJMeViewController.h"
#import "SJStaticTableViewCell+AccessoryDisclosureIndicator.h"
#import "SJStaticTableViewCell+MeAvatar.h"

@interface SJMeViewController ()

@end

@implementation SJMeViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
     self.navigationItem.title = @"我";
}

- (void)createDataSource
{
    self.dataSource = [[SJStaticTableViewDataSource alloc] initWithViewModelsArray:[Factory mePageData] configureBlock:^(SJStaticTableViewCell *cell, SSJStaticTableviewCellViewModel *viewModel) {
        
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
}

- (void)didSelectViewModel:(SSJStaticTableviewCellViewModel *)viewModel atIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
