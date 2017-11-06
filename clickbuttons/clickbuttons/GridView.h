//
//  GridView.h
//  clickbuttons
//
//  Created by Sun Shijie on 2017/11/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GridView;
@protocol GridViewDelegate <NSObject>

- (void)returnInfo:(NSDictionary *)infoDict grid:(GridView*)grid;

@end



@interface GridView : UIView

@property (nonatomic, weak) id<GridViewDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame infoDict:(NSDictionary *)infoDict;
- (void)refreshState:(BOOL)state;
@end
