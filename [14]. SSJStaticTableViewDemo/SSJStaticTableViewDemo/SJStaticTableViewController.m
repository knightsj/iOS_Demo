//
//  SJStaticTableViewController.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewController.h"
#import "SJStaticTableViewDataSource.h"

@implementation SJStaticTableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self createDataSource];
    [self createTableView];
}

- (void)createDataSource
{
    //子类去实现
}


- (void)createTableView {
    
    if (!self.tableView) {
         self.tableView = [[SJStaticTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
         self.tableView.sjDelegate = self;
         self.tableView.sjDataSource = self.dataSource;
        [self.view addSubview:self.tableView];
    }
}


@end
