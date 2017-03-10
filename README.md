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
## [9]. custom_segue
自定义转场动画:将push显示为model:新建一个类继承``UIStoryboardSegue``，然后重写``perform``方法。

```objc
#import "CustomSegue.h"

@implementation CustomSegue

- (void)perform
{
    UIViewController *fromVC = (UIViewController *)self.sourceViewController;
    UIViewController *toVC = (UIViewController*)self.destinationViewController;
    
    //获取第一个页面初始状态的frame
    CGRect f = fromVC.view.frame;
    CGRect originalSourceRect = fromVC.view.frame;
    
    f.origin.y = f.size.height;
    
     //令第二个页面在开始的时候位于屏幕底部
     toVC.view.frame = f;
     toVC.view.alpha = 0.0f;
    [[fromVC.view superview] addSubview:toVC.view];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        //令第二个页面的frame等于第一个页面初始状态的frame（满屏）
        toVC.view.frame = originalSourceRect;
        toVC.view.alpha = 1.0f;
        
    } completion:^(BOOL finished) {
        
        [toVC.view removeFromSuperview];
         fromVC.view.alpha = 1.0f;
        [fromVC.navigationController pushViewController:toVC animated:NO];
        
    }];
}
```
![](http://oih3a9o4n.bkt.clouddn.com/custom_segue.gif)

## [10]. mvvm_kvo_two_way_binding

用FBKVOController实现的mvvm的双向绑定。

#### viewmodel监听model的变化：
```objc
//模拟网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //新请求下来一个model
        self.model = [[SJModel alloc] init];
        self.model.number = arc4random() % 100;;
        
        //viewmodel监听model的改变
        [self.KVOController observe:self.model keyPath:@"number" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
             NSLog(@"viewmodel监听到了model的改变后，立即改变自己被控制器监听的属性");
             self.contentStr = [self convertNumber:self.model.number];
            
        }];
    });
```
#### view监听viewmodel的变化：

```objc
- (instancetype)initWithViewModel:(SJViewModel *)viewModel
{
    self = [super init];
    
    if (self) {
        
        self.viewModel = viewModel;
        
        //view监听viewmodel的contentStr属性的改变，一旦改变，刷新自己
        [self.KVOController observe:self.viewModel keyPath:@"contentStr" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
            NSLog(@"当view监听到了viewmodel的改变后，立即改变自己");
            self.label.text = self.viewModel.contentStr;
        }];
    }
    return self;
}
```

## [11]. multi_thread_communication
线程通信的几个例子：NSOperation，GCD，NSObject


## [12]. gcd_demo
介绍了GCD的API：dispatch_barrier，dispatch_wait，dispatch_group，dispatch_apply等

## [13]. autoresizing_demo
由xib生成的view默认会跟随父控件大小的变化而变化。如果不让二者有依赖性，需要设置view的autoresizingMask属性。

```objc
UIView *subview = [[NSBundle mainBundle] loadNibNamed:@"subview" owner:nil options:nil].firstObject;
    
//不让xib的view随着父控件的大小而变化
subview.autoresizingMask = UIViewAutoresizingNone;
```

