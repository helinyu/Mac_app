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

@interface CMMainPageClassTCellView ()

@property (nonatomic, strong) NSTextField *titleTF;

@end

@implementation CMMainPageClassTCellView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
}

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)baseInit {
    _titleTF = [NSTextField new];
    [self addSubview:_titleTF];
    _titleTF.cell.title = @"title";
    [_titleTF setTextColor:[NSColor redColor]];
    
}

@end
