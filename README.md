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


