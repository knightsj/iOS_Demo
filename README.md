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
    //自定义列数，cell的水平距离，cell的垂直距离
    layout.numberOfColumns = 4;
    layout.itemHorizontalSpacing = 10;
    layout.itemVerticalSpacing = 20;
}

#pragma mark- SSJMasonryLayoutDeleagte
- (CGFloat) collectionView:(UICollectionView*) collectionView
                    layout:(SSJMasonryLayout*) layout
  heightForItemAtIndexPath:(NSIndexPath*) indexPath {
    //提供cell的随机高度
    CGFloat randomHeight = 100 + (arc4random() % 140);
    return randomHeight;
}
```

## [7]. oc_js_interaction
OC与JS代码的简单交互。
![](http://oih3a9o4n.bkt.clouddn.com/oc_js_4.png)

## [8]. access_private_property
用KVC和runtime改变私有属性。

#### 1. 定义公有属性和私有属性：

```objc
@interface Person : NSObject
@property (nonatomic, copy) NSString *name;//公共属性
@end

@interface Person()
@property (nonatomic, copy) NSString *job;//私有属性
@end

@implementation Person
{
    NSString *_country;//私有成员变量
}
```

#### 2. 使用kvc修改公共属性和私有属性以及私有成员变量
```objc
[person setValue:@"jack" forKey:@"name"];//公共属性
[person setValue:@"coder" forKey:@"job"];//私有属性
[person setValue:@"China" forKey:@"country"];//私有成员变量
NSLog(@"kvc改变成员变量的值：%@",person);//name:jack, job:coder, country:China
```

####3. 使用runtime修改私有属性以及私有成员变量
```objc
[self changeIvarOfObject:person withIvarName:@"_job" toValue:@"manager"];
[self changeIvarOfObject:person withIvarName:@"_country" toValue:@"America"];
NSLog(@"runtime 改变成员变量的值：%@",person);//name:Bob, job:manager, country:America

- (void)changeIvarOfObject:(id)object withIvarName:(NSString *)name toValue:(NSString *)value
{
    Ivar ivar = class_getInstanceVariable([object class], [name UTF8String]);    
    object_setIvar(object, ivar, value);
}
```


