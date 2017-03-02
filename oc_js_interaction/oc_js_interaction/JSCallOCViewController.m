//
//  JSCallOCViewController.m
//  oc_js_interaction
//
//  Created by Sun Shijie on 2017/3/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "JSCallOCViewController.h"

@interface JSCallOCViewController ()

@end

@implementation JSCallOCViewController

- (void)loadNavItems
{
    self.navigationItem.title = @"JS调用OC代码";
}

#pragma mark- UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [super webViewDidFinishLoad:webView];
    
    __weak typeof(self)this = self;
    
    self.context[@"tabAndLogAction"] = ^(){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [this showAlertViewWithMessage:@"我被点击啦"];
        });
    };
    
    self.context[@"logTextFieldInput"] = ^(NSString *textFieldString){
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *message = textFieldString.length? textFieldString : @"请在提示框内输入文字哦";
            [this showAlertViewWithMessage:message];
        });
    };    
}

@end
