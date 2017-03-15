//
//  SSJStaticTavleviewDataSource.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SJStaticTableViewCell;

//@class SSJStaticTableviewCellViewModel;
//
//@protocol SSJStaticTavleviewDataSource <UITableViewDataSource>
//
//@optional
//
//- (SSJStaticTableviewCellViewModel *)viewModelForRowAtIndexPath:(NSIndexPath *)indexPath;
//
//@end

typedef void(^SJStaticCellConfigureBlock)(SJStaticTableViewCell *cell, id viewModel);

@interface SSJStaticTavleviewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, strong) NSArray *viewModelsArray;

- (instancetype)initWithViewModelsArray:(NSArray *)viewModelsArray configureBlock:(SJStaticCellConfigureBlock)block;

@end
