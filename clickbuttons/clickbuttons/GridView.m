//
//  GridView.m
//  clickbuttons
//
//  Created by Sun Shijie on 2017/11/2.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "GridView.h"


@interface GridView()

@property (nonatomic, strong)NSDictionary *infoDict;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIButton *tabButton;


@end

@implementation GridView
{
    BOOL _selected;
}

- (instancetype)initWithFrame:(CGRect)frame infoDict:(NSDictionary *)infoDict{
    
    self = [super initWithFrame:frame];
    if(self){
        self.infoDict = infoDict;
        [self creatSubViews];
    }
    return self;
}

- (void)creatSubViews{
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.priceLabel.text = [self.infoDict objectForKey:@"price"];
    self.priceLabel.textColor = [UIColor blackColor];
    self.priceLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.priceLabel];
    
     self.tabButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.tabButton addTarget:self action:@selector(didSelected) forControlEvents:UIControlEventTouchUpInside];
     self.tabButton.backgroundColor = [UIColor clearColor];
    [self addSubview:self.tabButton];
}

- (void)refreshState:(BOOL)state{
    if (state) {
        self.tabButton.backgroundColor = [UIColor greenColor];
    }else{
        self.tabButton.backgroundColor = [UIColor clearColor];
    }
}

- (void)didSelected{
    _selected = !_selected;
    [self refreshState:_selected];
    if ([self.delegate respondsToSelector:@selector(returnInfo:grid:)]) {
        [self.delegate returnInfo:self.infoDict grid:self];
    }
}


@end
