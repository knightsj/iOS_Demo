//
//  FriendTableViewCell.h
//  tableview_datasource_seperate_demo
//
//  Created by Sun Shijie on 2017/1/24.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SimpleCellLayoutDelegate <NSObject>
@end

@interface FriendTableViewCell : UITableViewCell

- (void)configureWithInfo:(id<SimpleCellLayoutDelegate>)info;

@end
