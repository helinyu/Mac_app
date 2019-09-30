//
//  CMPreScanLeftTitleView.m
//  CleanMac
//
//  Created by Aka on 2019/9/27.
//  Copyright © 2019 Aka. All rights reserved.
//

#import "CMPreScanLeftTitleView.h"
#import <Masonry/Masonry.h>
#import "CMPreScanTitleModel.h"
#import "NSFont+CMAdd.h"

@interface CMPreScanLeftTitleView ()

@property (nonatomic, strong) NSTextField *titleTF;
@property (nonatomic, strong) NSTextField *descTF;

@end

@implementation CMPreScanLeftTitleView

- (void)baseInit {
    [super baseInit];
    
    _titleTF = [NSTextField new];
    _descTF = [NSTextField new];
    [self cm_addSubviews:@[_titleTF, _descTF]];
    
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.right.equalTo(self).offset(0.f);
        make.height.mas_equalTo(30.f);
    }];
    _titleTF.font = [NSFont systemFontOfSize:20.f weight:NSFontWeightBold];
    _titleTF.textColor = [NSColor whiteColor];
    _titleTF.editable = NO;
    _titleTF.bordered = NO;
    _titleTF.backgroundColor = [NSColor clearColor];
    _titleTF.alignment = NSTextAlignmentLeft;
    [_titleTF sizeToFit];
    
    [_descTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self.titleTF.mas_bottom);
        make.right.equalTo(self).offset(0.f);
        make.height.mas_equalTo(20.f);
    }];
    
//    _descTF.font = [NSFont cm_monospacedSystemFontOfSize:13.f weight:NSFontWeightUltraLight];

    if (@available(macOS 10.15, *)) {
        _descTF.font = [NSFont monospacedSystemFontOfSize:13.f weight:NSFontWeightUltraLight];
    } else {
        // Fallback on earlier versions
        _descTF.font = [NSFont systemFontOfSize:13.f weight:0.9];
    }
    _descTF.textColor = [NSColor whiteColor];
    _descTF.editable = NO;
    _descTF.bordered = NO;
    _descTF.backgroundColor = [NSColor clearColor];
    _descTF.alignment = NSTextAlignmentLeft;
    [_descTF sizeToFit];
}


- (void)__configTitle:(NSString *)title desc:(NSString *)desc {
    _titleTF.cell.title = title;
    _descTF.cell.title = desc;
}

- (void)setTitleItem:(CMPreScanTitleModel *)titleItem {
    _titleItem = titleItem;
    
    [self __configTitle:titleItem.title desc:titleItem.desc];
}

@end
