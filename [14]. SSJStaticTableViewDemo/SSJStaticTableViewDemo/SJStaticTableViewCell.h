//
//  SJStaticTableViewCell.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SJStaticTableviewCellViewModel.h"

@interface SJStaticTableViewCell : UITableViewCell

@property (nonatomic, strong) SJStaticTableviewCellViewModel *viewModel;

//我页面普通cell
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *leftTitleLabel;
@property (nonatomic, strong) UIImageView *indicatorImageView;
@property (nonatomic, strong) UISwitch *indicatorSwitch;
@property (nonatomic, strong) UIImageView *indicatorLeftImageView;
@property (nonatomic, strong) UILabel *indicatorLeftLabel;
@property (nonatomic, strong) UIImageView *indicatorArrow;


//我页面头像cell
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *userIdLabel;
@property (nonatomic, strong) UIImageView *codeImageView;
@property (nonatomic, strong) UIImageView *avatarIndicatorImageView;

//退出登录的按钮
@property (nonatomic, strong) UILabel *logoutLabel;

@end
