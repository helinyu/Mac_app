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
    [self.rightLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self).multipliedBy(3.f/2);
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(100.f);
    }];
}

@end
