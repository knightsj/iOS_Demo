//
//  SSJStaticTableviewCell.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSJStaticTableviewCellViewModel.h"

@interface SSJStaticTableviewCell : UITableViewCell

@property (nonatomic, strong) SSJStaticTableviewCellViewModel *viewModel;
@property (nonatomic, strong) UIImageView *indicatorArrow;


@end
