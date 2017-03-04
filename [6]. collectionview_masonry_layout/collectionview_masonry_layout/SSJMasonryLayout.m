//
//  SSJMasonryLayout.m
//  collectionview_masonry_layout
//
//  Created by Sun Shijie on 2017/2/27.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SSJMasonryLayout.h"

static const NSUInteger numOfColumns = 3;
static const CGFloat spacing = 10;

@interface SSJMasonryLayout()

@property (nonatomic, strong) NSMutableDictionary *maxYValueForColumns;
@property (nonatomic, strong) NSMutableDictionary *totalItemslayout;
@property (nonatomic, assign) CGFloat itemHeight;

@end

@implementation SSJMasonryLayout

- (void)prepareLayout
{
    [self basicConfiguration];
    
    self.maxYValueForColumns = [NSMutableDictionary dictionary];
    self.totalItemslayout = [NSMutableDictionary dictionary];
    
    
    CGFloat totalWidth = self.collectionView.frame.size.width;
    CGFloat contentWith = totalWidth - (self.itemHorizontalSpacing *(self.numberOfColumns +1));
    CGFloat itemWidth = contentWith/self.numberOfColumns;
    
    NSIndexPath *indexPath;
    CGFloat currentColumn = 0;
    
    NSInteger numOfSections = [self.collectionView numberOfSections];
    
    for (NSInteger sectionIndex = 0; sectionIndex < numOfSections; sectionIndex ++) {
        
        NSInteger numOfItems = [self.collectionView numberOfItemsInSection:sectionIndex];
        
        for (NSInteger itemIndex = 0; itemIndex <numOfItems; itemIndex ++) {
            indexPath = [NSIndexPath indexPathForItem:itemIndex inSection:sectionIndex];
            
            //每个item对应自己专属的layoutAttribute
            UICollectionViewLayoutAttributes *itemAttributes =
            [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            
            //计算每个cell的rect，保存在itemAttributes里面
            CGFloat x = self.itemHorizontalSpacing + (self.itemHorizontalSpacing + itemWidth) * currentColumn;
            CGFloat y = [self.maxYValueForColumns[@(currentColumn)] doubleValue];
            
            //数据源方法，提取随机的cell高度
            CGFloat itemHeight = [self.delegate collectionView:self.collectionView layout:self heightForItemAtIndexPath:indexPath];
            
            itemAttributes.frame = CGRectMake(x, y, itemWidth, itemHeight);
            
            //计算最低点值（当前cell高度+竖直间距）
            y += itemHeight;
            y += self.itemVerticalSpacing;
            
            //替换最低点值
            self.maxYValueForColumns[@(currentColumn)] = @(y);
            
            currentColumn ++;
            
            //换行操作，重置为0
            if (currentColumn == self.numberOfColumns) {
                currentColumn = 0;
            }
            self.totalItemslayout[indexPath] = itemAttributes;
        }
    }
}

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{

    //返回UICollectionViewLayoutAttributes数组
    NSMutableArray *allAttributes = [NSMutableArray arrayWithCapacity:self.totalItemslayout.count];
    
    [self.totalItemslayout enumerateKeysAndObjectsUsingBlock:^(NSIndexPath *indexPath, UICollectionViewLayoutAttributes *attributes, BOOL * _Nonnull stop) {
        
        if (CGRectIntersectsRect(rect, attributes.frame)){
            [allAttributes addObject:attributes];
        }
        
    }];
    
    return allAttributes;
    
}


-(CGSize)collectionViewContentSize {
    
    NSUInteger currentColumn = 0;
    CGFloat maxHeight = 0;
    do {
        CGFloat height = [self.maxYValueForColumns[@(currentColumn)] doubleValue];
        if(height > maxHeight)
            maxHeight = height;
        currentColumn ++;
    } while (currentColumn < self.numberOfColumns);
    
    return CGSizeMake(self.collectionView.frame.size.width, maxHeight);
}


- (void)basicConfiguration
{
    //如果没有自定义，就使用默认配置
    if (!self.numberOfColumns) {
        self.numberOfColumns = numOfColumns;
    };
    
    if (!self.itemHorizontalSpacing) {
        self.itemHorizontalSpacing = spacing;
    }
    
    if (!self.itemVerticalSpacing) {
        self.itemVerticalSpacing = spacing;
    }
}
@end
