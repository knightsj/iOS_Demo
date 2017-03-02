# iOS_Demo
保存工作和学习过程中使用，学习到的Demo


##  [1]. block_pass_value

使用block作为方法的参数，实现界面反向传值。

## [2]. multi_image_cache_and_download

使用NSBlockOperation和NSCache，实现tableViewcell里加载网络图片，并带有缓存功能（仿照SDWebImage的逻辑）。

## [3]. init_and_initWithFrame

对于UIView，即使是用``init``方法创建实例，也会先调用``initWithFrame:``方法，然后再调用``init``方法。

## [4]. clean_tableview

- 将tableview的datasource单独抽取出来作为一个类，减少viewcontroller的代码量。
- cell的绘制方法使用block函数调用。

## [5]. associate_object
在分类中使用关联对象给类添加属性。

## [6]. collectionview_masonry_layout
瀑布流的实现，自定义cell的垂直，水平间距，以及列数。

![](http://oih3a9o4n.bkt.clouddn.com/masonry_collectionview.gif)

```objc
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    SSJMasonryLayout *layout = (SSJMasonryLayout*)self.collectionView.collectionViewLayout;
    layout.delegate = self;
    layout.numberOfColumns = 4;
    layout.itemHorizontalSpacing = 10;
    layout.itemVerticalSpacing = 20;
}

#pragma mark- SSJMasonryLayoutDeleagte
- (CGFloat) collectionView:(UICollectionView*) collectionView
                    layout:(SSJMasonryLayout*) layout
  heightForItemAtIndexPath:(NSIndexPath*) indexPath {
    
    CGFloat randomHeight = 100 + (arc4random() % 140);
    return randomHeight;
}
```

## [7]. oc_js_interaction
OC与JS代码的简单交互。
![](http://oih3a9o4n.bkt.clouddn.com/oc_js_2.png)

