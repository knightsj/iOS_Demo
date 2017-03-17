//
//  SJStaticTableViewCell.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJStaticTableviewCellViewModel.h"

//所有cell都是这个类的分类


@interface SJStaticTableViewCell : UITableViewCell

@property (nonatomic, strong) SJStaticTableviewCellViewModel *viewModel;

// =============== 系统风格cell的所有控件 =============== //

//左半部分
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *leftTitleLabel;

//右半部分
@property (nonatomic, strong) UIImageView *indicatorImageView;
@property (nonatomic, strong) UISwitch *indicatorSwitch;
@property (nonatomic, strong) UIImageView *indicatorLeftImageView;
@property (nonatomic, strong) UILabel *indicatorLeftLabel;
@property (nonatomic, strong) UIImageView *indicatorArrow;
@property (nonatomic, strong) UILabel *logoutLabel;

// =============== 用户自定义的cell里面的控件 =============== //

//MeViewController里面的头像cell
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UIImageView *codeImageView;
@property (nonatomic, strong) UIImageView *avatarIndicatorImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *userIdLabel;






//统一的，布局cell左侧部分的内容（标题 ／ 图片 + 标题），所有系统风格的cell都要调用这个方法
- (void)layoutLeftPartSubViewsWithViewModel:(SJStaticTableviewCellViewModel *)viewModel;

@end
