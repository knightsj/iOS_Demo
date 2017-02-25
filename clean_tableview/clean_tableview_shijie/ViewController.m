//
//  ViewController.m
//  clean_tableview_shijie
//
//  Created by Sun Shijie on 2017/1/25.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

#import "FriendTableViewCell.h"

#import "FriendsListDataSource.h"
#import "FriendInfoList.h"
#import "FriendInfo.h"

static NSString * const FriendListCellIdentifier = @"FriendCell";

@interface ViewController ()<UITableViewDelegate>
@property (nonatomic, strong) FriendsListDataSource *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Friends List";
    
    [self setupTableView];
}

- (void)setupTableView
{
    self.dataSource = [[FriendsListDataSource alloc] initWithItems:[self frindInfoModelList] cellIndentifier:FriendListCellIdentifier configureBlock:^(FriendTableViewCell * cell, FriendInfo *info) {
            [cell configureWithInfo:info];
    }];
    
    
    self.tableView.dataSource = self.dataSource;
    [self.tableView registerClass:[FriendTableViewCell class] forCellReuseIdentifier:FriendListCellIdentifier];
    
}


#pragma mark- Model
- (NSArray *)frindInfoModelList
{
    NSArray *array = [FriendInfoList friendInfoList];
    NSMutableArray *dataArray = [[NSMutableArray alloc] initWithCapacity:5];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dict = array[idx];
        FriendInfo *info = [[FriendInfo alloc] init];
        info.name = [dict objectForKey:@"name"];
        [dataArray addObject:info];
    }];
    return [dataArray copy];
}


@end
