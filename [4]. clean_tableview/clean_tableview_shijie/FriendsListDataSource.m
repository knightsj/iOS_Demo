//
//  FriendsListDataSource.m
//  tableview_datasource_seperate_demo
//
//  Created by Sun Shijie on 2017/1/24.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "FriendsListDataSource.h"

@interface FriendsListDataSource()

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;

@end

@implementation FriendsListDataSource

- (instancetype)init{
    return nil;
}

- (id)initWithItems:(NSArray *)items cellIndentifier:(NSString *)cellIdentifier configureBlock:(TableViewCellConfigureBlock)configureBlock
{
    self = [super init];
    if (self) {
        self.items = [items mutableCopy];
        self.cellIdentifier = cellIdentifier;
        self.configureCellBlock = [configureBlock copy];                
    }
    
    return self;
}


- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger) indexPath.row];
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.items removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}




@end
