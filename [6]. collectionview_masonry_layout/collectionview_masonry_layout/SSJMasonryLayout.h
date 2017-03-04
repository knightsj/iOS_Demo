//
//  SSJMasonryLayout.h
//  collectionview_masonry_layout
//
//  Created by Sun Shijie on 2017/2/27.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SSJMasonryLayout;

@protocol SSJMasonryLayoutDelegate <NSObject>

@required
//数据源必须要提供高度
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(SSJMasonryLayout *)layout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface SSJMasonryLayout : UICollectionViewLayout

@property (nonatomic, assign) NSUInteger numberOfColumns;        //column数量
@property (nonatomic, assign) CGFloat itemVerticalSpacing;       //cell垂直间距
@property (nonatomic, assign) CGFloat itemHorizontalSpacing;     //cell水平间距
@property (nonatomic, weak) id<SSJMasonryLayoutDelegate>delegate;

@end
