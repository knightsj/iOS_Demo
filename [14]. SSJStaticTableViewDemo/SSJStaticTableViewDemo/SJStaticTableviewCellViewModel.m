//
//  SJStaticTableviewCellViewModel.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableviewCellViewModel.h"


@interface SJStaticTableviewCellViewModel()

@property (nonatomic, assign, readwrite) BOOL hasIndicatorImageAndLabel;                   //右侧尖头左侧的文本和image是否同时存在
@property (nonatomic, assign, readwrite) CGSize  leftTitleLabelSize;                   //左侧默认Label的size
@property (nonatomic, assign, readwrite) CGFloat indicatorLeftImgWidth;                    //右侧图片宽度
@property (nonatomic, assign, readwrite) CGFloat indicatorLeftImgHeight;                   //右侧图片高度
@property (nonatomic, assign, readwrite) CGSize  indicatorLeftLabelSize;              //右侧label的size

@end


@implementation SJStaticTableviewCellViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {        
        _cellHeight = 44;
        _cellID = @"defaultCell";
        _staticCellType = SSJStaticCellTypeSystemAccessoryDisclosureIndicator;//默认是存在三角箭头的cell
        _isImageFirst = YES;
        //都是默认配置
        _leftLabelTextFont = SJLeftTitleTextFont;
        _leftLabelTextColor = SJLeftTitleTextColor;
        _leftImageSize = CGSizeMake(SJImgWidth, SJImgWidth);
        _indicatorLeftLabelTextFont = SJIndicatorLeftTitleTextFont;
        _indicatorLeftLabelTextColor = SJIndicatorLeftTitleTextColor;
        _indicatorLeftImageSize = CGSizeMake(SJImgWidth, SJImgWidth);
    }
    return self;
}


- (void)setLeftTitle:(NSString *)leftTitle
{
    if (_leftTitle != leftTitle) {
        
        _leftTitle = leftTitle;
        _leftTitleLabelSize = [self sizeForTitle:leftTitle withFont:_leftLabelTextFont];
        
        //very long title
        if (_leftTitleLabelSize.width > SJTitleLimit) {
            CGSize size = _leftTitleLabelSize;
            size.width = SJTitleLimit;
            _leftTitleLabelSize = size;
        }
        
    }
}

- (void)setIndicatorLeftTitle:(NSString *)indicatorLeftTitle
{
    if (_indicatorLeftTitle != indicatorLeftTitle) {
        
        _indicatorLeftTitle = indicatorLeftTitle;
        _indicatorLeftLabelSize = [self sizeForTitle:_indicatorLeftTitle withFont:_indicatorLeftLabelTextFont];
        
        //very long title
        if (_indicatorLeftLabelSize.width > SJTitleLimit) {
            CGSize size = _indicatorLeftLabelSize;
            size.width = SJTitleLimit;
            _indicatorLeftLabelSize = size;
        }
        
        if (_indicatorLeftImage) {
            _hasIndicatorImageAndLabel = YES;
        }
    }
}

- (void)setIndicatorLeftImage:(UIImage *)indicatorLeftImage
{
    if (_indicatorLeftImage != indicatorLeftImage) {
        
        _indicatorLeftImage = indicatorLeftImage;
        
        CGFloat limitHeight = self.cellHeight - 2*SJTopGap;
        
        if (_indicatorLeftImage.size.height < limitHeight) {
            _indicatorLeftImgHeight = _indicatorLeftImage.size.height;
            _indicatorLeftImgWidth = _indicatorLeftImage.size.width;
            
        }else{
            // image with very large height
            _indicatorLeftImgHeight = limitHeight;
            _indicatorLeftImgWidth = (_indicatorLeftImage.size.width / _indicatorLeftImage.size.height) * _indicatorLeftImgHeight ;
        }
        
        if (_indicatorLeftTitle) {
            _hasIndicatorImageAndLabel = YES;
        }
        
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

