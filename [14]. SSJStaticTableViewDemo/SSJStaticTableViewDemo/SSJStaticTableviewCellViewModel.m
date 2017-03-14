//
//  SSJStaticTableviewCellViewModel.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SSJStaticTableviewCellViewModel.h"


@interface SSJStaticTableviewCellViewModel()



@end


@implementation SSJStaticTableviewCellViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cellHeight = 44;
        _cellID = @"defaultCell";
        
    }
    return self;
}

- (void)setDefaultImage:(UIImage *)defaultImage
{
    _defaultImage = defaultImage;
    _imgHeight = SSJImgWidth;
}

- (void)setDefaultTitle:(NSString *)defaultTitle
{
    _defaultTitle = defaultTitle;
    _defatultTitleLabelSize = [self sizeForTitle:defaultTitle withFont:SSJDefaultTitleFont];
    
    //long title
    if (_defatultTitleLabelSize.width > SSJTitleLimit) {
        CGSize size = _defatultTitleLabelSize;
        size.width = SSJTitleLimit;
        _defatultTitleLabelSize = size;
    }
}

- (void)setIndicatorLeftTitle:(NSString *)indicatorLeftTitle
{
    _indicatorLeftTitle = indicatorLeftTitle;
    _indicatorLeftTitleLabelSize = [self sizeForTitle:_indicatorLeftTitle withFont:SSJIndicatorLeftTitleFont];
    
    //long title
    if (_indicatorLeftTitleLabelSize.width > SSJTitleLimit) {
        CGSize size = _indicatorLeftTitleLabelSize;
        size.width = SSJTitleLimit;
        _indicatorLeftTitleLabelSize = size;
    }
}

- (void)setIndicatorLeftImage:(UIImage *)indicatorLeftImage
{
    _indicatorLeftImage = indicatorLeftImage;
    _imgHeight = SSJImgWidth;
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

