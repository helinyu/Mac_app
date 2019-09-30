//
//  CMSystemTrashView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 20:04 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMSystemTrashView.h"
#import "CMPreScanLeftTitleView.h"
#import "CMPreScanTitleModel.h"
#import "CMPreScanContentModel.h"


@implementation CMSystemTrashView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer = CALayer.layer;
        self.layer.backgroundColor = [NSColor orangeColor].CGColor;
        
        [self baseInit];
    }
    return self;
}

- (void)baseInit {
    _scanView = [CMPreScanView new];
    [self addSubview:_scanView];
    [_scanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    _scanView.layer = CALayer.layer;
    _scanView.layer.backgroundColor = [NSColor grayColor].CGColor;
    
    CMPreScanTitleModel *titleItem = [CMPreScanTitleModel new];
    titleItem.title = @"系统垃圾";
    titleItem.desc = @"清理您的系统获得最大的性能和释放自由空间";
    _scanView.titleView.titleItem = titleItem;
    
    CMPreScanContentModel *item0 = [CMPreScanContentModel new];
    item0.title = @"优化系统";
    item0.desc = @"移除零食文件以释放空间，提高Mac的性能";
    item0.iconName = @"icon_finder";
    CMPreScanContentModel *item1 = [CMPreScanContentModel new];
    item1.title = @"应用程序瘦身";
    item1.desc = @"移除不需要的翻译文件，而不影响应用程序功能";
    item1.iconName = @"";
    CMPreScanContentModel *item2 = [CMPreScanContentModel new];
    item2.title = @"解决所有的类型错误";
    item2.desc = @"删除各种可能会导致应用程序反应异常的破损项目";
    item2.iconName = @"";
    NSArray *datasource = @[item0, item1, item2];
    [_scanView configData:datasource update:YES];
    
    _scanView.iconView.image = [NSImage imageNamed:@"icon_right_default"];
}

@end
