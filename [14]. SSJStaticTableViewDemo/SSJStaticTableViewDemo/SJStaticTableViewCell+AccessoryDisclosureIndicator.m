//
//  SJStaticTableViewCell+AccessoryDisclosureIndicator.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewCell+AccessoryDisclosureIndicator.h"

@implementation SJStaticTableViewCell (AccessoryDisclosureIndicator)
- (void)configureAccessoryDisclosureIndicatorCellWithViewModel:(SSJStaticTableviewCellViewModel *)viewModel
{
    self.viewModel = viewModel;
    
    if (self.viewModel.staticCellType == SSJStaticCellTypeSystemLogout){
        
        //退出登录cell
        
    }else{
        
        //=============== 左侧部分 =============//
        //存在最左边的图片
        if (self.viewModel.defaultImage) {
            [self.contentView addSubview:self.leftImageView];
        }
        
        //存在标题文字
        if (self.viewModel.defaultTitle.length) {
            [self.contentView addSubview:self.leftTitleLabel];
        }
        
        //=============== 右侧部分 =============//
        if (self.viewModel.staticCellType == SSJStaticCellTypeSystemAccessorySwitch){
            
            //右侧只有一个switch
            [self.contentView addSubview:self.indicatorSwitch];
            
        }else if ( self.viewModel.staticCellType == SSJStaticCellTypeSystemAccessoryDisclosureIndicator){
            
            //右侧存在箭头
            [self.contentView addSubview:self.indicatorArrow];
            
            //右侧存在箭头+文字
            if ( (self.viewModel.indicatorLeftTitle) && (self.viewModel.indicatorLeftTitleLabelSize.width != 0)) {
                [self.contentView addSubview:self.indicatorLeftLabel];
            }
            
            //右侧存在箭头+图片
            if (self.viewModel.indicatorLeftImage) {
                [self.contentView addSubview:self.indicatorImageView];
            }
        }
    }
}
@end
