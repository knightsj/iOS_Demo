//
//  SJStaticTableviewSectionViewModel.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SJStaticTableviewSectionViewModel.h"
#import "SSJConst.h"
#import "SJStaticTableviewCellViewModel.h"

@implementation SJStaticTableviewSectionViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sectionHeaderHeight = 10;
        _sectionFooterHeight = 10;
    }
    return self;
}

- (instancetype)initWithcellViewModelsArray:(NSArray *)cellViewModelsArray
{
    self = [super init];
    if (self) {
        _sectionHeaderHeight = 10;
        _sectionFooterHeight = 10;
        _leftLabelTextFont = SJLeftTitleTextFont;
        _leftLabelTextColor = SJLeftTitleTextColor;
        _leftImageSize = CGSizeMake(SJImgWidth, SJImgWidth);
        _indicatorLeftLabelTextFont = SJIndicatorLeftTitleTextFont;
        _indicatorLeftLabelTextColor = SJIndicatorLeftTitleTextColor;
        _indicatorLeftImageSize = CGSizeMake(SJImgWidth, SJImgWidth);
        _cellViewModelsArray = cellViewModelsArray;
    }
    return self;
}

- (void)setLeftLabelTextFont:(UIFont *)leftLabelTextFont
{
    
    if (![self font1:_leftLabelTextFont hasSameFontSizeOfFont2:leftLabelTextFont]) {
        
         _leftLabelTextFont = leftLabelTextFont;
        [_cellViewModelsArray makeObjectsPerformSelector:@selector(setLeftLabelTextFont:) withObject:_leftLabelTextFont];

    }
}

- (void)setLeftLabelTextColor:(UIColor *)leftLabelTextColor
{
    if (![self color1:_leftLabelTextColor hasTheSameRGBAOfColor2:leftLabelTextColor]) {
         _leftLabelTextColor = leftLabelTextColor;
        [_cellViewModelsArray makeObjectsPerformSelector:@selector(setLeftLabelTextColor:) withObject:_leftLabelTextColor];
    }
}

- (void)setLeftImageSize:(CGSize)leftImageSize
{
    SJStaticTableviewCellViewModel *viewMoel = _cellViewModelsArray.firstObject;
    
    CGFloat cellHeight = viewMoel.cellHeight;
    if ( (!CGSizeEqualToSize(_leftImageSize, leftImageSize)) && (leftImageSize.height < cellHeight)) {
        _leftImageSize = leftImageSize;
        [_cellViewModelsArray enumerateObjectsUsingBlock:^(SJStaticTableviewCellViewModel *viewModel, NSUInteger idx, BOOL * _Nonnull stop)
        {
            viewMoel.leftImageSize = _leftImageSize;
        }];
    }
}

- (void)setIndicatorLeftLabelTextFont:(UIFont *)indicatorLeftLabelTextFont
{
    if (![self font1:_indicatorLeftLabelTextFont hasSameFontSizeOfFont2:indicatorLeftLabelTextFont]) {
        _indicatorLeftLabelTextFont = indicatorLeftLabelTextFont;
        [_cellViewModelsArray makeObjectsPerformSelector:@selector(setIndicatorLeftLabelTextFont:) withObject:_indicatorLeftLabelTextFont];
    }
}

- (void)setIndicatorLeftLabelTextColor:(UIColor *)indicatorLeftLabelTextColor
{
    if (![self color1:_indicatorLeftLabelTextColor hasTheSameRGBAOfColor2:indicatorLeftLabelTextColor]) {
        _indicatorLeftLabelTextColor = indicatorLeftLabelTextColor;
        [_cellViewModelsArray makeObjectsPerformSelector:@selector(setIndicatorLeftLabelTextColor:) withObject:_indicatorLeftLabelTextColor];
    }
}


- (void)setIndicatorLeftImageSize:(CGSize)indicatorLeftImageSize
{
    SJStaticTableviewCellViewModel *viewMoel = _cellViewModelsArray.firstObject;
    CGFloat cellHeight = viewMoel.cellHeight;
    
    if ( (!CGSizeEqualToSize(_leftImageSize, indicatorLeftImageSize)) && (indicatorLeftImageSize.height < cellHeight)) {
        
        _indicatorLeftImageSize = indicatorLeftImageSize;
        
        [_cellViewModelsArray enumerateObjectsUsingBlock:^(SJStaticTableviewCellViewModel *viewModel, NSUInteger idx, BOOL * _Nonnull stop)
         {
             viewMoel.indicatorLeftImageSize = _indicatorLeftImageSize;
         }];
    }
    
}

//判断字体大小是否一致
- (BOOL)font1:(UIFont *)font1 hasSameFontSizeOfFont2:(UIFont *)font2
{
    BOOL res = NO;
    UIFontDescriptor *font1Des = font1.fontDescriptor;
    NSNumber *font1Number = [font1Des objectForKey:@"NSFontSizeAttribute"];
    
    UIFontDescriptor *font2Des = font2.fontDescriptor;
    NSNumber *font2Number = [font2Des objectForKey:@"NSFontSizeAttribute"];
    
    if ([font1Number integerValue] == [font2Number integerValue]) {
        res = YES;
    }
    
    return res;
}

//判断颜色是否相等
- (BOOL)color1:(UIColor *)color1 hasTheSameRGBAOfColor2:(UIColor *)color2
{
    BOOL res = NO;
    
    CGFloat red1,red2,green1,green2,blue1,blue2,alpha1,alpha2;
    
    //取出color1的背景颜色的RGBA值
    [color1 getRed:&red1 green:&green1 blue:&blue1 alpha:&alpha1];
    
    //取出color2的背景颜色的RGBA值
    [color2 getRed:&red2 green:&green2 blue:&blue2 alpha:&alpha2];
    
    if ((red1 == red2)&&(green1 == green2)&&(blue1 == blue2)&&(alpha1 == alpha2)) {
        res = YES;
    }
    
    return res;
}


@end
