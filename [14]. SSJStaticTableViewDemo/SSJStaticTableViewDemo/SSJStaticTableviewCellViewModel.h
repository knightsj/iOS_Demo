//
//  SSJStaticTableviewCellViewModel.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SSJConst.h"

typedef NS_ENUM(NSInteger, SSJStaticCellType) {
    
    SSJStaticCellTypeAvatar,
    SSJStaticCellTypeSystemLogout,
    SSJStaticCellTypeSystemAccessoryNone,
    SSJStaticCellTypeSystemAccessorySwitch,
    SSJStaticCellTypeSystemAccessoryDisclosureIndicator,
    
};

typedef void(^SSJStaticCellDidTap)();
typedef void(^SSJStaticCellSwitchChanged)(BOOL isOn);





@interface SSJStaticTableviewCellViewModel : NSObject

//类型
@property (nonatomic, assign) SSJStaticCellType staticCellType;


@property (nonatomic, copy, readwrite)   NSString *cellID;     //cell主标题
//系统默认cell的控件数据
@property (nonatomic, strong, readwrite) UIImage  *defaultImage;     //最左侧的image
@property (nonatomic, copy, readwrite)   NSString *defaultTitle;     //cell主标题
@property (nonatomic, copy, readwrite)   NSString *defaultSubTitle;  //cell副标题


//系统默认cell的控件以外的控件或者数据
@property (nonatomic, copy, readwrite)   NSString *indicatorLeftTitle; //右侧箭头左侧的文本
@property (nonatomic, strong, readwrite) UIImage *indicatorLeftImage; //右侧箭头左侧的image
@property (nonatomic, strong, readwrite) UIView *indicatorCustomView; //右侧尖头左侧的自定义view

//长宽数据
@property (nonatomic, assign, readwrite) CGFloat cellHeight;
@property (nonatomic, assign, readwrite) CGFloat imgHeight;
@property (nonatomic, assign, readwrite) CGSize  defatultTitleLabelSize;
@property (nonatomic, assign, readwrite) CGSize  indicatorLeftTitleLabelSize;

@property (nonatomic, copy) SSJStaticCellDidTap cellDidTapBlock;
@property (nonatomic, copy) SSJStaticCellSwitchChanged switchChangedBlock;


//自定义cell的数据放在这里
@property (nonatomic, strong, readwrite) UIImage *avatarImage;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, strong, readwrite) UIImage *codeImage;


@end
