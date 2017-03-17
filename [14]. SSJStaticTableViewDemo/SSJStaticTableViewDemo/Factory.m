//
//  Factory.m
//  SSJStaticTableViewDemo
//
//  Created by Sun Shijie on 2017/3/15.
//  Copyright © 2017年 Shijie. All rights reserved.
//

#import "Factory.h"
#import "SJStaticTableviewCellViewModel.h"
#import "SJStaticTableviewSectionViewModel.h"



@implementation Factory

+ (NSArray *)mePageData
{
    // ========== section 0
    SJStaticTableviewCellViewModel *vm0 = [[SJStaticTableviewCellViewModel alloc] init];
    vm0.cellID = @"avatarCell";
    vm0.identifier = 0;
    vm0.cellHeight = 80;
    vm0.avatarImage = [UIImage imageNamed:@"avatar"];
    vm0.userName = @"J_Knight";
    vm0.userID = @"微信号：xxxxxx";
    vm0.codeImage = [UIImage imageNamed:@"qrcode"];
    vm0.staticCellType = SSJStaticCellTypeMeAvatar;
    
    SJStaticTableviewSectionViewModel *section0 = [[SJStaticTableviewSectionViewModel alloc] init];
    section0.itemArray = @[vm0];
    
    
    
    // ========== section 1
    SJStaticTableviewCellViewModel *vm1 = [[SJStaticTableviewCellViewModel alloc] init];
    vm1.defaultImage = [UIImage imageNamed:@"MoreMyAlbum"];
    vm1.defaultTitle = @"相册";
    vm1.identifier = 1;
    
    SJStaticTableviewCellViewModel *vm2 = [[SJStaticTableviewCellViewModel alloc] init];
    vm2.defaultImage = [UIImage imageNamed:@"MoreMyFavorites"];
    vm2.defaultTitle = @"收藏";
    vm2.identifier = 2;
    
    
    SJStaticTableviewCellViewModel *vm3 = [[SJStaticTableviewCellViewModel alloc] init];
    vm3.defaultImage = [UIImage imageNamed:@"MoreMyBankCard"];
    vm3.defaultTitle = @"钱包";
    vm3.identifier = 3;

    
    SJStaticTableviewCellViewModel *vm4 = [[SJStaticTableviewCellViewModel alloc] init];
    vm4.defaultImage = [UIImage imageNamed:@"MyCardPackageIcon"];
    vm4.defaultTitle = @"卡包";
    vm4.identifier = 4;
  
    
    SJStaticTableviewSectionViewModel *section1 = [[SJStaticTableviewSectionViewModel alloc] init];
    section1.itemArray = @[vm1,vm2,vm3,vm4];
    
    // ========== section 2
    SJStaticTableviewCellViewModel *vm5 = [[SJStaticTableviewCellViewModel alloc] init];
    vm5.defaultImage = [UIImage imageNamed:@"emoticon"];
    vm5.defaultTitle = @"表情";
    vm5.identifier = 5;
    
    
    SJStaticTableviewSectionViewModel *section2 = [[SJStaticTableviewSectionViewModel alloc] init];
    section2.itemArray = @[vm5];
    
    
    // ========== section 3
    SJStaticTableviewCellViewModel *vm6 = [[SJStaticTableviewCellViewModel alloc] init];
    vm6.defaultImage = [UIImage imageNamed:@"MoreSetting"];
    vm6.defaultTitle = @"设置";
    vm6.identifier = 7;
    
    
    SJStaticTableviewSectionViewModel *section3 = [[SJStaticTableviewSectionViewModel alloc] init];
    section3.itemArray = @[vm6];
    
    return @[section0,section1,section2,section3];
}


