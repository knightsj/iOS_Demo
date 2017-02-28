//
//  ViewController.m
//  collectionview_masonry_layout
//
//  Created by Sun Shijie on 2017/2/27.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "SSJMasonryLayout.h"

static NSString *CellIdentifier = @"Cell";

@interface ViewController ()<SSJMasonryLayoutDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    SSJMasonryLayout *layout = (SSJMasonryLayout*)self.collectionView.collectionViewLayout;
    layout.delegate = self;
    layout.numberOfColumns = 4;
    layout.itemHorizontalSpacing = 10;
    layout.itemVerticalSpacing = 20;
    self.collectionView.backgroundColor = [UIColor blueColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier
                                                                           forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}


#pragma mark- SSJMasonryLayoutDeleagte
- (CGFloat) collectionView:(UICollectionView*) collectionView
                    layout:(SSJMasonryLayout*) layout
  heightForItemAtIndexPath:(NSIndexPath*) indexPath {
    
    CGFloat randomHeight = 100 + (arc4random() % 140);
    return randomHeight;
}

@end
