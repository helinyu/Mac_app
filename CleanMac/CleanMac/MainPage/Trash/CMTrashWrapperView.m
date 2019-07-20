//
//  CMTrashWrapperView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/20 19:41 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMTrashWrapperView.h"
#import "CMTrashScanBeforeView.h"
#import "CMTrashScaningView.h"
#import "CMTrashEndView.h"
#import <Masonry.h>

@interface CMTrashWrapperView ()

@property (nonatomic, strong) CMTrashScanBeforeView *scanBeforeView;
@property (nonatomic, strong) CMTrashScaningView *scaningView;
@property (nonatomic, strong) CMTrashEndView *scanEndView;

@property (nonatomic, strong) NSButton *backBtn;


@property (nonatomic, strong) NSButton *scanBtn;
@property (nonatomic, strong) NSArray<NSString *> *scanBtnTexts;

@end

static CGFloat const kBottomHeight = 100.f;

@implementation CMTrashWrapperView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initWrapperView];
    }
    return self;
}

- (void)initWrapperView {
    
    self.layer = CALayer.layer;
    self.layer.backgroundColor = [NSColor colorWithRed:75.f/255.f green:98.f/255.f blue:98.f/255.f alpha:1.f].CGColor;
    
    _scanBeforeView = [CMTrashScanBeforeView new];
    _scaningView = [CMTrashScaningView new];
    _scanEndView = [CMTrashEndView new];
    [self cm_addSubviews:@[_scanEndView, _scaningView, _scanBeforeView]];
    
    [_scanEndView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.equalTo(self).offset(-kBottomHeight);
    }];
    _scanEndView.viewTag = CMScanStateScanEnd;
    
    [_scaningView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.equalTo(self).offset(-kBottomHeight);
    }];
    _scaningView.viewTag = CMScanStateScaning;
    
    [_scanBeforeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.equalTo(self).offset(-kBottomHeight);
    }];
    _scanBeforeView.viewTag = CMScanStateScanBefore;
    
    _scanBtn = [NSButton cm_buttonWithTitle:@"扫描" target:self action:@selector(onScanAction:)];
    [self addSubview:_scanBtn];
    [_scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self);
        make.width.height.mas_equalTo(50.f);
    }];
    
//     init state
    _scanBtnTexts = @[@"扫描",@"暂停",@"清除"];
    self.scanState = CMScanStateScanBefore;
    
    _backBtn = [NSButton cm_buttonWithTitle:@"返回" target:self action:@selector(onBackAction:)];
    [self addSubview:_backBtn];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10.f);
        make.bottom.equalTo(self).offset(-10.f);
    }];
    
}

- (void)setScanState:(CMScanState)scanState {
    _scanState = scanState;
    
    [self configureWithState:scanState];
    [self configureScanViewWithState:scanState];
}

- (void)onScanAction:(id)sender {
    !_actionScanBlock? :_actionScanBlock(_scanState);
}

- (void)configureWithState:(CMScanState)scanState {
    _scanState = scanState;
    if (scanState >= _scanBtnTexts.count) {
        return;
    }
    
    self.scanBtn.title = [_scanBtnTexts objectAtIndex:scanState];
}

- (void)configureScanViewWithState:(CMScanState)scanState {
    NSLog(@"lt - scan state :%lu",(unsigned long)scanState);
    self.scanBeforeView.hidden = !(scanState == self.scanBeforeView.viewTag);
    self.scaningView.hidden = !(scanState == self.scaningView.viewTag);
    self.scanEndView.hidden = !(scanState == self.scanEndView.viewTag);
}

- (void)onBackAction:(id)sender {
    self.scanState = CMScanStateScanBefore;
}

- (void)configScaningPath:(NSString *)path {
//     为什么只是刷新最后一个值呢？
    if (path.length >0) {
        self.scaningView.curFilePathTF.cell.title = path;
    }
}

- (void)configureEndScanSizeText:(NSString *)sizeText {
    self.scanEndView.trashDataTF.cell.title = sizeText;
    
//     为什么增加文件显示不出来
//    NSString *totalSizeText = [NSString stringWithFormat:@"共发现%@",sizeText];
    self.scanEndView.totalDataSizeTF.cell.title = sizeText;
    [self.scanEndView.totalDataSizeTF sizeToFit];
}

@end
