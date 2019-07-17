//
//  CMTrashOptionView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 19:20 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMTrashOptionView.h"

@interface CMTrashOptionView ()

@property (nonatomic, strong) NSImageView *iconImgView;
@property (nonatomic, strong) NSTextField *titleTF;
@property (nonatomic, strong) NSTextField *descTF;

@end

@implementation CMTrashOptionView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)baseInit {
    _iconImgView = [NSImageView new];
    _titleTF = [NSTextField new];
    _descTF = [NSTextField new];
    
}

@end
