//
//  CMMainPageClassTCellView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 12:47 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMMainPageClassTCellView.h"
#import <Masonry.h>

@interface CMMainPageClassTCellView ()

@property (nonatomic, strong) NSTextField *titleTF;

@end

@implementation CMMainPageClassTCellView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)baseInit {
    
    _titleTF = [NSTextField new];
    [self addSubview:_titleTF];
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    _titleTF.textColor = [NSColor redColor];
    _titleTF.font = [NSFont systemFontOfSize:12.f];
    _titleTF.cell.title = @"nam11e";
    _titleTF.cell.alignment = NSTextAlignmentLeft;
}

@end
