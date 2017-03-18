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
#define SJScreenWidth      [UIScreen mainScreen].bounds.size.width
#define SJScreenHeight     [UIScreen mainScreen].bounds.size.height

#define SJTopGap 8               //same as bottom gap
#define SJLeftGap 14             //same as right gap
#define SJRightMiddleGap 6       //in right part: the gap between image and label
#define SJImgWidth 30
#define SJTitleLimit 140


//image
#define SJIndicatorArrow @"arrow"


//font
#define SJLeftTitleTextFont           [UIFont systemFontOfSize:15]
#define SJLogoutButtonFont        [UIFont systemFontOfSize:16]
#define SJIndicatorLeftTitleTextFont  [UIFont systemFontOfSize:13]

//color
#define SJLeftTitleTextColor              [UIColor blackColor]
#define SJIndicatorLeftTitleTextColor     SJColorWithRGB(136,136,136,1)
#define SJColorWithRGB(R,G,B,A)       [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#endif /* SSJConst_h */
