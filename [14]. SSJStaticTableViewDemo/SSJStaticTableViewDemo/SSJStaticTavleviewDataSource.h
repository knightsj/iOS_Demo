//
//  SSJStaticTavleviewDataSource.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SSJStaticTableviewCellViewModel;

@protocol SSJStaticTavleviewDataSource <UITableViewDataSource>

@optional

- (SSJStaticTableviewCellViewModel *)viewModelForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface SSJStaticTavleviewDataSource : NSObject<UITableViewDataSource>

@end
