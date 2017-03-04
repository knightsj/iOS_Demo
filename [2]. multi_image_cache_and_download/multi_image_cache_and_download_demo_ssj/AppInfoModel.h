//
//  AppInfoModel.h
//  multi_image_cache_and_download_demo_ssj
//
//  Created by Sun Shijie on 2017/2/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfoModel : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *download;

+(instancetype)appWithDict:(NSDictionary *)dict;

@end
