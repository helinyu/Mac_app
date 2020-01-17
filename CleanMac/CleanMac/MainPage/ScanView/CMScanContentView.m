//
//  CMScanContentView.m
//  CleanMac
//
//  Created by Aka on 2020/1/15.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMScanContentView.h"
#import "NSButton+CMAdd.h"

@interface CMScanContentView ()

@property (nonatomic, strong) NSButton *scanBtn;// 在最上层

@property (nonatomic, strong) NSView *outsideCircleView;

@property (nonatomic, strong) NSView *progressCircleLine;

@end

kConstCGFloat(kScanContentH, 80.f);

@implementation CMScanContentView

- (void)baseInit {
    [super baseInit];

    _scanBtn = [NSButton cm_buttonWithTitle:@"扫描" target:self action:@selector(onScanAction:)];
    _outsideCircleView = [NSView new];
    
    [self cm_addSubviews:@[_outsideCircleView,_scanBtn]];
    
    _outsideCircleView.layer = CALayer.layer;
    _outsideCircleView.layer.backgroundColor = [NSColor colorWithRed:88.f/255.f green:89.f/255.f blue:101.f/255.f alpha:1.f].CGColor;
    _outsideCircleView.layer.cornerRadius = kScanContentH/2.f;
    _outsideCircleView.layer.masksToBounds = YES;
    [_outsideCircleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scanBtn);
    }];
//     应该在中间画图一个贝塞尔曲线的圆
    
    [_scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        make.height.width.mas_equalTo(kScanContentH);
    }];
    _scanBtn.layer = CALayer.layer;
    _scanBtn.layer.backgroundColor = [NSColor clearColor].CGColor;
    _scanBtn.layer.cornerRadius = kScanContentH/2.f;
    _scanBtn.layer.masksToBounds = YES;
    [_scanBtn cleanBgColor];
}

- (void)onScanAction:(NSButton *)sender {
    !_scanActionBlock? :_scanActionBlock();
}

@end
