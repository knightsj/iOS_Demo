//
//  ViewController.m
//  colorsame
//
//  Created by Sun Shijie on 2017/3/18.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIFont *font1 = [UIFont systemFontOfSize:12];
    UIFont *font2 = [UIFont systemFontOfSize:13];
    UIFont *font3 = [UIFont systemFontOfSize:12];
    
    if ( [self font1:font1 hasSameFontSizeOfFont2:font2]) {
        NSLog(@"same");
    }else{
        NSLog(@"not same");
    }
    
    if ([self font1:font1 hasSameFontSizeOfFont2:font3]) {
        NSLog(@"same");
    }else{
        NSLog(@"not same");
    }
    
    UIColor *color1 = [UIColor redColor];
    UIColor *color2 = [UIColor yellowColor];
    UIColor *color3 = [UIColor redColor];
    
    if ([self color1:color1 hasTheSameRGBAOfColor2:color2]) {
        NSLog(@"same");
    }else{
        NSLog(@"no");
    }
    
    
    if ([self color1:color1 hasTheSameRGBAOfColor2:color3]) {
        NSLog(@"same");
    }else{
        NSLog(@"no");
    }
    
    
    
}

- (BOOL)color1:(UIColor *)color1 hasTheSameRGBAOfColor2:(UIColor *)color2
{
    BOOL res = NO;
    
    CGFloat red1,red2,green1,green2,blue1,blue2,alpha1,alpha2;
    
    //取出color1的背景颜色的RGBA值
    [color1 getRed:&red1 green:&green1 blue:&blue1 alpha:&alpha1];
    
    //取出color2的背景颜色的RGBA值
    [color2 getRed:&red2 green:&green2 blue:&blue2 alpha:&alpha2];
    
    if ((red1 == red2)&&(green1 == green2)&&(blue1 == blue2)&&(alpha1 == alpha2)) {
        res = YES;
    }
    
    return res;
}

- (NSInteger)fontSizeOfFont:(UIFont *)font
{
    UIFontDescriptor *ctfFont = font.fontDescriptor;
    NSNumber *fontNumber = [ctfFont objectForKey:@"NSFontSizeAttribute"];
    return [fontNumber integerValue];
}

- (BOOL)font1:(UIFont *)font1 hasSameFontSizeOfFont2:(UIFont *)font2
{
    BOOL res = NO;
    UIFontDescriptor *font1Des = font1.fontDescriptor;
    NSNumber *font1Number = [font1Des objectForKey:@"NSFontSizeAttribute"];
    
    UIFontDescriptor *font2Des = font2.fontDescriptor;
    NSNumber *font2Number = [font2Des objectForKey:@"NSFontSizeAttribute"];
    
    if ([font1Number integerValue] == [font2Number integerValue]) {
        res = YES;
    }
    
    return res;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
