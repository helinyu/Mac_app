//
//  CMPopHeaderView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/16 15:46 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMPopHeaderView.h"
#import <Masonry.h>

@interface CMPopHeaderView ()

@property (nonatomic, strong) NSButton *unlockBtn;
@property (nonatomic, strong) NSView *btnBgView;

@end

static NSString *const kHeaderTitle = @"解锁完整版本";

@implementation CMPopHeaderView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)baseInit {
    
    _btnBgView = [NSView new];
    [self addSubview:_btnBgView];
    [_btnBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.height.mas_equalTo(32.f);
        make.left.equalTo(self).offset(14.f);
    }];
    CALayer *layer = [CALayer layer];
    _btnBgView.layer = layer;
    _btnBgView.layer.backgroundColor =[NSColor colorWithRed:255.f/255.f green:199.f/255.f blue:0.f alpha:1.f].CGColor;
    _btnBgView.layer.cornerRadius = 4.f;
    _btnBgView.layer.masksToBounds = YES;
    
    if (@available(macOS 10.12, *)) {
        _unlockBtn = [NSButton buttonWithTitle:kHeaderTitle target:self action:@selector(onUnlockAction:)];
    } else {
        _unlockBtn = [NSButton new];
        _unlockBtn.bezelStyle = NSTextFieldRoundedBezel;
        [_unlockBtn setTitle:kHeaderTitle];
        [_unlockBtn setTarget:self];
        [_unlockBtn setAction:@selector(onUnlockAction:)];
    }
    [_btnBgView addSubview:_unlockBtn];
    _unlockBtn.bordered = NO;
    
    [_unlockBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.unlockBtn.superview);
    }];
}

- (void)onUnlockAction:(id)sender {
    NSLog(@"lock action");
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
