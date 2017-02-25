//
//  FriendsListDataSource.h
//  tableview_datasource_seperate_demo
//
//  Created by Sun Shijie on 2017/1/24.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface FriendsListDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray *)items
    cellIndentifier:(NSString *)cellIdentifier
     configureBlock:(TableViewCellConfigureBlock)configureBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
