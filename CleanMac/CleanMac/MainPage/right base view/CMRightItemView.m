//
//  CMRightItemView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 19:20 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//


#import "CMRightItemView.h"
#import "NSView+CMAdd.h"
#import <Masonry.h>

@interface CMRightItemView ()

@property (nonatomic, strong) NSImageView *iconImgView;
@property (nonatomic, strong) NSTextField *titleTF;
@property (nonatomic, strong) NSTextField *descTF;

@end

@implementation CMRightItemView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
        [self initContraints];
        [self initStyle];
    }
    return self;
}

- (void)initView {
    _iconImgView = [NSImageView new];
    _titleTF = [NSTextField new];
    _descTF = [NSTextField new];
    [self cm_addSubviews:@[_iconImgView, _titleTF, _descTF]];
}

- (void)initContraints {
    
    [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(60.f);
        make.top.equalTo(self).offset(10.f);
    }];
    
    [_descTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_centerY);
        make.left.equalTo(self.iconImgView.mas_right).offset(10.f);
        make.right.equalTo(self);
    }];
    
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(10.f);
        make.right.equalTo(self);
        make.bottom.equalTo(self.descTF.mas_top).offset(-5.f);
    }];
}

- (void)initStyle {
    {
        [_descTF setTextColor:[NSColor colorWithWhite:1.f alpha:0.9]];
        [_descTF setFont:[NSFont systemFontOfSize:10.f]];
        _descTF.bordered = NO;
        _descTF.backgroundColor = [NSColor clearColor];
        _descTF.maximumNumberOfLines = 0;
        _descTF.editable = NO;
    }
    
    {
        [_titleTF setTextColor:[NSColor colorWithWhite:1.f alpha:1.f]];
        [_titleTF setFont:[NSFont systemFontOfSize:12.f]];
        _titleTF.bordered = NO;
        _titleTF.backgroundColor = [NSColor clearColor];
        _titleTF.maximumNumberOfLines = 0;
        _titleTF.editable = NO;
    }
}

- (void)configImgName:(NSString *)imgName title:(NSString *)title desc:(NSString *)desc {
    _iconImgView.image = [NSImage imageNamed:imgName];
    _titleTF.cell.title = title;
    _descTF.cell.title = desc;
}


@end
