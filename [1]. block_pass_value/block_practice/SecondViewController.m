//
//  SecondViewController.m
//  block_practice
//
//  Created by Sun Shijie on 2017/2/9.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)back:(UIButton *)sender {
    
    if (self.block) {
        self.block(self.textField.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)passValueWithBlock:(PassValueBlock)block
{
    self.block = [block copy];
}

@end
