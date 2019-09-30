
//
//  CMPreScanLeftCellView.m
//  CleanMac
//
//  Created by Aka on 2019/9/27.
//  Copyright © 2019 Aka. All rights reserved.
//

#import "CMPreScanLeftCellView.h"
#import <Cocoa/Cocoa.h>
#import <AppKit/AppKit.h>

@interface CMPreScanLeftCellView ()

@property (nonatomic, strong) NSTextField *titleTF;
@property (nonatomic, strong) NSTextField *descTF;
@property (nonatomic, strong) NSImageView *iconView;

@end

@implementation CMPreScanLeftCellView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    _titleTF = [NSTextField new];
    _descTF = [NSTextField new];
    _iconView = [NSImageView new];
    [self cm_addSubviews:@[_titleTF, _descTF, _iconView]];
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.width.height.mas_equalTo(80.f);
    }];
    _iconView.layer.cornerRadius = 40.f;
    _iconView.layer.masksToBounds = YES;
    
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(10.f);
        make.bottom.equalTo(self.iconView.mas_centerY).offset(-5.f);
    }];
    _titleTF.font = [NSFont systemFontOfSize:13.f];
    _titleTF.textColor = [NSColor redColor];
    _titleTF.editable = NO;
    _titleTF.bordered = NO;
    _titleTF.backgroundColor = [NSColor clearColor];
    _titleTF.alignment = NSTextAlignmentLeft;
    _titleTF.cell.title = @"标题";
    [_titleTF sizeToFit];
    
    [_descTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(10.f);
        make.top.equalTo(self.iconView.mas_centerY).offset(5.f);
    }];
    _descTF.font = [NSFont systemFontOfSize:10.f];
    _titleTF.textColor = [NSColor redColor];
    _titleTF.editable = NO;
    _titleTF.bordered = NO;
    _titleTF.backgroundColor = [NSColor clearColor];
    _titleTF.alignment = NSTextAlignmentLeft;
    [_titleTF sizeToFit];
}

- (void)configIconName:(NSString *)iconName title:(NSString *)title desc:(NSString *)desc {
    
    _iconView.image = [NSImage imageNamed:iconName];
    _titleTF.cell.title = title;
    _descTF.cell.title = desc;
}


@end
