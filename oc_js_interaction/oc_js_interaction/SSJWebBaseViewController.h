//
//  SSJWebBaseViewController.h
//  oc_js_interaction
//
//  Created by Sun Shijie on 2017/3/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

//OC调用JS 和 JS调用VC 的界面布局比较一致，所以将共公部分抽取出来作为父类。


#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface SSJWebBaseViewController : UIViewController

@property (nonatomic, strong) JSContext *context;

//以html文件名出实话子类
- (instancetype)initWithHTMLFileName:(NSString * )htmlFileName;

//由子类实现，定义自己的导航栏标题，按钮等等
- (void)loadNavItems;

//webView的回调
- (void)webViewDidFinishLoad:(UIWebView *)webView;

//弹窗，主要用来反映从js传来的事件或者对象
- (void)showAlertViewWithMessage:(NSString *)message;

@end
