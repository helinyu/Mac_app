//
//  CMTrashEndView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/20 19:42 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMTrashEndView.h"

@interface CMTrashEndView ()

@property (nonatomic, strong) NSTextField *titleTF;
@property (nonatomic, strong) NSView *titleBottomLine;
@property (nonatomic, strong) NSTextField *trashDataTF;
@property (nonatomic, strong) NSTextField *intelligenceDescTF;
@property (nonatomic, strong) NSView *trashDataBottomLine;
@property (nonatomic, strong) NSTextField *includeTitleTF;
@property (nonatomic, strong) NSTextField *includeContentTF;
@property (nonatomic, strong) NSButton *lookAtBtn;
@property (nonatomic, strong) NSTextField *totalDataSizeTF;

@end

static CGFloat const kMarginLeft = 10.f;
static CGFloat const kMarginRight = 10.f;
static CGFloat const kVerticalSpace = 4.f;

@implementation CMTrashEndView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initWithTrashEndView];
    }
    return self;
}

- (void)initWithTrashEndView {
    _titleTF = [NSTextField new];
    _titleBottomLine = [NSView new];
    _trashDataTF = [NSTextField new];
    _intelligenceDescTF = [NSTextField new];
    _trashDataBottomLine = [NSView new];
    _includeTitleTF = [NSTextField new];
    _includeContentTF = [NSTextField new];
    _lookAtBtn = [NSButton cm_buttonWithTitle:@"查看项目" target:self action:@selector(onLookAtMoreAction:)];
    _totalDataSizeTF = [NSTextField new];
    [self cm_addSubviews:@[_titleTF, _titleBottomLine, _trashDataTF, _intelligenceDescTF, _trashDataBottomLine, _includeTitleTF, _includeContentTF, _lookAtBtn, _totalDataSizeTF]];
    
    [self.rightLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20.f);
        make.width.height.mas_equalTo(150.f);
        make.centerY.equalTo(self);
    }];
    
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rightLogoImgView).offset(10.f);
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.right.equalTo(self).offset(-kMarginRight);
    }];
    _titleTF.cell.title = @"扫描完毕";
    _titleTF.textColor = [NSColor whiteColor];
    _titleTF.bordered = NO;
    _titleTF.font = [NSFont systemFontOfSize:20.f];
    _titleTF.backgroundColor = [NSColor clearColor];
    
    [_titleBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleTF.mas_bottom).offset(kVerticalSpace);
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.right.equalTo(self).offset(-kMarginRight);
        make.height.mas_equalTo(1.f);
    }];
    _titleBottomLine.layer = CALayer.layer;
    _titleBottomLine.layer.backgroundColor = [NSColor colorWithWhite:0.8 alpha:0.7].CGColor;
    
    [_trashDataTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.top.equalTo(self.titleBottomLine.mas_bottom).offset(kVerticalSpace);
    }];
    _trashDataTF.font = [NSFont systemFontOfSize:25.f];
    _trashDataTF.textColor = [NSColor colorWithRed:101.f/255.f green:217.f/255.f blue:1.f alpha:1.f];
    _trashDataTF.bordered = NO;
    _trashDataTF.backgroundColor = [NSColor clearColor];
    _trashDataTF.cell.title = @"垃圾的数据";
    [_trashDataTF sizeToFit];
    
    [_intelligenceDescTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-kMarginRight);
        make.bottom.equalTo(self.trashDataTF);
        make.width.mas_equalTo(50.f);
    }];
    _intelligenceDescTF.cell.title = @"智能选择";
    _intelligenceDescTF.textColor = [NSColor colorWithWhite:0.8 alpha:0.7];
    _intelligenceDescTF.bordered = NO;
    _intelligenceDescTF.font = [NSFont systemFontOfSize:11.f];
    _intelligenceDescTF.alignment = NSTextAlignmentRight;
    _intelligenceDescTF.backgroundColor = [NSColor clearColor];
    
    [_trashDataBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.trashDataTF.mas_bottom).offset(kVerticalSpace);
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.right.equalTo(self).offset(-kMarginRight);
        make.height.mas_equalTo(1.f);
    }];
    _trashDataBottomLine.layer = CALayer.layer;
    _trashDataBottomLine.layer.backgroundColor = [NSColor colorWithWhite:0.8 alpha:0.7].CGColor;
    
    [_includeTitleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.top.equalTo(self.trashDataBottomLine.mas_bottom).offset(kVerticalSpace);
    }];
    _includeTitleTF.cell.title = @"包括";
    _includeTitleTF.backgroundColor = [NSColor clearColor];
    _includeTitleTF.font = [NSFont systemFontOfSize:11.f];
    _includeTitleTF.textColor = [NSColor colorWithWhite:0.9 alpha:1.f];
    _includeTitleTF.alignment = NSTextAlignmentLeft;
    _includeTitleTF.backgroundColor = [NSColor clearColor];
    _includeTitleTF.bordered = NO;
    [_includeTitleTF sizeToFit];
    
    [_includeContentTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.top.equalTo(self.includeTitleTF.mas_bottom).offset(1.f);
        make.right.equalTo(self).offset(-kMarginRight);
    }];
    _includeContentTF.cell.title = @"· Macintosh HD 上的废纸篓";
    _includeContentTF.textColor = [NSColor colorWithWhite:0.8 alpha:0.7];
    _includeContentTF.bordered = NO;
    _includeContentTF.font = [NSFont boldSystemFontOfSize:11.f];
    _includeContentTF.backgroundColor = [NSColor clearColor];
    [_includeTitleTF sizeToFit];

    [_lookAtBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.top.equalTo(self.includeContentTF.mas_bottom).offset(13.f);
    }];
    _lookAtBtn.title = @"查看项目";
    _lookAtBtn.font  = [NSFont systemFontOfSize:11.f];
    _lookAtBtn.layer = CALayer.layer;
    _lookAtBtn.layer.backgroundColor = [NSColor blackColor].CGColor;
    _lookAtBtn.layer.cornerRadius = 2.f;
    _lookAtBtn.layer.masksToBounds  = YES;

    [_totalDataSizeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lookAtBtn.mas_right).offset(10.f);
        make.centerY.equalTo(self.lookAtBtn);
        make.right.equalTo(self).offset(-kMarginRight);
    }];
//    _totalDataSizeTF.cell.title = @"共发现";
    _totalDataSizeTF.font = [NSFont systemFontOfSize:11.f];
    _totalDataSizeTF.textColor = [NSColor colorWithWhite:0.8 alpha:0.6];
    _totalDataSizeTF.backgroundColor = [NSColor clearColor];
    _totalDataSizeTF.bordered = NO;
    [_totalDataSizeTF sizeToFit];
    
}


- (void)onLookAtMoreAction:(id)sender {
    NSLog(@"look at more project");
}

@end
