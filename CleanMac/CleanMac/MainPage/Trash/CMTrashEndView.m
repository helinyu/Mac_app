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

@property (nonatomic, strong) NSImageView *noDataIconView;
@property (nonatomic, strong) NSTextField *noDataTitleTF;
@property (nonatomic, strong) NSTextField *noDataDescTF;

@end

static CGFloat const kMarginLeft = 10.f;
static CGFloat const kMarginRight = 10.f;
static CGFloat const kVerticalSpace = 4.f;

@implementation CMTrashEndView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initView];
        [self initContraints];
        [self initStyle];

        [self initbNoDataUI];
        [self configDataUIHidden:YES];
        [self configNoDataUIHidden:YES];
    }
    return self;
}

- (void)initView {
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
}

- (void)initbNoDataUI {
    _noDataIconView = [NSImageView new];
    _noDataTitleTF = [NSTextField new];
    _noDataDescTF = [NSTextField new];
    [self cm_addSubviews:@[_noDataIconView,_noDataTitleTF, _noDataDescTF]];
    
    //     net
    [_noDataIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_centerY);
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(10.f);
        make.width.height.mas_equalTo(25.f);
    }];
    
    [_noDataTitleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.noDataIconView);
        make.left.equalTo(self.noDataIconView.mas_right).offset(2.f);
    }];
    
    [_noDataDescTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.noDataTitleTF.mas_bottom).offset(6.f);
        make.left.equalTo(self.noDataIconView);
    }];
    
    //     next
    _noDataIconView.image = [NSImage imageNamed:@"icon_trahs_end_empty"];
    
    _noDataTitleTF.font = [NSFont systemFontOfSize:23.f];
    _noDataTitleTF.textColor = [NSColor whiteColor];
    _noDataTitleTF.backgroundColor = [NSColor clearColor];
    _noDataTitleTF.bordered = NO;
    _noDataTitleTF.alignment = NSTextAlignmentLeft;
    _noDataTitleTF.cell.title = @"非常干净";
    [_noDataTitleTF sizeToFit];
    
    _noDataDescTF.font = [NSFont systemFontOfSize:13.f];
    _noDataDescTF.textColor = [NSColor colorWithWhite:0.8 alpha:1.f];
    _noDataDescTF.backgroundColor = [NSColor clearColor];
    _noDataDescTF.bordered = NO;
    _noDataDescTF.alignment = NSTextAlignmentLeft;
    _noDataDescTF.cell.title = @"任何废纸篓中都没有文件";
    [_noDataDescTF sizeToFit];
}

- (void)initContraints {
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
    
    [_titleBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleTF.mas_bottom).offset(kVerticalSpace);
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.right.equalTo(self).offset(-kMarginRight);
        make.height.mas_equalTo(1.f);
    }];
    
    [_trashDataTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.top.equalTo(self.titleBottomLine.mas_bottom).offset(kVerticalSpace);
    }];
    
    [_intelligenceDescTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-kMarginRight);
        make.bottom.equalTo(self.trashDataTF);
        make.width.mas_equalTo(50.f);
    }];
    
    [_trashDataBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.trashDataTF.mas_bottom).offset(kVerticalSpace);
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.right.equalTo(self).offset(-kMarginRight);
        make.height.mas_equalTo(1.f);
    }];
    
    [_includeTitleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.top.equalTo(self.trashDataBottomLine.mas_bottom).offset(kVerticalSpace);
    }];
    
    [_includeContentTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.top.equalTo(self.includeTitleTF.mas_bottom).offset(1.f);
        make.right.equalTo(self).offset(-kMarginRight);
    }];
    
    [_lookAtBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.top.equalTo(self.includeContentTF.mas_bottom).offset(13.f);
    }];
    
    [_totalDataSizeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lookAtBtn.mas_right).offset(10.f);
        make.centerY.equalTo(self.lookAtBtn);
        make.right.equalTo(self).offset(-kMarginRight);
    }];
}

