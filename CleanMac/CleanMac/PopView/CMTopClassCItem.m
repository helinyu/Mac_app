//
//  CMTopClassCItem.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/16 15:16 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMTopClassCItem.h"
#import <Masonry.h>

@interface CMTopClassCItem ()

@property (weak) IBOutlet NSImageView *curBusinessIconView;
@property (weak) IBOutlet NSTextField *titleLabel;
@property (weak) IBOutlet NSImageView *rightTopImgView;
@property (weak) IBOutlet NSTextField *rightTopLabel;
@property (weak) IBOutlet NSTextField *avaibleLabel;
@property (weak) IBOutlet NSTextField *rightBottomLabel;
@property (weak) IBOutlet NSProgressIndicator *progressView;
@property (weak) IBOutlet NSView *bgView;

@property (weak) IBOutlet NSView *topBgView;
@property (weak) IBOutlet NSView *bottomBgView;


@end

@implementation CMTopClassCItem

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self viewInit];
    
//    CALayer *layer = CALayer.layer;
//    layer.frame = self.view.bounds;
//    self.view.layer = layer;
//    layer.backgroundColor = [NSColor grayColor].CGColor;
//    [self.view setNeedsDisplay:YES];
    
    _curBusinessIconView.image = [NSImage imageNamed:@"icon_pop_memory"];
    
}

- (void)viewInit {
    
    self.topBgView.layer = CALayer.layer;
    self.topBgView.layer.backgroundColor = [NSColor colorWithRed:86.f/255.f green:82.f/255.f blue:90.f/255.f alpha:1.f].CGColor;
    
    self.bottomBgView.layer = CALayer.layer;
    self.bottomBgView.layer.backgroundColor =[NSColor colorWithRed:90.f/255.f green:87.f/255.f blue:96.f/255.f alpha:1.f].CGColor;
    
    self.bgView.layer = CALayer.layer;
    self.bgView.layer.cornerRadius = 5.f;
    self.bgView.layer.masksToBounds = YES;
    
    [_curBusinessIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topBgView);
        make.left.equalTo(self.topBgView).offset(8.f);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topBgView);
        make.left.equalTo(self.curBusinessIconView.mas_right).offset(4.f);
    }];
    _titleLabel.cell.title = @"内存：8G";
    [_titleLabel setTextColor:[NSColor colorWithRed:229.f/255.f green:229.f/255.f blue:229.f/255.f alpha:1.f]];
    [_titleLabel setFont:[NSFont systemFontOfSize:10.f]];
    
    [_avaibleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomBgView).offset(10.f);
        make.top.equalTo(self.bottomBgView).offset(4.f);
    }];
    _avaibleLabel.cell.title  = @"可用 : 4G";
    [_avaibleLabel setTextColor:[NSColor whiteColor]];
    [_avaibleLabel setFont:[NSFont systemFontOfSize:13.f]];
    
    [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomBgView).offset(10.f);
        make.top.equalTo(self.avaibleLabel.mas_bottom).offset(3.f);
        make.right.equalTo(self.bottomBgView).offset(-10.f);
    }];
    _progressView.doubleValue = 20;
    _progressView.controlTint = NSBlueControlTint;
    
    [_rightBottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bottomBgView).offset(-10.f);
        make.bottom.equalTo(self.bottomBgView).offset(-4.f);
    }];
    _rightBottomLabel.cell.title = @"释放";
    [_rightBottomLabel setTextColor:[NSColor colorWithRed:139.f/255.f green:139.f/255.f blue:139.f/255.f alpha:1.f]];
    [_rightBottomLabel setFont:[NSFont systemFontOfSize:10.f]];

}

@end
