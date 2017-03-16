//
//  SJStaticTableViewCell.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewCell.h"

@implementation SJStaticTableViewCell


#pragma mark- default cell
- (UIImageView *)leftImageView
{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] initWithImage:_viewModel.defaultImage];
        _leftImageView.frame = CGRectMake(SJLeftGap, (_viewModel.cellHeight - SSJImgWidth)/2, SSJImgWidth , SSJImgWidth);
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
        _leftTitleLabel.frame = CGRectMake( CGRectGetMaxX(_leftImageView.frame) + SSJImgToLeftGap,  (_viewModel.cellHeight - _viewModel.defatultTitleLabelSize.height)/2, _viewModel.defatultTitleLabelSize.width, _viewModel.defatultTitleLabelSize.height);
    }
    return _leftTitleLabel;
}


- (UISwitch *)indicatorSwitch
{
    if (!_indicatorSwitch) {
        _indicatorSwitch = [[UISwitch alloc] init];
        _indicatorSwitch.frame = CGRectMake(SSJScreenWidth - SJLeftGap - _indicatorSwitch.bounds.size.width, (_viewModel.cellHeight -  _indicatorSwitch.bounds.size.height)/2, _indicatorSwitch.bounds.size.width, _indicatorSwitch.bounds.size.height);
        [_indicatorSwitch addTarget:self action:@selector(switchTouched:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _indicatorSwitch;
}

- (UIImageView *)indicatorArrow
{
    if (!_indicatorArrow) {
        _indicatorArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:SJIndicatorArrow]];
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
        
        if (!_viewModel.hasIndicatorImageAndLabel) {
            _indicatorLeftLabel.frame = CGRectMake(_indicatorArrow.frame.origin.x - SSJImgToLeftGap - _viewModel.indicatorLeftTitleLabelSize.width  , (_viewModel.cellHeight - _viewModel.indicatorLeftTitleLabelSize.height)/2, _viewModel.indicatorLeftTitleLabelSize.width, _viewModel.indicatorLeftTitleLabelSize.height);
        }else{
            //同时存在
            if (_viewModel.isImageFirst) {
                
                _indicatorLeftLabel.frame = CGRectMake(SSJScreenWidth - SJLeftGap - _indicatorArrow.bounds.size.width - SJLeftGap - _viewModel.indicatorLeftImgWidth - SJLeftGap - _viewModel.indicatorLeftTitleLabelSize.width, (_viewModel.cellHeight - _viewModel.indicatorLeftTitleLabelSize.height)/2, _viewModel.indicatorLeftTitleLabelSize.width, _viewModel.indicatorLeftTitleLabelSize.height);
                
            }else{
                
                _indicatorLeftLabel.frame = CGRectMake(SSJScreenWidth - SJLeftGap - _indicatorArrow.bounds.size.width - SJLeftGap - _viewModel.indicatorLeftTitleLabelSize.width, (_viewModel.cellHeight - _viewModel.indicatorLeftTitleLabelSize.height)/2, _viewModel.indicatorLeftTitleLabelSize.width, _viewModel.indicatorLeftTitleLabelSize.height);
            }
        }
        
    }
    return _indicatorLeftLabel;
}

- (UIImageView *)indicatorImageView
{
    if (!_indicatorImageView) {
        _indicatorImageView = [[UIImageView alloc] initWithImage:_viewModel.indicatorLeftImage];
        
        if (!_viewModel.hasIndicatorImageAndLabel) {
            _indicatorImageView.frame = CGRectMake(_indicatorArrow.frame.origin.x - SSJImgToLeftGap - _viewModel.indicatorLeftImgWidth, (_viewModel.cellHeight - _viewModel.indicatorLeftImgHeight)/2, _viewModel.indicatorLeftImgWidth , _viewModel.indicatorLeftImgHeight);
        }else{
            
            if (_viewModel.isImageFirst) {
                
                _indicatorImageView.frame = CGRectMake(SSJScreenWidth - SJLeftGap - _indicatorArrow.bounds.size.width - SJLeftGap - _viewModel.indicatorLeftImgWidth, (_viewModel.cellHeight - _viewModel.indicatorLeftImgHeight)/2, _viewModel.indicatorLeftImgWidth, _viewModel.indicatorLeftImgHeight);
                
            }else{
                
                _indicatorImageView.frame = CGRectMake(SSJScreenWidth - SJLeftGap - _indicatorArrow.bounds.size.width - SJLeftGap - _viewModel.indicatorLeftTitleLabelSize.width - SJLeftGap - _viewModel.indicatorLeftImgWidth, (_viewModel.cellHeight - _viewModel.indicatorLeftImgHeight)/2, _viewModel.indicatorLeftImgWidth,_viewModel.indicatorLeftImgHeight);
                
            }

        }
        
    }
    return _indicatorImageView;
}

#pragma mark - logout cell
- (UILabel *)logoutLabel
{
    if (!_logoutLabel) {
         _logoutLabel = [[UILabel alloc] init];
         _logoutLabel.frame = CGRectMake(0, 0, SSJScreenWidth, _viewModel.cellHeight);
         _logoutLabel.text = @"退出登录";
         _logoutLabel.textAlignment = NSTextAlignmentCenter;
         _logoutLabel.textColor = [UIColor blackColor];
         _logoutLabel.font = SSJLogoutButtonFont;
    }
    return _logoutLabel;
}

//自定义
#pragma mark- custom mePage cell
- (UIImageView *)avatarImageView
{
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] initWithImage:self.viewModel.avatarImage];
        _avatarImageView.frame = CGRectMake(SSJImgToLeftGap, SSJImgToLeftGap, self.viewModel.cellHeight - 2*SSJImgToLeftGap,  self.viewModel.cellHeight - 2*SSJImgToLeftGap);
        
    }
    return _avatarImageView;
}

