//
//  CMScanView.m
//  CleanMac
//
//  Created by Aka on 2020/1/15.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMScanView.h"
#import "CMScanContentView.h"

kConstCGFloat(kScanViewH, 60.f );

@interface CMScanView ()

@property (nonatomic, strong) CMScanContentView *scanContentView;
@property (nonatomic, strong) NSTextField *descTF;

@end

@implementation CMScanView

- (void)baseInit {
    [super baseInit];
    
    _scanContentView = [CMScanContentView new];
    _descTF = [NSTextField new];
    [self cm_addSubviews:@[_scanContentView, _descTF]];
    
    [_scanContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.top.equalTo(self);
        make.left.equalTo(self);
    }];
    _scanContentView.layer = CALayer.layer;
    _scanContentView.layer.backgroundColor = [NSColor clearColor].CGColor;
    
    W_S;
    _scanContentView.scanActionBlock = ^{
        if ([weakSelf.scanViewDelegate respondsToSelector:@selector(scanView:actionType:)]) {
            [weakSelf.scanViewDelegate scanView:weakSelf actionType:CMScanViewTypeScanTap];
        }
    };
    
    [_descTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.scanContentView.mas_right).offset(5.f);
        make.right.equalTo(self);
        make.height.mas_equalTo(30.f);
    }];
    _descTF.cell.title = @"xx.xxxG";
    [_descTF setFont:[NSFont systemFontOfSize:15.f]];
    _descTF.backgroundColor = [NSColor clearColor];
    [_descTF setTextColor:[NSColor colorWithWhite:1.f alpha:0.8]];
    _descTF.bordered = NO;
    _descTF.maximumNumberOfLines = 0;
    _descTF.alignment = NSTextAlignmentLeft;
    [_descTF sizeToFit];
    _descTF.editable = NO;
    
    
}

@end
