//
//  SSJWebBaseViewController.m
//  oc_js_interaction
//
//  Created by Sun Shijie on 2017/3/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SSJWebBaseViewController.h"


@interface SSJWebBaseViewController ()<UIWebViewDelegate>

@property (nonatomic, copy) NSString *htmlFileName;
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIActivityIndicatorView *indicator;


@end

@implementation SSJWebBaseViewController

- (instancetype)initWithHTMLFileName:(NSString *)htmlFileName
{
    self = [super init];
    if (self) {
        self.htmlFileName = htmlFileName;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self loadNavItems];
    [self loadWebView];
    [self loadIndicator];
    [self requestHTML];
}

- (void)loadNavItems
{
    //交给子类去做
}

- (void)requestHTML
{
    NSString *path = [[[NSBundle mainBundle] bundlePath]  stringByAppendingPathComponent:self.htmlFileName];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    [self.webView loadRequest: request];
    [self.indicator startAnimating];
}

#pragma mark- UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.indicator stopAnimating];
    
    //保存上下文
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    //捕获js里面的异常
    self.context.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue)
    {
        context.exception = exceptionValue;
    };
}

#pragma mark- SubViews

- (void)loadWebView
{
     self.webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
     self.webView.delegate = self;
    [self.view addSubview:self.webView];
}

- (void)loadIndicator
{
     self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
     self.indicator.frame = CGRectMake(self.webView.center.x-20, 120, 40, 40);
    [self.webView addSubview:self.indicator];
}

- (void)showAlertViewWithMessage:(NSString *)message
{
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [vc addAction:cancelAction];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
