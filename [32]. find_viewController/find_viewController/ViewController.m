//
//  ViewController.m
//  find_viewController
//
//  Created by Sun Shijie on 2018/4/3.
//  Copyright © 2018年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "SubView.h"
#import "UIView+ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) SubView *subView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SubView *view = [[SubView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(100, 100, 100, 100);
    self.subView = view;
    [self.view addSubview:self.subView];
   
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
//    UIViewController *vc =  [self findViewController:self.subView];
//    UIViewController *vc =  [self.subView viewController];
//    UIViewController *vc =  [self.subView belongVC];
      UIViewController *vc =  [self.view belongingVC];
    
//    UIViewController *vc =  [self viewController];
    if ([vc respondsToSelector:@selector(log)]) {
         [vc performSelector:@selector(log)];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)log{
    
    NSLog(@"found view controller");
}


- (UIViewController *)findViewController:(UIView *)sourceView
{

    id target = sourceView;

    while (target) {

        target = ((UIResponder *)target).nextResponder;

        if ([target isKindOfClass:[UIViewController class]]) {
            break;
        }
    }

    return target;
}

//- (UIViewController*)viewController{
//
//    for (UIView* next = [self  superview]; next; next = next.superview){
//
//        UIResponder* nextResponder = [next nextResponder];
//
//        if ([nextResponder isKindOfClass:[UIViewController class]]){
//
//            return (UIViewController*)nextResponder;
//
//        }
//
//    }
//
//    return nil;
//
//}



@end
