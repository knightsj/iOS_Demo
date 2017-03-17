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
    
    //已封装好，可以直接用
    SSJStaticCellTypeSystemLogout,                          //退出登录cell（已封装好）
    SSJStaticCellTypeSystemAccessoryNone,                   //右侧没有任何控件
    SSJStaticCellTypeSystemAccessorySwitch,                 //右侧是开关
    SSJStaticCellTypeSystemAccessoryDisclosureIndicator,    //右侧是三角箭头(箭头左侧可以有一个image或者一个label，或者二者都有，根据传入的参数决定)
    
    //需要用户自己添加的自定义cell
    SSJStaticCellTypeMeAvatar,                              //个人页“我”cell
    
};

typedef void(^SwitchValueChagedBlock)(BOOL isOn);


@interface SJStaticTableviewCellViewModel : NSObject

//类型
@property (nonatomic, assign) SSJStaticCellType staticCellType;


@property (nonatomic, copy)   NSString *cellID;            //cell reuser identifier
@property (nonatomic, assign) NSInteger identifier;        //区别每个cell

//系统默认cell的控件数据
@property (nonatomic, strong) UIImage  *defaultImage;     //最左侧的image
@property (nonatomic, copy)   NSString *defaultTitle;     //cell主标题
@property (nonatomic, copy)   NSString *defaultSubTitle;  //cell副标题


//系统默认cell的控件以外的控件或者数据
@property (nonatomic, copy)   NSString *indicatorLeftTitle;                     //右侧箭头左侧的文本
@property (nonatomic, strong) UIImage *indicatorLeftImage;                      //右侧箭头左侧的image
@property (nonatomic, assign) BOOL hasIndicatorImageAndLabel;                   //右侧尖头左侧的文本和image是否同时存在
@property (nonatomic, assign) BOOL isImageFirst;                                //右侧尖头左侧的文本和image同时存在时，是否是image挨着箭头，默认是
@property (nonatomic, copy) SwitchValueChagedBlock switchValueDidChangeBlock;   //切换switch开关的时候调用的block


//长宽数据
@property (nonatomic, assign) CGFloat cellHeight;                               //cell高度,默认是44
@property (nonatomic, assign) CGSize  defatultTitleLabelSize;                   //左侧默认Label的size
@property (nonatomic, assign) CGFloat indicatorLeftImgWidth;                    //右侧图片宽度
@property (nonatomic, assign) CGFloat indicatorLeftImgHeight;                   //右侧图片高度
@property (nonatomic, assign) CGSize  indicatorLeftTitleLabelSize;              //右侧label的size



//自定义cell的数据放在这里
@property (nonatomic, strong) UIImage *avatarImage;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userID;
@property (nonatomic, strong) UIImage *codeImage;


@end
