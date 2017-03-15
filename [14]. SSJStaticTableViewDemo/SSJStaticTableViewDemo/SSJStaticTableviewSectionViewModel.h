//
//  SSJStaticTableviewSectionViewModel.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SSJStaticTableviewSectionViewModel : NSObject

@property (nonatomic,copy)   NSString *sectionHeaderTitle;       //该section的标题
@property (nonatomic,copy)   NSString *sectionFooterTitle;       //该section的标题
@property (nonatomic,strong) NSArray  *itemArray;           //该section的数据源

@property (nonatomic,assign) CGFloat  sectionHeaderHeight;  //header的高度
@property (nonatomic,assign) CGFloat  sectionFooterHeight;  //footer的高度



@end
