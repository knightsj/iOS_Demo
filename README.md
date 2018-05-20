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


## [14].block_lowlevel_analysis
block的底层分析

## [15].method_swizzling
使用runtime交换方法（类方法，实例方法）


交换类方法：
```objc
+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        SEL originalSelector = @selector(imageNamed:);
        SEL swizzledSelector = @selector(sj_imageNamed:);
        
        Method originalMethod = class_getClassMethod(self, originalSelector);
        Method swizzledMethod = class_getClassMethod(self, swizzledSelector);
        
        //交换实现
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

+ (UIImage *)sj_imageNamed:(NSString *)name
{

    UIImage *image = [UIImage sj_imageNamed:name];
    
    if (image) {
        NSLog(@"图片加载成功");
    } else {
        NSLog(@"图片加载失败");
    }
    
    return image;
}
```


交换实例方法：
```objc
+ (void)load {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(sj_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        //交换实现
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (void)sj_viewWillAppear:(BOOL)animated {
    [self sj_viewWillAppear:animated];
    NSLog(@"viewWillAppear: %@", self);
}
```

## [16]. kvo_array_count
使用runtime交换方法来同志array count是否变化（未完成）

## [17]. class_addMethod_demo
给类添加方法：避免在运行时收到某个没有实现的方法。
```objc
#import "Car+Fly.h"
#import <objc/runtime.h>

void beginToFly(id self, SEL _cmd) {
    NSLog(@"begin to fly");
}


@implementation Car (Fly)

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    //如果是fly方法，目前没有这个方法的实现，于是就添加一个fly方法
    if (sel == @selector(fly)) {
        class_addMethod([self class], sel, (IMP)beginToFly, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
@end
```

## [18]. kvc_demo

使用kvc访问共有属性，私有属性，keypath，集合操作等。
```objc
//set public ivar
    [person setValue:@"Peter" forKey:@"name"];
    NSLog(@"name:%@",person.name);
    
    //set public _ivar
    [person setValue:@"male" forKey:@"_sex"];
    NSLog(@"sex:%@",[person valueForKey:@"_sex"]);
    
    //set privacy ivar
    [person setValue:@"centry road" forKey:@"address"];
    NSLog(@"address: %@",[person valueForKey:@"address"]);
    
    //set privacy _ivar
    [person setValue:@"China" forKey:@"_country"];
    NSLog(@"country: %@",[person valueForKey:@"_country"]);
    
    //set primary type
    [person setValue:[NSNumber numberWithInteger:12] forKey:@"money"];
    NSLog(@"set money: %ld",person.money);
    NSLog(@"query money: %@",[person valueForKey:@"money"]);
    
    //set keypath
    [person setValue:@"Apple" forKeyPath:@"company.name"];
    NSLog(@"name of company: %@",[person valueForKeyPath:@"company.name"]);
    
    //collection
    person.friends = @[@"Jim",@"Brunce",@"Nancy"];
    NSNumber *count = [person valueForKeyPath: @"friends.@count"];
    NSLog(@"number of friend: %ld", [count integerValue]);
    
    //start from person
    NSNumber *avg = [person valueForKeyPath: @"products.@avg.price"];
    NSLog(@"avg of products: %ld", [avg integerValue]);
    
    NSNumber *max = [person valueForKeyPath: @"products.@max.price"];
    NSLog(@"max of products: %ld", [max integerValue]);
    
    NSNumber *min = [person valueForKeyPath: @"products.@min.price"];
    NSLog(@"min of products: %ld", [min integerValue]);
    
    NSNumber *sum = [person valueForKeyPath: @"products.@sum.price"];
    NSLog(@"sum of products: %ld", [sum integerValue]);
```
## [19]. bad_access_demo
访问野指针

## [20]. isa_swizzle_demo
运行时改变isa指针

## [21]. getClass_and_class
对象，类对象，元类的class方法与object_getClass方法的区别
```objc
//object
    Person *p = [[Person alloc] init];
    NSLog(@"object class: %p",[p class]);                       //0x104660f18(up to class object)
    NSLog(@"object getClass: %p",object_getClass(p));           //0x104660f18(up to class object)
    
    //class object
    Class classObj = [p class];
    NSLog(@"classObj class: %p",[classObj class]);              //0x104660f18(class object self)
    NSLog(@"classObj getClass: %p",object_getClass(classObj));  //0x104660ef0(up to meta class object)
    
    //meta class object
    Class metaClassObj = object_getClass(classObj);
    NSLog(@"metaClassObj class: %p",[metaClassObj class]);              //0x104660ef0(meta class object self)
    NSLog(@"metaClassObj getClass: %p",object_getClass(metaClassObj));  //0x104ffee08(up to root meta class obj)
    
    //root meta class object
    Class rootMetaClassObj = object_getClass(metaClassObj);
    NSLog(@"rootMetaClassObj class: %p",[rootMetaClassObj class]);              //0x104ffee08(root meta class self)
    NSLog(@"rootMetaClassObj getClass: %p",object_getClass(rootMetaClassObj));  //0x104ffee08(root meta class self)
```

## [22]. dictionary_demo

关于NSDictionary的demo

## [23]. appdelegate_demo

关于appDelegate的几个方法调用的时机

## [24]. same_color_demo

如何判断两个颜色相等

## [25] containsObject_demo

数组里判断是否包含某个对象

## [26] indexset_demo

关于NSIndexSet的使用

## [27]. private_method_demo

performSelector 可以调用.m文件里的方法

## [28]. setter_getter_demo

setter 和 getter共存的时候必须要实现 @synthesize

```objc
@synthesize name=_name;

- (void)setName:(NSString *)name
{
    _name = name;
}

- (NSString *)name
{
    return self.name;
}
```

## [29]. touch_demo
父视图与子视图的点击

## [30]. zero_string_delete_demo
delete the @"" values in a dict


##[31]. string_demo

 NSString的一些copy和mutableCopy的操作



## [32]. find_viewController

给view添加一个分类方法，找到对应的viewController(可顺延父view向上查找)



## [33]. copy_mCopy_array

查看可变数组和不可变数组的copy和mutable copy下的 指针和元素指针。



## [34]. loadDemo

打印load方法的顺序，包括父类，分类



## [35]. message_forward

iOS消息转发实践的demo



## [36]. static_demo

比较 static 和 const的不同



## [37]. cgrectinset_demo

比较CGRectInset和CGRectOffset的区别



## [38]. stringRetainCount

string的引用计数



## [39]. synthesize

@synthesize关键字的使用



## [40]. superclassdemo

