//
//  SSJConst.h
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/14.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#ifndef SSJConst_h
#define SSJConst_h

//distance
#define SSJScreenWidth      [UIScreen mainScreen].bounds.size.width
#define SSJScreenHeight     [UIScreen mainScreen].bounds.size.height
#define SSJScreenBounds     [UIScreen mainScreen].bounds

#define SJTopGap 8    //same as bottom gap
#define SJLeftGap 14   //same as right gap
#define SSJImgToLeftGap 14
#define SSJImgWidth 30
#define SSJTitleLimit 100

//image
#define SJIndicatorArrow @"arrow"


//font
#define SSJDefaultTitleFont [UIFont systemFontOfSize:14]
#define SSJLogoutButtonFont [UIFont systemFontOfSize:16]
#define SSJIndicatorLeftTitleFont [UIFont systemFontOfSize:12]

//color
#define SSJDefaultTitleColor           SSJColorWithRGB(0,0,0,1)
#define SSJIndicatorLeftTitleColor     SSJColorWithRGB(30,30,30,1)
#define SSJColorWithRGB(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#endif /* SSJConst_h */
