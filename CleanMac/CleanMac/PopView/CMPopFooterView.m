//
//  CMPopFooterView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/16 15:49 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMPopFooterView.h"
#import <Masonry.h>

@interface CMPopFooterView ()

@property (nonatomic, strong) NSImageView *appIconView;
@property (nonatomic, strong) NSButton *showMainViewBtn;
@property (nonatomic, strong) NSButton *settingBtn;

@end

@implementation CMPopFooterView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)baseInit {
    
    _appIconView = [NSImageView new];
    if (@available(macOS 10.12, *)) {
        _showMainViewBtn = [NSButton buttonWithTitle:@"显示CleanMac" target:self action:@selector(onShowMainViewAction:)];
        _settingBtn = [NSButton buttonWithImage:[NSImage imageNamed:@"icon_pop_setting"] target:self action:@selector(onSettingAction:)];
    } else {
        _showMainViewBtn = [NSButton new];
        [_showMainViewBtn setTarget:self];
        [_showMainViewBtn setAction:@selector(onShowMainViewAction:)];
        [_showMainViewBtn setTitle:@"显示CleanMac"];
        
        _settingBtn = [NSButton new];
        [_settingBtn setTarget:self];
        [_settingBtn setAction:@selector(onSettingAction:)];
        [_settingBtn setImage:[NSImage imageNamed:@"icon_pop_setting"]];
    }
    
    [self addSubview:_appIconView];
    [self addSubview:_showMainViewBtn];
    [self addSubview:_settingBtn];
    
    [_appIconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo();
    }];
    
    [_showMainViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    [_showMainViewBtn setFont:[NSFont systemFontOfSize:14.f]];
    
    [_settingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-20.f);
        make.width.height.mas_equalTo(30.f);
    }];
}

- (void)onShowMainViewAction:(NSButton *)sender {
    NSLog(@"心事主页");
}

- (void)onSettingAction:(NSButton *)sender {
    NSLog(@"显示关闭等内容");
}

@end