- (UILabel *)userNameLabel
{
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.text = self.viewModel.userName;
        _userNameLabel.font = [UIFont systemFontOfSize:13];
        _userNameLabel.textColor = [UIColor blackColor];
        _userNameLabel.frame = CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + SSJImgToLeftGap, self.avatarImageView.frame.origin.y + SSJImgToLeftGap/2, 150, 20);
        
    }
    return _userNameLabel;
}


- (UILabel *)userIdLabel
{
    if (!_userIdLabel) {
        _userIdLabel = [[UILabel alloc] init];
        _userIdLabel.text = self.viewModel.userID;
        _userIdLabel.font = [UIFont systemFontOfSize:12];
        _userIdLabel.textColor = [UIColor blackColor];
        _userIdLabel.frame = CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + SSJImgToLeftGap, CGRectGetMaxY(self.userNameLabel.frame) + 4, 150, 20);
    }
    return _userIdLabel;
}

- (UIImageView *)avatarIndicatorImageView
{
    if (!_avatarIndicatorImageView) {
        _avatarIndicatorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
        _avatarIndicatorImageView.frame = CGRectMake(SSJScreenWidth - SSJImgToLeftGap - _avatarIndicatorImageView.bounds.size.width, (_viewModel.cellHeight - _avatarIndicatorImageView.bounds.size.height)/2, _avatarIndicatorImageView.bounds.size.width, _avatarIndicatorImageView.bounds.size.height);
    }
    
    return _avatarIndicatorImageView;
}

- (UIImageView *)codeImageView
{
    if (!_codeImageView) {
        _codeImageView = [[UIImageView alloc] initWithImage:self.viewModel.codeImage];
        _codeImageView.frame = CGRectMake(SSJScreenWidth - SJLeftGap - _avatarIndicatorImageView.bounds.size.width - SJLeftGap - 20, (self.viewModel.cellHeight - 20)/2, 20, 20);
    }
    return _codeImageView;
}



@end
