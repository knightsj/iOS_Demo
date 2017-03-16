//
//  SJStaticTableviewCellViewModel.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SSJConst.h"

typedef NS_ENUM(NSInteger, SSJStaticCellType) {
    
    SSJStaticCellTypeSystemAccessoryNone,                   //右侧没有任何控件
    SSJStaticCellTypeSystemAccessorySwitch,                 //右侧是开关
    SSJStaticCellTypeSystemAccessoryDisclosureIndicator,    //右侧是三角箭头
    
    SSJStaticCellTypeMeAvatar,                              //个人页“我”cell
    SSJStaticCellTypeSystemLogout,                          //退出cell
    
};

typedef void(^SSJStaticCellDidTap)();
typedef void(^SSJStaticCellSwitchChanged)(BOOL isOn);



@interface SJStaticTableviewCellViewModel : NSObject

//类型
@property (nonatomic, assign) SSJStaticCellType staticCellType;


@property (nonatomic, copy, readwrite)   NSString *cellID;     //cell reuser identifier

@property (nonatomic, assign) NSInteger identifier;            //区别每个cell

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
