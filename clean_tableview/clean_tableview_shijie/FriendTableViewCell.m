//
//  FriendTableViewCell.m
//  tableview_datasource_seperate_demo
//
//  Created by Sun Shijie on 2017/1/24.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "FriendTableViewCell.h"
#import "FriendInfo.h"

@implementation FriendTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (void)configureWithInfo:(id<SimpleCellLayoutDelegate>)info
{
    if ([info isKindOfClass:[FriendInfo class]]) {
        FriendInfo *friendInfo = info;
        self.textLabel.text = [NSString stringWithFormat:@"Name: %@",friendInfo.name];
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    if (highlighted) {
        self.textLabel.textColor = [UIColor blueColor];
    } else {
        self.textLabel.textColor = [UIColor blackColor];
    }
}

@end
