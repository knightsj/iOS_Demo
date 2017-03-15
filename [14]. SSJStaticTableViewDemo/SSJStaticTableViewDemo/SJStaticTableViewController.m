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
        self.tableView = [[SJStaticTableView alloc] initWithFrame:self.view.bounds];
        self.tableView.sjDelegate = self;
        self.tableView.sjDataSource = self.dataSource;
        [self.view addSubview:self.tableView];
    }
}


@end
