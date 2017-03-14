//
//  SSJStaticTableviewCell.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SSJStaticTableviewCell.h"



@interface SSJStaticTableviewCell()

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *leftTitleLabel;


@property (nonatomic, strong) UIImageView *indicatorImageView;
@property (nonatomic, strong) UISwitch *indicatorSwitch;


@property (nonatomic, strong) UIImageView *indicatorLeftImageView;
@property (nonatomic, strong) UILabel *indicatorLeftLabel;


@end


@implementation SSJStaticTableviewCell


- (void)setViewModel:(SSJStaticTableviewCellViewModel *)viewModel
{
    _viewModel = viewModel;
    
    if (_viewModel.staticCellType == SSJStaticCellTypeSystemLogout){
        
        //退出登录cell
        
    }else{
            
            //=============== 左侧部分 =============//
            //存在最左边的图片
            if (_viewModel.defaultImage) {
                [self.contentView addSubview:self.leftImageView];
            }
            
            //存在标题文字
            if (_viewModel.defaultTitle.length) {
                [self.contentView addSubview:self.leftTitleLabel];
            }
            
            //=============== 右侧部分 =============//
            if (_viewModel.staticCellType == SSJStaticCellTypeSystemAccessorySwitch){
                
                //右侧只有一个switch
                [self.contentView addSubview:self.indicatorSwitch];
                
            }else if ( _viewModel.staticCellType == SSJStaticCellTypeSystemAccessoryDisclosureIndicator){
             
                //右侧存在箭头
                [self.contentView addSubview:self.indicatorArrow];
                
                //右侧存在箭头+文字
                if ( (_viewModel.indicatorLeftTitle) && (_viewModel.indicatorLeftTitleLabelSize.width != 0)) {
                    [self.contentView addSubview:self.indicatorLeftLabel];
                }
                
                //右侧存在箭头+图片
                if (_viewModel.indicatorLeftImage) {
                    [self.contentView addSubview:self.indicatorImageView];
                }
            }
        }
}


- (void)switchTouched:(UISwitch *)sw
{
    __weak typeof(self) weakSelf = self;
    self.viewModel.switchChangedBlock(weakSelf.indicatorSwitch.isOn);
}


#pragma mark- setters && getters
- (UIImageView *)leftImageView
{
    if (!_leftImageView) {
         _leftImageView = [[UIImageView alloc] initWithImage:_viewModel.defaultImage];
         _leftImageView.frame = CGRectMake(SSJImgToLeftGap, (_viewModel.cellHeight - SSJImgWidth)/2, SSJImgWidth , SSJImgWidth);
    }
    return _leftImageView;
}

- (UILabel *)leftTitleLabel
{
    if (!_leftTitleLabel) {
         _leftTitleLabel= [[UILabel alloc] init];
         _leftTitleLabel.font = SSJDefaultTitleFont;
         _leftTitleLabel.textColor = SSJDefaultTitleColor;
         _leftTitleLabel.text = _viewModel.defaultTitle;
         _leftTitleLabel.frame = CGRectMake( CGRectGetMaxX(self.leftImageView.frame) + SSJImgToLeftGap,  (_viewModel.cellHeight - _viewModel.defatultTitleLabelSize.height)/2, _viewModel.defatultTitleLabelSize.width, _viewModel.defatultTitleLabelSize.height);
    }
    return _leftTitleLabel;
}


- (UISwitch *)indicatorSwitch
{
    if (!_indicatorSwitch) {
         _indicatorSwitch = [[UISwitch alloc] init];
         _indicatorSwitch.frame = CGRectMake(SSJScreenWidth - SSJImgToLeftGap - _indicatorSwitch.bounds.size.width, (_viewModel.cellHeight -  _indicatorSwitch.bounds.size.height)/2, _indicatorSwitch.bounds.size.width, _indicatorSwitch.bounds.size.height);
        [_indicatorSwitch addTarget:self action:@selector(switchTouched:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _indicatorSwitch;
}

- (UIImageView *)indicatorArrow
{
    if (!_indicatorArrow) {
         _indicatorArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
         _indicatorArrow.frame = CGRectMake(SSJScreenWidth - SSJImgToLeftGap - _indicatorArrow.bounds.size.width, (_viewModel.cellHeight - _indicatorArrow.bounds.size.height)/2, _indicatorArrow.bounds.size.width, _indicatorArrow.bounds.size.height);
    }
    
    return _indicatorArrow;
}

- (UILabel *)indicatorLeftLabel
{
    if (!_indicatorLeftLabel) {
         _indicatorLeftLabel= [[UILabel alloc] init];
         _indicatorLeftLabel.font = SSJIndicatorLeftTitleFont;
         _indicatorLeftLabel.textColor = SSJIndicatorLeftTitleColor;
         _indicatorLeftLabel.text = _viewModel.indicatorLeftTitle;
         _indicatorLeftLabel.frame = CGRectMake(self.indicatorArrow.frame.origin.x - SSJImgToLeftGap - _viewModel.indicatorLeftTitleLabelSize.width  , (_viewModel.cellHeight - _viewModel.indicatorLeftTitleLabelSize.height)/2, _viewModel.indicatorLeftTitleLabelSize.width, _viewModel.indicatorLeftTitleLabelSize.height);
    }
    return _indicatorLeftLabel;
}

- (UIImageView *)indicatorImageView
{
    if (!_indicatorImageView) {
         _indicatorImageView = [[UIImageView alloc] initWithImage:_viewModel.indicatorLeftImage];
         _indicatorImageView.frame = CGRectMake(self.indicatorArrow.frame.origin.x - SSJImgToLeftGap - SSJImgWidth, (_viewModel.cellHeight - SSJImgWidth)/2, _viewModel.indicatorLeftImage.size.width , SSJImgWidth);
    }
    return _indicatorImageView;
}

@end
