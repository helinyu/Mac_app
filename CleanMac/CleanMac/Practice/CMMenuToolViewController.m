//
//  CMMenuToolViewController.m
//  CleanMac
//
//  Created by Aka on 2020/1/19.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMMenuToolViewController.h"
#import "CMPopMenu.h"

@interface CMMenuItemModel : NSObject

@property (nonatomic, copy) NSString *onImageName;
@property (nonatomic, copy) NSString *offImageName;
@property (nonatomic, copy) NSString *mixedImageName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger keyInt; // 表示的是业务
// 名称和大小是一个业务里面分类， 升序和降序是一个业务里面的分类；
//@property (nonatomic, strong) NSMenuItem *menuItem;
// 先不管是不是同一个图标
// 定义一个规则： 11** 22** 33** 44** 55** 66** 77** 88** 99** 最多有九个分类；  每个都不能够到0 到99 ，每个范畴都有100个；

@end

//分类：
//menu 就是title
//应该还是有一个image
//key
//item
//      名字
//      key

@interface CMMenuToolViewController ()<CMPopMenuProtocol>

@property (nonatomic, strong) NSButton *customBtn;
@property (nonatomic, strong) CMPopMenu *popMenu;

@end

@implementation CMMenuToolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor greenColor].CGColor;
    
    NSDictionary *categoryDict = @{kTitle:@"按照时间来排序", kRightIconName:@"icon_triangle_white_down_10",kCategories:@[@{kOnImageName:@"icon_hook_black_14",kItems:@[@{kTitle:@"时间",kIsOn:@(YES)},@{kTitle:@"大小"}]},@{kOnImageName:@"icon_hook_black_14",kItems:@[@{kTitle:@"升序"},@{kTitle:@"降序", kIsOn:@(YES)}]}]};
    self.popMenu = [CMPopMenu createMenuWithInfo:categoryDict onView:self.view];
    [self.view addSubview:self.popMenu];
    [self.popMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(100.f);
    }];
    self.popMenu.popMenuDelegate = self;
    
//    BOOL falg = [self.popMenu validateMenuItem:[self.popMenu itemArray].firstObject];
//    NSLog(@"lt - flag :%d",falg);
}

- (void)popMenu:(id)popMenu didSelectedIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"lt - pop menu didsleecte d :%@, indexPaht ;%@",popMenu, indexPath);
}

@end
