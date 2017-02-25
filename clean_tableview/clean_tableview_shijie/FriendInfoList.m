//
//  FriendInfoList.m
//  tableview_datasource_seperate_demo
//
//  Created by Sun Shijie on 2017/1/24.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "FriendInfoList.h"

@implementation FriendInfoList

+(NSArray *)friendInfoList
{
    NSArray *originalDataArray = @[
                                   
                                   @{
                                       @"name":@"Jack",
                                       },
                                   
                                   @{
                                       @"name":@"Rose",
                                       },
                                   @{
                                       @"name":@"Bob",
                                       },
                                   @{
                                       @"name":@"Lucy",
                                       },
                                   @{
                                       @"name":@"Duck",
                                       },
                                   @{
                                       @"name":@"Lily",
                                       },
                                   
                                   ];
    
    return originalDataArray;
}

@end