+ (NSArray *)settingPageData
{
    // ========== section 0
    SJStaticTableviewCellViewModel *vm0 = [[SJStaticTableviewCellViewModel alloc] init];
    vm0.defaultTitle = @"账号与安全";
    vm0.identifier = 0;
    vm0.indicatorLeftTitle = @"已保护";
    vm0.indicatorLeftImage = [UIImage imageNamed:@"ProfileLockOn"];
    vm0.isImageFirst = NO;
    
    SJStaticTableviewSectionViewModel *section0 = [[SJStaticTableviewSectionViewModel alloc] init];
    section0.itemArray = @[vm0];
    
    
    
    // ========== section 1
    SJStaticTableviewCellViewModel *vm1 = [[SJStaticTableviewCellViewModel alloc] init];
    vm1.defaultTitle = @"新消息通知";
    vm1.identifier = 1;
    
    //额外添加switch
    SJStaticTableviewCellViewModel *vm7 = [[SJStaticTableviewCellViewModel alloc] init];
    vm7.defaultTitle = @"夜间模式";
    vm7.switchValueDidChangeBlock = ^(BOOL isON){
        NSString *message = isON?@"打开夜间模式":@"关闭夜间模式";
        NSLog(@"%@",message);
    };
    vm7.staticCellType = SSJStaticCellTypeSystemAccessorySwitch;
    vm7.identifier = 7;
    
    SJStaticTableviewCellViewModel *vm8 = [[SJStaticTableviewCellViewModel alloc] init];
    vm8.defaultTitle = @"清理缓存";
    vm8.indicatorLeftTitle = @"12.3M";
    vm8.identifier = 8;
    
    SJStaticTableviewCellViewModel *vm2 = [[SJStaticTableviewCellViewModel alloc] init];
    vm2.defaultTitle = @"隐私";
    vm2.identifier = 2;
    
    
    SJStaticTableviewCellViewModel *vm3 = [[SJStaticTableviewCellViewModel alloc] init];
    vm3.defaultTitle = @"通用";
    vm3.identifier = 3;
    
    
    SJStaticTableviewSectionViewModel *section1 = [[SJStaticTableviewSectionViewModel alloc] init];
    section1.itemArray = @[vm1,vm7,vm8,vm2,vm3];
    
    // ========== section 2
    SJStaticTableviewCellViewModel *vm4 = [[SJStaticTableviewCellViewModel alloc] init];
    vm4.defaultTitle = @"帮助与反馈";
    vm4.identifier = 4;
    
    SJStaticTableviewCellViewModel *vm5 = [[SJStaticTableviewCellViewModel alloc] init];
    vm5.defaultTitle = @"关于微信";
    vm5.identifier = 5;
    
    SJStaticTableviewCellViewModel *vm9 = [[SJStaticTableviewCellViewModel alloc] init];
    vm9.defaultTitle = @"没有Accessory";
    vm9.staticCellType = SSJStaticCellTypeSystemAccessoryNone;
    vm9.identifier = 9;
    
    SJStaticTableviewSectionViewModel *section2 = [[SJStaticTableviewSectionViewModel alloc] init];
    section2.itemArray = @[vm4,vm5,vm9];
    
    
    // ========== section 3
    SJStaticTableviewCellViewModel *vm6 = [[SJStaticTableviewCellViewModel alloc] init];
    vm6.staticCellType = SSJStaticCellTypeSystemLogout;
    vm6.cellID = @"logout";
    vm6.identifier = 6;
    
    
    SJStaticTableviewSectionViewModel *section3 = [[SJStaticTableviewSectionViewModel alloc] init];
    section3.itemArray = @[vm6];
    
    return @[section0,section1,section2,section3];
}

+ (NSArray *)infoPageData
{
    // ========== section 0
    SJStaticTableviewCellViewModel *vm0 = [[SJStaticTableviewCellViewModel alloc] init];
    vm0.defaultTitle = @"头像";
    vm0.identifier = 0;
    vm0.cellHeight = 80;
    vm0.indicatorLeftImage = [UIImage imageNamed:@"avatar"];
    
    SJStaticTableviewCellViewModel *vm1 = [[SJStaticTableviewCellViewModel alloc] init];
    vm1.defaultTitle = @"名字";
    vm1.indicatorLeftTitle = @"J_Knight";
    vm1.identifier = 1;
    
    SJStaticTableviewCellViewModel *vm2 = [[SJStaticTableviewCellViewModel alloc] init];
    vm2.defaultTitle = @"微信号";
    vm2.indicatorLeftTitle = @"xxxxxx";
    vm2.identifier = 2;
    
    
    SJStaticTableviewCellViewModel *vm3 = [[SJStaticTableviewCellViewModel alloc] init];
    vm3.defaultTitle = @"我的二维码";
    vm3.identifier = 3;
    vm3.indicatorLeftImage = [UIImage imageNamed:@"qrcode"];
    
    SJStaticTableviewCellViewModel *vm4 = [[SJStaticTableviewCellViewModel alloc] init];
    vm4.defaultTitle = @"我的地址";
    vm4.identifier = 4;
    
    SJStaticTableviewSectionViewModel *section0 = [[SJStaticTableviewSectionViewModel alloc] init];
    section0.itemArray = @[vm0,vm1,vm2,vm3,vm4];
    
    // ========== section 1
    SJStaticTableviewCellViewModel *vm5 = [[SJStaticTableviewCellViewModel alloc] init];
    vm5.defaultTitle = @"性别";
    vm5.indicatorLeftTitle = @"男";
    vm5.identifier = 5;
    
    SJStaticTableviewCellViewModel *vm6 = [[SJStaticTableviewCellViewModel alloc] init];
    vm6.defaultTitle = @"地区";
    vm6.indicatorLeftTitle = @"上海 闵行";
    vm6.identifier = 6;
    
    SJStaticTableviewCellViewModel *vm7 = [[SJStaticTableviewCellViewModel alloc] init];
    vm7.defaultTitle = @"个性签名";
    vm7.indicatorLeftTitle = @"good good study";
    vm7.identifier = 7;
    
    SJStaticTableviewSectionViewModel *section1 = [[SJStaticTableviewSectionViewModel alloc] init];
    section1.itemArray = @[vm5,vm6,vm7];
    
    
    // ========== section 2
    SJStaticTableviewCellViewModel *vm8 = [[SJStaticTableviewCellViewModel alloc] init];
    vm8.defaultTitle = @"LinkedIn账号";
    vm8.indicatorLeftTitle = @"展示";
    vm8.identifier = 8;
    
    SJStaticTableviewSectionViewModel *section2 = [[SJStaticTableviewSectionViewModel alloc] init];
    section2.itemArray = @[vm8];
    
     return @[section0,section1,section2];
    
}

