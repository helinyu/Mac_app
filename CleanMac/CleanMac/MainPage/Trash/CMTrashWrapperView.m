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

#import "CMFileManger.h"

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
        [self initConstraints];
        [self initData];
        [self initStyle];
        [self initBind];
    }
    return self;
}

- (void)initWrapperView {
    _scanBeforeView = [CMTrashScanBeforeView new];
    _scaningView = [CMTrashScaningView new];
    _scanEndView = [CMTrashEndView new];
    [self cm_addSubviews:@[_scanEndView, _scaningView, _scanBeforeView]];
    
    _scanBtn = [NSButton cm_buttonWithTitle:@"扫描" target:self action:@selector(onScanAction:)];
    [self addSubview:_scanBtn];
    
    _backBtn = [NSButton cm_buttonWithTitle:@"返回" target:self action:@selector(onBackAction:)];
    [self addSubview:_backBtn];
}

- (void)initConstraints {
    [_scanEndView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.equalTo(self).offset(-kBottomHeight);
    }];
    
    [_scaningView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.equalTo(self).offset(-kBottomHeight);
    }];
    
    [_scanBeforeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.equalTo(self).offset(-kBottomHeight);
    }];

    [_scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self);
        make.width.height.mas_equalTo(50.f);
    }];
   
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10.f);
        make.bottom.equalTo(self).offset(-10.f);
    }];
}

- (void)initStyle {
//    self.layer = CALayer.layer;
//    self.layer.backgroundColor = [NSColor colorWithRed:75.f/255.f green:98.f/255.f blue:98.f/255.f alpha:1.f].CGColor;
}

- (void)initData {
    
    _scanBtnTexts = @[@"扫描",@"暂停",@"清除"];

    _scanBeforeView.viewTag = CMScanStateScanBefore;
    _scaningView.viewTag = CMScanStateScaning;
    _scanEndView.viewTag = CMScanStateScanEnd;

    self.scanState = CMScanStateScanBefore;
}

- (void)initBind {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBackAction:) name:@"back.notification" object:nil];
}

- (void)setScanState:(CMScanState)scanState {
//     添加一个弹框
        
    _scanState = scanState;
    
    [self configureWithState:scanState];
    [self configureScanViewWithState:scanState];
    
    [self configExtensionViewWithState:scanState];
}

- (void)onScanAction:(id)sender {
    !_actionScanBlock? :_actionScanBlock(_scanState);
}

- (void)configExtensionViewWithState:(CMScanState)scanState {
    if (scanState == CMScanStateScanBefore) {
        self.scanEndView.trashDataTF.cell.title = @"";
        [self.scanEndView configDataUIHidden:YES];
        [self.scanEndView configNoDataUIHidden:YES];
    }
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
    if (path.length >0) {
        self.scaningView.curFilePathTF.cell.title = path;
    }
}

- (void)configureEndScanSize:(long long) size {
    if (size >0) {
            NSString *sizeText =[CMFileManger fileSizeTranslateToLargerUnitWithOriginSize:size];
        self.scanEndView.trashDataTF.cell.title = sizeText;
        self.scanEndView.totalDataSizeTF.cell.title = [NSString stringWithFormat:@"共发现%@",sizeText];;
        [self.scanEndView configDataIsEmpty:NO];
    }
    else {
        [self.scanEndView configDataIsEmpty:YES];
    }
}

- (void)configureEndScanSizeText:(NSString *)sizeText {
    self.scanEndView.trashDataTF.cell.title = sizeText;
    
//     为什么增加文件显示不出来
    NSString *totalSizeText = [NSString stringWithFormat:@"共发现%@",sizeText];
    self.scanEndView.totalDataSizeTF.cell.title = totalSizeText;
    [self.scanEndView.totalDataSizeTF sizeToFit];
}

@end
