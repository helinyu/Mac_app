//
//  CMTrashView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 19:17 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMTrashView.h"
#import "CMTrashOptionView.h"
#import "NSView+CMAdd.h"
#import "NSButton+CMAdd.h"
#import <Masonry.h>

@interface CMTrashView ()

@property (nonatomic, strong) NSTextField *titleTF;
@property (nonatomic, strong) NSTextField *descTF;

@property (nonatomic, strong) CMTrashOptionView *trashItemOptionView;
@property (nonatomic, strong) CMTrashOptionView *finderItemOptionView;

@property (nonatomic, strong) NSImageView *rightLogoImgView;

@property (nonatomic, strong) NSButton *scanBtn;

@end

static CGFloat kTrashMarginLeft = 20.f;

@implementation CMTrashView

- (void)baseInit {
    _titleTF = [NSTextField new];
    _descTF = [NSTextField new];
    _trashItemOptionView = [CMTrashOptionView new];
    _finderItemOptionView = [CMTrashOptionView new];
    _rightLogoImgView = [NSImageView new];
    [self cm_addSubviews:@[_titleTF, _descTF, _trashItemOptionView, _finderItemOptionView, _rightLogoImgView]];
    
    [_rightLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).dividedBy(2.f);
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(100.f);
    }];
    _rightLogoImgView.image = [NSImage imageNamed:@"icon_trash_large"];
    
    [_trashItemOptionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kTrashMarginLeft);
        make.centerY.equalTo(self);
    }];
    
    [_finderItemOptionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kTrashMarginLeft);
        make.top.equalTo(self.trashItemOptionView.mas_bottom).offset(10.f);
    }];
    
    [_descTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kTrashMarginLeft);
        make.bottom.equalTo(self.trashItemOptionView.mas_top).offset(-10.f);
    }];
    
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kTrashMarginLeft);
        make.bottom.equalTo(self.descTF.mas_top).offset(-10.f);
    }];
    
    _scanBtn = [NSButton cm_buttonWithTitle:@"扫描" target:self action:@selector(onScanAction:)];
    [self addSubview:_scanBtn];
    [_scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self);
        make.width.height.mas_equalTo(50.f);
    }];
}

- (void)onScanAction:(id)sender {
    
}

@end
