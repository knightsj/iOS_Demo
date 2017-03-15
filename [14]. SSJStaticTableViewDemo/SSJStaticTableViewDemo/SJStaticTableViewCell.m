//
//  SJStaticTableViewCell.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableViewCell.h"

@implementation SJStaticTableViewCell


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
        _userNameLabel.frame = CGRectMake(CGRectGetMaxX(self.avatarImageView.frame) + SSJImgToLeftGap, self.avatarImageView.frame.origin.y + SSJImgToLeftGap/2, 150, 20);
        
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
        _userIdLabel.frame = CGRectMake(self.userNameLabel.frame.origin.x, CGRectGetMaxY(self.userNameLabel.frame) + 4, 150, 20);
    }
    return _userIdLabel;
}

- (UIImageView *)codeImageView
{
    if (!_codeImageView) {
        _codeImageView = [[UIImageView alloc] initWithImage:self.viewModel.codeImage];
        _codeImageView.frame = CGRectMake(self.indicatorArrow.frame.origin.x - SSJImgToLeftGap - 20, (self.viewModel.cellHeight - 20)/2, 20, 20);
    }
    return _codeImageView;
}

- (UIImageView *)avatarIndicatorImageView
{
    if (!_avatarIndicatorImageView) {
        _avatarIndicatorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
        _avatarIndicatorImageView.frame = CGRectMake(SSJScreenWidth - SSJImgToLeftGap - _avatarIndicatorImageView.bounds.size.width, (_viewModel.cellHeight - _avatarIndicatorImageView.bounds.size.height)/2, _avatarIndicatorImageView.bounds.size.width, _avatarIndicatorImageView.bounds.size.height);
    }
    
    return _avatarIndicatorImageView;
}

@end
