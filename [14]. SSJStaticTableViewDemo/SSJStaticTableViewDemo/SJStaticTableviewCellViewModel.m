//
//  SJStaticTableviewCellViewModel.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableviewCellViewModel.h"


@interface SJStaticTableviewCellViewModel()



@end


@implementation SJStaticTableviewCellViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {        
        _cellHeight = 44;
        _cellID = @"defaultCell";
        _staticCellType = SSJStaticCellTypeSystemAccessoryDisclosureIndicator;//默认是三角箭头
        _isImageFirst = YES;
    }
    return self;
}

- (void)setDefaultImage:(UIImage *)defaultImage
{
    //最左侧的图片永远是固定大小
    _defaultImage = defaultImage;
    _indicatorLeftImgWidth = SJImgWidth;
    _indicatorLeftImgHeight = SJImgWidth;
}

- (void)setDefaultTitle:(NSString *)defaultTitle
{
    _defaultTitle = defaultTitle;
    _defatultTitleLabelSize = [self sizeForTitle:defaultTitle withFont:SJDefaultTitleFont];
    
    //very long title
    if (_defatultTitleLabelSize.width > SJTitleLimit) {
        CGSize size = _defatultTitleLabelSize;
        size.width = SJTitleLimit;
        _defatultTitleLabelSize = size;
    }
}

- (void)setIndicatorLeftTitle:(NSString *)indicatorLeftTitle
{
    _indicatorLeftTitle = indicatorLeftTitle;
    _indicatorLeftTitleLabelSize = [self sizeForTitle:_indicatorLeftTitle withFont:SJIndicatorLeftTitleFont];
    
    //very long title
    if (_indicatorLeftTitleLabelSize.width > SJTitleLimit) {
        CGSize size = _indicatorLeftTitleLabelSize;
        size.width = SJTitleLimit;
        _indicatorLeftTitleLabelSize = size;
    }
    
    if (_indicatorLeftImage) {
        _hasIndicatorImageAndLabel = YES;
    }
}

- (void)setIndicatorLeftImage:(UIImage *)indicatorLeftImage
{
    _indicatorLeftImage = indicatorLeftImage;
    
    CGFloat limitHeight = self.cellHeight - 2*SJTopGap;
        
    if (_indicatorLeftImage.size.height < limitHeight) {
        _indicatorLeftImgHeight = _indicatorLeftImage.size.height;
        _indicatorLeftImgWidth = _indicatorLeftImage.size.width;
    }else{
        //very high image
        _indicatorLeftImgHeight = limitHeight;
        _indicatorLeftImgWidth = (_indicatorLeftImage.size.width / _indicatorLeftImage.size.height) * _indicatorLeftImgHeight ;
    }
    
    if (_indicatorLeftTitle) {
        _hasIndicatorImageAndLabel = YES;
    }
}





- (CGSize)sizeForTitle:(NSString *)title withFont:(UIFont *)font
{
    CGRect titleRect = [title boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX)
                                           options:NSStringDrawingUsesLineFragmentOrigin
                                        attributes:@{NSFontAttributeName : font}
                                           context:nil];
    
    return CGSizeMake(titleRect.size.width,
                      titleRect.size.height);
}

@end

