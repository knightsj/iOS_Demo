//
//  JSCallOCJSExportViewController.m
//  oc_js_interaction
//
//  Created by Sun Shijie on 2017/3/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "JSCallOCJSExportViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "Calculator.h"

@interface JSCallOCJSExportViewController ()

@property (nonatomic, strong) JSContext *context;
@property (nonatomic, strong) Calculator *calculator;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation JSCallOCJSExportViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.context = [[JSContext alloc] init];
    
    //捕获js里面的异常
    self.context.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        [JSContext currentContext].exception = exception;
    };
    
    //将OC对象传入JS上下文中，执行计算
    self.calculator = [[Calculator alloc] init];
    //将obj添加到context中
    self.context[@"OCObject"] = self.calculator;
    //JS里面调用Obj的方法，并将结果赋值给Obj的sum属性
    [self.context evaluateScript:@"OCObject.sum = OCObject.add(3,2)"];
    self.resultLabel.text = [NSString stringWithFormat:@"%lu",self.calculator.sum];

}


@end
