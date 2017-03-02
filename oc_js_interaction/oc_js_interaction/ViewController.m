//
//  ViewController.m
//  oc_js_interaction
//
//  Created by Sun Shijie on 2017/3/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "OCCallJSViewController.h"
#import "JSCallOCViewController.h"

@implementation ViewController

- (IBAction)oc_call_js:(UIButton *)sender {
    
    OCCallJSViewController *vc = [[OCCallJSViewController alloc] initWithHTMLFileName:@"oc_call_js.html"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)js_call_oc:(UIButton *)sender {
    
    JSCallOCViewController *vc = [[JSCallOCViewController alloc] initWithHTMLFileName:@"js_call_oc.html"];
    [self.navigationController pushViewController:vc animated:YES];
}



@end
