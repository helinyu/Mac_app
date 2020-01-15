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


#import "CMRightBaseView.h"
#import "CMRightItemView.h"
#import "NSView+CMAdd.h"
#import "NSButton+CMAdd.h"
#import <Masonry.h>

@interface CMRightBaseView ()

@property (nonatomic, strong) NSTextField *titleTF;
@property (nonatomic, strong) NSTextField *descTF;
@property (nonatomic, strong) CMRightItemView *firstItemView;
@property (nonatomic, strong) CMRightItemView *secondItemView;

@property (nonatomic, strong) NSTextField *scaningTitleTF;
@property (nonatomic, strong) NSTextField *scaningDescTF;

@property (nonatomic, strong) NSImageView *endImgView;
@property (nonatomic, strong) NSTextField *endTitleTF;
@property (nonatomic, strong) NSTextField *endDescTF;

@end

static CGFloat kTrashMarginLeft = 60.f;

@implementation CMRightBaseView

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
    _titleTF = [NSTextField new];
    _descTF = [NSTextField new];
    _firstItemView = [CMRightItemView new];
    _secondItemView = [CMRightItemView new];
    [self cm_addSubviews:@[_titleTF, _descTF, _firstItemView, _secondItemView]];
}

- (void)initContraints {
    [_firstItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.descTF);
        make.centerY.equalTo(self);
        make.right.equalTo(self.rightLogoImgView.mas_left);
    }];
    
    [_secondItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.descTF);
        make.top.equalTo(self.firstItemView.mas_bottom).offset(0.f);
        make.right.equalTo(self.rightLogoImgView.mas_left).offset(-50.f);
    }];
    
    [_descTF mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.left.equalTo(self).offset(kTrashMarginLeft);
        make.bottom.equalTo(self.firstItemView.mas_top).offset(-10.f);
        make.right.equalTo(self.rightLogoImgView.mas_left).offset(-50.f);
    }];
    
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.descTF);
        make.bottom.equalTo(self.descTF.mas_top).offset(-10.f);
        make.right.equalTo(self.rightLogoImgView.mas_left);
    }];
}

- (void)initStyle {
    [_firstItemView configImgName:@"icon_trash_dustbin" title:@"立即倾倒所有垃圾" desc:@"无需浏览所有的驱动器和应用查找它们的废纸篓"];
    [_secondItemView configImgName:@"icon_trash_dustbin" title:@"立即倾倒所有垃圾" desc:@"无需浏览所有的驱动器和应用查找它们的废纸篓"];
    
    {
        _descTF.cell.title = @"倾倒mac上的所有废纸篓,包括图片和照片图库垃圾";
        [_descTF setFont:[NSFont systemFontOfSize:15.f]];
        _descTF.backgroundColor = [NSColor clearColor];
        [_descTF setTextColor:[NSColor colorWithWhite:1.f alpha:0.8]];
        _descTF.bordered = NO;
        _descTF.maximumNumberOfLines = 0;
        _descTF.alignment = NSTextAlignmentLeft;
        [_descTF sizeToFit];
        _descTF.editable = NO;
    }
    
    {
        _titleTF.cell.title = @"废纸篓";
        [_titleTF setFont:[NSFont systemFontOfSize:26.f]];
        _titleTF.bordered = NO;
        _titleTF.editable = NO;
        _titleTF.backgroundColor = [NSColor clearColor];
        [_titleTF setTextColor:[NSColor whiteColor]];
    }
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

@end
