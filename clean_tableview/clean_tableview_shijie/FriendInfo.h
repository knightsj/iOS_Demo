//
//  FriendInfo.h
//  tableview_datasource_seperate_demo
//
//  Created by Sun Shijie on 2017/1/24.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FriendTableViewCell.h"

@interface FriendInfo : NSObject<SimpleCellLayoutDelegate>

@property (nonatomic, copy) NSString *name;

@end
