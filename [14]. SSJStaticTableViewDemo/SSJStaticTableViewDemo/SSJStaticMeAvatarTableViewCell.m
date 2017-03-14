//
//  SSJStaticMeAvatarTableViewCell.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SSJStaticMeAvatarTableViewCell.h"
#import "SSJStaticTableviewCellViewModel.h"

@interface SSJStaticMeAvatarTableViewCell()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *userIdLabel;
@property (nonatomic, strong) UIImageView *codeImageView;
@property (nonatomic, strong) UIImageView *avatarIndicatorImageView;

@end

@implementation SSJStaticMeAvatarTableViewCell


- (void)setAvatarViewModel:(SSJStaticTableviewCellViewModel *)avatarViewModel{
    
    _avatarViewModel = avatarViewModel;
    
    [self.contentView addSubview:self.avatarImageView];
    [self.contentView addSubview:self.userNameLabel];
    [self.contentView addSubview:self.userIdLabel];
    [self.contentView addSubview:self.avatarIndicatorImageView];
    [self.contentView addSubview:self.codeImageView];
    
}

- (UIImageView *)avatarImageView
{
    if (!_avatarImageView) {
         _avatarImageView = [[UIImageView alloc] initWithImage:self.avatarViewModel.avatarImage];
         _avatarImageView.frame = CGRectMake(SSJImgToLeftGap, SSJImgToLeftGap, self.avatarViewModel.cellHeight - 2*SSJImgToLeftGap,  self.avatarViewModel.cellHeight - 2*SSJImgToLeftGap);
        
    }
    return _avatarImageView;
}

- (UILabel *)userNameLabel
{
    if (!_userNameLabel) {
         _userNameLabel = [[UILabel alloc] init];
         _userNameLabel.text = self.avatarViewModel.userName;
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
         _userIdLabel.text = self.avatarViewModel.userID;
         _userIdLabel.font = [UIFont systemFontOfSize:12];
         _userIdLabel.textColor = [UIColor blackColor];
         _userIdLabel.frame = CGRectMake(self.userNameLabel.frame.origin.x, CGRectGetMaxY(self.userNameLabel.frame) + 4, 150, 20);
    }
    return _userIdLabel;
}

- (UIImageView *)codeImageView
{
    if (!_codeImageView) {
         _codeImageView = [[UIImageView alloc] initWithImage:self.avatarViewModel.codeImage];
        _codeImageView.frame = CGRectMake(self.indicatorArrow.frame.origin.x - SSJImgToLeftGap - 20, (self.avatarViewModel.cellHeight - 20)/2, 20, 20);
    }
    return _codeImageView;
}

- (UIImageView *)avatarIndicatorImageView
{
    if (!_avatarIndicatorImageView) {
         _avatarIndicatorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"]];
         _avatarIndicatorImageView.frame = CGRectMake(SSJScreenWidth - SSJImgToLeftGap - _avatarIndicatorImageView.bounds.size.width, (_avatarViewModel.cellHeight - _avatarIndicatorImageView.bounds.size.height)/2, _avatarIndicatorImageView.bounds.size.width, _avatarIndicatorImageView.bounds.size.height);
    }
    
    return _avatarIndicatorImageView;
}




@end
