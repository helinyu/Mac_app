//
//  CMTrashInfoDetailCellView.m
//  CleanMac
//
//  Created by Aka on 2020/1/17.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMTrashInfoDetailCellView.h"
#import "NSButton+CMAdd.h"
#import "NSTextField+CMAdd.h"
#import "CMFileManger.h"

@interface CMTrashInfoDetailCellView ()

@property (nonatomic, strong) NSButton *choiceBtn;
@property (nonatomic, strong) NSImageView *categoryImgView;
@property (nonatomic, strong) NSTextField *descTF;
@property (nonatomic, strong) NSTextField *weightTF;

@end

@implementation CMTrashInfoDetailCellView

- (instancetype)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initBase];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initBase];
    }
    return self;
}

- (void)initBase {
    self.wantsLayer = YES;
    self.layer.backgroundColor = [NSColor blackColor].CGColor;
    
    _choiceBtn = [NSButton cm_buttonWithImgName:@"icon_select_16" target:self action:@selector(onChoiceAction:)];
    _categoryImgView = [NSImageView new];
    _descTF = [NSTextField new];
    _weightTF = [NSTextField new];
    
    [self cm_addSubviews:@[_choiceBtn, _categoryImgView, _descTF, _weightTF]];
    
    [_weightTF mas_makeConstraints:^(MASConstraintMaker *make) {
         make.right.equalTo(self).offset(-10.f);
         make.centerY.equalTo(self);
         make.height.mas_equalTo(20.f);
     }];
    [_weightTF configLabelNotBorderTitle:@"权重" systemFontSize:14.f bgColor:[NSColor clearColor] textColor:[NSColor whiteColor]];
    
    [_choiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10.f);
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(20.f);
    }];
//FIXME:    为什么mac中没有ios的选择类型
    [_choiceBtn setButtonType:NSButtonTypeSwitch];
    
    [_categoryImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.choiceBtn.mas_right).offset(5.f);
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(60.f);
    }];
    _categoryImgView.image = [NSImage imageNamed:@"icon_trash_water_cut_60"];
        
    [_descTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.categoryImgView.mas_right).offset(6.f);
        make.centerY.equalTo(self);
        make.right.lessThanOrEqualTo(self.weightTF.mas_left).offset(-5.f);
        make.height.mas_equalTo(24.f);
    }];
    [_descTF configLabelNotBorderTitle:@"描述" systemFontSize:15.f bgColor:[NSColor clearColor] textColor:[NSColor whiteColor]];
    _descTF.maximumNumberOfLines = 1;
}

- (void)configName:(NSString *)name {
    _descTF.cell.title = name;
}

- (void)configWeight:(long long)weight {
    _weightTF.cell.title = [CMFileManger fileSizeTranslateToLargerUnitWithOriginSize:weight];
}

- (void)configChoiceBtnState:(BOOL)isSelected {
    if (isSelected) {
        self.choiceBtn.image = [NSImage imageNamed:@"icon_selected_16"];
    }
    else {
        self.choiceBtn.image = [NSImage imageNamed:@"icon_select_16"];
    }
}

- (void)configName:(NSString *)name weight:(long long)weight {
    [self configName:name];
    [self configWeight:weight];
}

- (void)configName:(NSString *)name weight:(long long)weight selectState:(BOOL)isSelected{
    [self configName:name];
    [self configWeight:weight];
    [self configChoiceBtnState:isSelected];
}

- (void)onChoiceAction:(NSButton *)sender {
    if ([self.delegate respondsToSelector:@selector(view:onActionType:)]) {
        [self.delegate view:self onActionType:CMViewActionTypeSelect];
    }
}

@end
