//
//  ViewController.m
//  block_practice
//
//  Created by Sun Shijie on 2017/2/8.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (IBAction)jump:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"second" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"second"]) {
        
        SecondViewController *secondVC = segue.destinationViewController;
        
        [secondVC passValueWithBlock:^(NSString *string) {
            self.label.text = string;
        }];
    }
    
    
}

@end
