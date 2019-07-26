//
//  CMTrashScaningView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/20 19:41 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMTrashScaningView.h"

@interface CMTrashScaningView ()

@property (nonatomic, strong) NSTextField *titleTF;
@property (nonatomic, strong) NSTextField *curFilePathTF;
@property (nonatomic, strong) NSTextField *folderNameTF;

@end

@implementation CMTrashScaningView

- (instancetype)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        [self initContraints];
        [self initStyle];
    }
    return self;
}

- (void)initView {
    _titleTF = [NSTextField new];
    _curFilePathTF = [NSTextField new];
    _folderNameTF = [NSTextField new];
    [self cm_addSubviews:@[_titleTF, _curFilePathTF, _folderNameTF]];
    
}

- (void)initContraints {
    [self.rightLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(-10.f);
        make.centerX.equalTo(self);
        make.width.height.mas_equalTo(150.f);
    }];
    
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rightLogoImgView.mas_bottom).offset(10.f);
        make.centerX.equalTo(self);
        make.left.right.equalTo(self);
    }];
    
    [_curFilePathTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.titleTF.mas_bottom).offset(10.f);
        make.left.right.equalTo(self);
    }];
    
    [_folderNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.curFilePathTF.mas_bottom).offset(10.f);
        make.left.right.equalTo(self);
    }];
}

- (void)initStyle {
    {
        [_titleTF setTextColor:[NSColor whiteColor]];
        [_titleTF setFont:[NSFont systemFontOfSize:18.f]];
        _titleTF.bordered = NO;
        _titleTF.backgroundColor = [NSColor clearColor];
        _titleTF.alignment = NSTextAlignmentCenter;
        _titleTF.cell.title = @"正在计算废纸篓文件夹的大小...";
    }
    
    {
        
        [_curFilePathTF setTextColor:[NSColor colorWithWhite:0.9 alpha:0.9]];
        [_curFilePathTF setFont:[NSFont systemFontOfSize:14.f]];
        _curFilePathTF.bordered = NO;
        _curFilePathTF.backgroundColor = [NSColor clearColor];
        _curFilePathTF.alignment = NSTextAlignmentCenter;
    }
    
    {
        [_folderNameTF setTextColor:[NSColor colorWithWhite:0.9 alpha:0.9]];
        [_folderNameTF setFont:[NSFont systemFontOfSize:14.f]];
        _folderNameTF.bordered = NO;
        _folderNameTF.backgroundColor = [NSColor clearColor];
        _folderNameTF.cell.title = @"系统废纸篓";
        _folderNameTF.alignment = NSTextAlignmentCenter;
    }
    
}

@end
