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

@property (nonatomic, strong) NSTextField *scaningTitleTF;
@property (nonatomic, strong) NSTextField *scaningDescTF;

@property (nonatomic, strong) NSImageView *endImgView;
@property (nonatomic, strong) NSTextField *endTitleTF;
@property (nonatomic, strong) NSTextField *endDescTF;

@end

static CGFloat kTrashMarginLeft = 20.f;

@implementation CMTrashView

- (void)baseInit {
    self.layer = CALayer.layer;
    self.layer.backgroundColor = [NSColor colorWithRed:75.f/255.f green:98.f/255.f blue:98.f/255.f alpha:1.f].CGColor;
    
    _titleTF = [NSTextField new];
    _descTF = [NSTextField new];
    _trashItemOptionView = [CMTrashOptionView new];
    _finderItemOptionView = [CMTrashOptionView new];
    _rightLogoImgView = [NSImageView new];
    [self cm_addSubviews:@[_titleTF, _descTF, _trashItemOptionView, _finderItemOptionView, _rightLogoImgView]];
    
    [_rightLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).multipliedBy(3.f/2);
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(100.f);
    }];
    _rightLogoImgView.image = [NSImage imageNamed:@"icon_trash_large"];
    
    [_trashItemOptionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kTrashMarginLeft);
        make.centerY.equalTo(self);
        make.right.equalTo(self.rightLogoImgView.mas_left);
    }];
    [_trashItemOptionView configImgName:@"icon_trash_dustbin" title:@"立即倾倒所有垃圾" desc:@"无需浏览所有的驱动器和应用查找它们的废纸篓"];
    
    [_finderItemOptionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kTrashMarginLeft);
        make.top.equalTo(self.trashItemOptionView.mas_bottom).offset(0.f);
        make.right.equalTo(self.rightLogoImgView.mas_left);
    }];
    [_finderItemOptionView configImgName:@"icon_trash_dustbin" title:@"立即倾倒所有垃圾" desc:@"无需浏览所有的驱动器和应用查找它们的废纸篓"];
    
    [_descTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kTrashMarginLeft);
        make.bottom.equalTo(self.trashItemOptionView.mas_top).offset(-10.f);
        make.right.equalTo(self.rightLogoImgView.mas_left);
    }];
    _descTF.cell.title = @"倾倒mac上的所有废纸篓,包括图片和照片图库垃圾";
    [_descTF setFont:[NSFont systemFontOfSize:13.f]];
    _descTF.backgroundColor = [NSColor clearColor];
    [_descTF setTextColor:[NSColor colorWithWhite:1.f alpha:0.8]];
    _descTF.bordered = NO;
    
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kTrashMarginLeft);
        make.bottom.equalTo(self.descTF.mas_top).offset(-10.f);
        make.right.equalTo(self.rightLogoImgView.mas_left);
    }];
    _titleTF.cell.title = @"废纸篓";
    [_titleTF setFont:[NSFont systemFontOfSize:16.f]];
    _titleTF.bordered = NO;
    _titleTF.backgroundColor = [NSColor clearColor];
    [_titleTF setTextColor:[NSColor whiteColor]];
    
    _scanBtn = [NSButton cm_buttonWithTitle:@"扫描" target:self action:@selector(onScanAction:)];
    [self addSubview:_scanBtn];
    [_scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self);
        make.width.height.mas_equalTo(50.f);
    }];
}

- (void)baseScaningInit {
    _scaningDescTF = [NSTextField new];
    _scaningTitleTF = [NSTextField new];
    [self cm_addSubviews:@[_scaningTitleTF, _scaningDescTF]];
}

- (void)baseEndInit {
    _endImgView = [NSImageView new];
    _endTitleTF = [NSTextField new];
    _endDescTF = [NSTextField new];
    [self cm_addSubviews:@[_endImgView, _endTitleTF, _endDescTF]];    
}


- (void)onScanAction:(id)sender {
    !_actionScanBlock? :_actionScanBlock();
}

- (void)setScanState:(CMScanState)scanState {
    _scanState = scanState;
    
    [self configureWithState:scanState];
}

- (void)configureWithState:(CMScanState)scanState {
    if (scanState == CMScanStateBegin) {
        
    }
    else if (scanState == CMScanStateScaning) {
        
    }
    else {
        
    }
}

@end
