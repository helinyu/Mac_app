//
//  CMRightLogoBaseView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/20 19:32 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMRightLogoBaseView.h"
#import <Masonry.h>

@interface CMRightLogoBaseView ()

@property (nonatomic, strong) NSImageView *rightLogoImgView;

@end

@implementation CMRightLogoBaseView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self logoViewInit];
    }
    return self;
}

- (void)logoViewInit {
    _rightLogoImgView = [NSImageView new];
    [self addSubview:_rightLogoImgView];
    _rightLogoImgView.image = [NSImage imageNamed:@"icon_trash_large"];
}


@end
