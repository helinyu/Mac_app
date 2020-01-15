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
    

#import "CMTrashScanBeforeView.h"
#import "NSView+CMAdd.h"
#import "NSButton+CMAdd.h"
#import "CMRightItemView.h"
#import <Masonry.h>

@interface CMTrashScanBeforeView ()

@end

@implementation CMTrashScanBeforeView


- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTrashBeforeView];
    }
    return self;
}

- (void)initTrashBeforeView {
    
    self.layer.backgroundColor = [NSColor clearColor].CGColor;
 
    [self.rightLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).offset(100.f);
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(150.f);
    }];
    
    [self.firstItemView configImgName:@"icon_trash_dustbin32" title:@"立即倾倒所有垃圾" desc:@"无需浏览所有的驱动器和应用查找它们的废纸篓"];
    [self.secondItemView configImgName:@"icon_finder" title:@"避免各种\"访达\"错误" desc:@"确保倾倒您的废纸篓,不管是否有任何问题"];
}

@end
