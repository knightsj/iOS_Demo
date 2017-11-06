//
//  ViewController.m
//  clickbuttons
//
//  Created by Sun Shijie on 2017/11/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

#import "GridView.h"

@interface ViewController ()<GridViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *vipButton;
@property (nonatomic, strong) NSDictionary *requestInfo;
@property (nonatomic, strong) NSArray *grids;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self refreshVipButton:NO];
    
    GridView *view1 = [[GridView alloc] initWithFrame:CGRectMake(50, 200, 100, 100) infoDict:@{@"price":@"8"}];
    view1.delegate = self;
    [self.view addSubview:view1];
    
    GridView *view2 = [[GridView alloc] initWithFrame:CGRectMake(200, 200, 100, 100) infoDict:@{@"price":@"16"}];
    view2.delegate = self;
    [self.view addSubview:view2];
    
    self.grids = @[view1,view2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)returnInfo:(NSDictionary *)infoDict grid:(GridView *)grid{
    
    if (self.requestInfo == infoDict) {
        self.requestInfo = nil;
        [self refreshVipButton:NO];
    }else {
        self.requestInfo = infoDict;
         [self refreshVipButton:YES];
    }
    
    for (GridView *gridView in self.grids) {
        if (gridView == grid) {
            [gridView refreshState:YES];
        }else {
            [gridView refreshState:NO];
        }
    }
}
- (IBAction)openVip:(UIButton *)sender {
    if (self.requestInfo) {
        NSLog(@"开通vip，请求信息：%@",self.requestInfo);
    }else{
        NSLog(@"不能开通vip，因为没有选择套餐");
    }
}

- (void)refreshVipButton:(BOOL)state{
    if (state) {
        self.vipButton.backgroundColor = [UIColor greenColor];
        self.vipButton.userInteractionEnabled = YES;
    }else {
        self.vipButton.backgroundColor = [UIColor grayColor];
        self.vipButton.userInteractionEnabled = NO;
    }
}


@end