+ (NSArray *)momentsPageData
{
    // ========== section 0
    SJStaticTableviewCellViewModel *vm0 = [[SJStaticTableviewCellViewModel alloc] init];
    vm0.defaultImage = [UIImage imageNamed:@"ff_IconShowAlbum"];
    vm0.defaultTitle = @"朋友圈";
    vm0.indicatorLeftImage = [UIImage imageNamed:@"avatar"];
    vm0.identifier = 0;
    
    SJStaticTableviewSectionViewModel *section0 = [[SJStaticTableviewSectionViewModel alloc] init];
    section0.itemArray = @[vm0];
    
    
    
    // ========== section 1
    SJStaticTableviewCellViewModel *vm1 = [[SJStaticTableviewCellViewModel alloc] init];
    vm1.defaultImage = [UIImage imageNamed:@"ff_IconQRCode"];
    vm1.defaultTitle = @"扫一扫";
    vm1.identifier = 1;
    
    SJStaticTableviewCellViewModel *vm2 = [[SJStaticTableviewCellViewModel alloc] init];
    vm2.defaultImage = [UIImage imageNamed:@"ff_IconShake"];
    vm2.defaultTitle = @"摇一摇";
    vm2.identifier = 2;
    
    
    SJStaticTableviewSectionViewModel *section1 = [[SJStaticTableviewSectionViewModel alloc] init];
    section1.itemArray = @[vm1,vm2];
    
    
    SJStaticTableviewCellViewModel *vm3 = [[SJStaticTableviewCellViewModel alloc] init];
    vm3.defaultImage = [UIImage imageNamed:@"ff_IconLocationService"];
    vm3.defaultTitle = @"附近的人";
    vm3.identifier = 3;
    
    
    SJStaticTableviewCellViewModel *vm4 = [[SJStaticTableviewCellViewModel alloc] init];
    vm4.defaultImage = [UIImage imageNamed:@"ff_IconBottle"];
    vm4.defaultTitle = @"漂流瓶";
    vm4.identifier = 4;
    
    
    SJStaticTableviewSectionViewModel *section2 = [[SJStaticTableviewSectionViewModel alloc] init];
    section2.itemArray = @[vm3,vm4];
    
    
    // ========== section 2
    SJStaticTableviewCellViewModel *vm5 = [[SJStaticTableviewCellViewModel alloc] init];
    vm5.defaultImage = [UIImage imageNamed:@"CreditCard_ShoppingBag"];
    vm5.defaultTitle = @"购物";
    vm5.identifier = 5;

    
    // ========== section 3
    SJStaticTableviewCellViewModel *vm6 = [[SJStaticTableviewCellViewModel alloc] init];
    vm6.defaultImage = [UIImage imageNamed:@"MoreGame"];
    vm6.defaultTitle = @"游戏";
    vm6.indicatorLeftImage = [UIImage imageNamed:@"wzry"];
    vm6.indicatorLeftTitle = @"一起来玩王者荣耀呀!";
    vm6.identifier = 7;
    
    
    SJStaticTableviewSectionViewModel *section3 = [[SJStaticTableviewSectionViewModel alloc] init];
    section3.itemArray = @[vm5,vm6];
    
    return @[section0,section1,section2,section3];
}



@end
