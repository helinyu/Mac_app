//
//  XNIntelligenceView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 16:46 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMIntelligenceView.h"
#import "NSButton+CMAdd.h"
#import "NSView+CMAdd.h"
#import <Masonry.h>

@interface CMIntelligenceView ()

@property (nonatomic, strong) NSImageView *logoImgView;
@property (nonatomic, strong) NSTextField *titleTF;
@property (nonatomic, strong) NSTextField *descTF;
@property (nonatomic, strong) NSButton *scanBtn;

@end

static NSString *const kScanText = @"扫描";
static NSString *const kStopText = @"停止";

@implementation CMIntelligenceView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)baseInit {
    
    self.layer = CALayer.layer;
    self.layer.backgroundColor = [NSColor colorWithRed:0.f green:161.f/255.f blue:217.f alpha:1.f].CGColor;
    
    _logoImgView = [NSImageView new];
    _titleTF = [NSTextField new];
    _descTF = [NSTextField new];
    _scanBtn = [NSButton cm_buttonWithTitle:kScanText target:self action:@selector(onScanAction:)];
    [self cm_addSubviews:@[_logoImgView, _titleTF, _descTF, _scanBtn]];
    
    [_logoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(-100.f);
        make.centerX.equalTo(self);
        make.width.height.mas_equalTo(150.f);
    }];
    _logoImgView.image = [NSImage imageNamed:@"icon_logo_large_clear"];
    
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.logoImgView.mas_bottom).offset(10.f);
        make.left.right.equalTo(self);
    }];
    _titleTF.font = [NSFont systemFontOfSize:30.f weight:NSFontWeightBold];
    _titleTF.textColor = [NSColor whiteColor];
    _titleTF.cell.title = @"欢迎使用Clean Mac";
    _titleTF.alignment = NSTextAlignmentCenter;
    _titleTF.backgroundColor = [NSColor colorWithRed:0.f green:161.f/255.f blue:217.f alpha:1.f];
    _titleTF.bordered = NO;
    _titleTF.editable = NO;
    [_titleTF sizeToFit];
    
    [_descTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleTF.mas_bottom).offset(10.f);
        make.centerX.equalTo(self);
        make.left.right.equalTo(self);
    }];
    _descTF.textColor = [NSColor whiteColor];
    _descTF.font = [NSFont systemFontOfSize:15.f];
    _descTF.cell.title = @"开始全面、仔细扫描您的Mac";
    _descTF.alignment = NSTextAlignmentCenter;
    _descTF.backgroundColor = [NSColor colorWithRed:0.f green:161.f/255.f blue:217.f alpha:1.f];
    _descTF.bordered = NO;
    _descTF.editable = NO;
    [_descTF sizeToFit];
    
    [_scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(80.f);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(-10.f);
    }];
    _scanBtn.layer = CALayer.layer;
    _scanBtn.layer.backgroundColor = [NSColor blackColor].CGColor;
    _scanBtn.layer.cornerRadius = 38.f;
    
}

- (void)onScanAction:(id)sender {
    
    if ([_scanBtn.title isEqualToString:kScanText]) {
        [_scanBtn setTitle:kStopText];
        NSLog(@"开始扫描。。。。。。");
    }
    else {
        [_scanBtn setTitle:kScanText];
        NSLog(@"停止扫描。。。。。。");
    }
}

@end