- (void)initStyle {
    _titleTF.cell.title = @"扫描完毕";
    _titleTF.textColor = [NSColor whiteColor];
    _titleTF.bordered = NO;
    _titleTF.font = [NSFont systemFontOfSize:20.f];
    _titleTF.backgroundColor = [NSColor clearColor];
    
    _titleBottomLine.layer = CALayer.layer;
    _titleBottomLine.layer.backgroundColor = [NSColor colorWithWhite:0.8 alpha:0.7].CGColor;
    
    _trashDataTF.font = [NSFont systemFontOfSize:25.f];
    _trashDataTF.textColor = [NSColor colorWithRed:101.f/255.f green:217.f/255.f blue:1.f alpha:1.f];
    _trashDataTF.bordered = NO;
    _trashDataTF.backgroundColor = [NSColor clearColor];
    _trashDataTF.cell.title = @"垃圾的数据";
    [_trashDataTF sizeToFit];
    
    _intelligenceDescTF.cell.title = @"智能选择";
    _intelligenceDescTF.textColor = [NSColor colorWithWhite:0.8 alpha:0.7];
    _intelligenceDescTF.bordered = NO;
    _intelligenceDescTF.font = [NSFont systemFontOfSize:11.f];
    _intelligenceDescTF.alignment = NSTextAlignmentRight;
    _intelligenceDescTF.backgroundColor = [NSColor clearColor];
    
    _trashDataBottomLine.layer = CALayer.layer;
    _trashDataBottomLine.layer.backgroundColor = [NSColor colorWithWhite:0.8 alpha:0.7].CGColor;
    
    
    _includeTitleTF.cell.title = @"包括";
    _includeTitleTF.backgroundColor = [NSColor clearColor];
    _includeTitleTF.font = [NSFont systemFontOfSize:11.f];
    _includeTitleTF.textColor = [NSColor colorWithWhite:0.9 alpha:1.f];
    _includeTitleTF.alignment = NSTextAlignmentLeft;
    _includeTitleTF.backgroundColor = [NSColor clearColor];
    _includeTitleTF.bordered = NO;
    [_includeTitleTF sizeToFit];
    
    _includeContentTF.cell.title = @"· Macintosh HD 上的废纸篓";
    _includeContentTF.textColor = [NSColor colorWithWhite:0.8 alpha:0.7];
    _includeContentTF.bordered = NO;
    _includeContentTF.font = [NSFont boldSystemFontOfSize:11.f];
    _includeContentTF.backgroundColor = [NSColor clearColor];
    [_includeTitleTF sizeToFit];
    
    _lookAtBtn.title = @"查看项目";
    _lookAtBtn.font  = [NSFont systemFontOfSize:11.f];
    _lookAtBtn.layer = CALayer.layer;
    _lookAtBtn.layer.backgroundColor = [NSColor blackColor].CGColor;
    _lookAtBtn.layer.cornerRadius = 2.f;
    _lookAtBtn.layer.masksToBounds  = YES;
    
    _totalDataSizeTF.font = [NSFont systemFontOfSize:11.f];
    _totalDataSizeTF.textColor = [NSColor colorWithWhite:0.8 alpha:0.6];
    _totalDataSizeTF.backgroundColor = [NSColor clearColor];
    _totalDataSizeTF.bordered = NO;
    [_totalDataSizeTF sizeToFit];
    

}


- (void)configDataIsEmpty:(BOOL)isEmtpy {
    [self configNoDataUIHidden:!isEmtpy];
    [self configDataUIHidden:isEmtpy];
}

- (void)configDataUIHidden:(BOOL)isHidden {
    _titleTF.hidden = isHidden;
    _titleBottomLine.hidden = isHidden;
    _trashDataTF.hidden = isHidden;
    _intelligenceDescTF.hidden = isHidden;
    _trashDataBottomLine.hidden = isHidden;
    _includeTitleTF.hidden = isHidden;
    _includeContentTF.hidden = isHidden;
    _lookAtBtn.hidden = isHidden;
    _totalDataSizeTF.hidden = isHidden;
}

- (void)configNoDataUIHidden:(BOOL)isHidden {
    _noDataTitleTF.hidden = isHidden;
    _noDataDescTF.hidden = isHidden;
    _noDataIconView.hidden = isHidden;
}

- (void)onLookAtMoreAction:(id)sender {
    NSLog(@"look at more project");
}

@end
