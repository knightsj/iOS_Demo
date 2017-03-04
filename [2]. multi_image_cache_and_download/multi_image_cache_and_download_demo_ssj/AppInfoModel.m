//
//  AppInfoModel.m
//  multi_image_cache_and_download_demo_ssj
//
//  Created by Sun Shijie on 2017/2/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "AppInfoModel.h"

@implementation AppInfoModel

+(instancetype)appWithDict:(NSDictionary *)dict
{
    AppInfoModel *appInfo = [[AppInfoModel alloc]init];
    [appInfo setValuesForKeysWithDictionary:dict];
    
    return appInfo;
}

@end
