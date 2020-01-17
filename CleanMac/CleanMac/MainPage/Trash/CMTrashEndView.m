//
//  CMTrashEndView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/20 19:42 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//


#import "CMTrashEndView.h"
#import "NSTextField+CMAdd.h"
#import "NSAlert+CMAdd.h"


@interface CMTrashEndView ()

@property (nonatomic, strong) NSTextField *titleTF;
@property (nonatomic, strong) NSView *titleBottomLine;
@property (nonatomic, strong) NSTextField *trashDataTF;
@property (nonatomic, strong) NSTextField *intelligenceDescTF;
@property (nonatomic, strong) NSView *trashDataBottomLine;
@property (nonatomic, strong) NSTextField *includeTitleTF;
@property (nonatomic, strong) NSTextField *includeContentTF;
@property (nonatomic, strong) NSButton *lookAtBtn;
@property (nonatomic, strong) NSTextField *totalDataSizeTF;

@property (nonatomic, strong) NSImageView *noDataIconView;
@property (nonatomic, strong) NSTextField *noDataTitleTF;
@property (nonatomic, strong) NSTextField *noDataDescTF;

@property (nonatomic, strong) NSButton *trackBackBtn;

@end

static CGFloat const kMarginLeft = 30.f;
static CGFloat const kMarginRight = 10.f;
static CGFloat const kVerticalSpace = 4.f;
static CGFloat const kVLineSpace = 70.f;
kConstCGFloat(kLineWidth, 400.f);

@implementation CMTrashEndView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initView];
        [self initContraints];
        [self initStyle];
        
        [self initbNoDataUI];
        [self configDataUIHidden:YES];
        [self configNoDataUIHidden:YES];
    }
    return self;
}

- (void)initView {
    [self initTitleView];
    [self initContentView];
    [self initBottomView];
    
    [self cm_addSubviews:@[_titleTF, _titleBottomLine, _trashDataTF, _intelligenceDescTF, _trashDataBottomLine, _includeTitleTF, _includeContentTF, _lookAtBtn, _totalDataSizeTF]];
    
    _trackBackBtn = [NSButton cm_buttonWithTitle:@"重新开始" imgName:@"icon_white_left_arrow16" target:self action:@selector(onTrachBackAction:)];
    _trackBackBtn.attributedTitle = [[NSAttributedString alloc] initWithString:@"重新开始" attributes:@{NSForegroundColorAttributeName:[NSColor whiteColor]}];
    _trackBackBtn.font = [NSFont systemFontOfSize:18.f];
    if (@available(macOS 10.12.2, *)) {
        _trackBackBtn.bezelColor = [NSColor whiteColor];
    } else {
        // Fallback on earlier versions
    }
    
    if (@available(macOS 10.14, *)) {
        [_trackBackBtn setContentTintColor:[NSColor whiteColor]];
    } else {
        // Fallback on earlier versions
    }
    _trackBackBtn.bezelStyle = NSBezelStyleRegularSquare;
    
    NSArray<NSView *> *subViews = _trackBackBtn.subviews;
    for (NSView *subView in subViews) {
        if ([subView isKindOfClass:NSClassFromString(@"NSButtonBezelView")]) {
            subView.layer = CALayer.layer;
            subView.layer.backgroundColor = [NSColor clearColor].CGColor;
        }
    }
    
    [self addSubview:_trackBackBtn];
    [_trackBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
    }];
    
}

- (void)initTitleView {
    _titleTF = [NSTextField new];
    _titleBottomLine = [NSView new];
    [self cm_addSubviews:@[_titleTF, _titleBottomLine]];
}

- (void)initContentView {
    _trashDataTF = [NSTextField new];
    _intelligenceDescTF = [NSTextField new];
    _trashDataBottomLine = [NSView new];
    _includeTitleTF = [NSTextField new];
    _includeContentTF = [NSTextField new];
    [self cm_addSubviews:@[_trashDataTF, _intelligenceDescTF, _trashDataBottomLine, _includeTitleTF, _includeContentTF]];
    
}
- (void)initBottomView {
    _lookAtBtn = [NSButton cm_buttonWithTitle:@"查看项目" target:self action:@selector(onLookAtMoreAction:)];
    _totalDataSizeTF = [NSTextField new];
    [self cm_addSubviews:@[_lookAtBtn, _totalDataSizeTF]];
    
}


- (void)initContraints {
    [self initTitleContraints];
    [self initContentConstraints];
    [self initBottomConstraints];
}

- (void)initTitleContraints {
    [self.rightLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(150.f);
        make.centerY.equalTo(self);
        make.centerX.equalTo(self).dividedBy(2.f);
    }];
    
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rightLogoImgView);
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.right.equalTo(self).offset(-kMarginRight);
    }];
    
    [_titleBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleTF.mas_bottom).offset(20.f);
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.width.mas_equalTo(kLineWidth);
        make.height.mas_equalTo(1.f);
    }];
}

- (void)initContentConstraints {
    [self initTrashDataContstraints];
    [self initIncludeConstraints];
}

- (void)initTrashDataContstraints {
    [_trashDataTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.top.equalTo(self.titleBottomLine.mas_bottom).offset(13.f);
    }];
    
    [_trashDataBottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleBottomLine.mas_bottom).offset(kVLineSpace);
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.width.mas_equalTo(kLineWidth);
        make.height.mas_equalTo(1.f);
    }];
    
    [_intelligenceDescTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.trashDataBottomLine);
        make.bottom.equalTo(self.trashDataBottomLine.mas_top).offset(-13.f);
        make.width.mas_equalTo(80.f);
    }];
}

- (void)initIncludeConstraints {
    [_includeTitleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.top.equalTo(self.trashDataBottomLine.mas_bottom).offset(28.f);
    }];
    
    [_includeContentTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.top.equalTo(self.includeTitleTF.mas_bottom).offset(1.f);
        make.right.equalTo(self).offset(-kMarginRight);
    }];
}
- (void)initBottomConstraints {
    _lookAtBtn.bezelStyle = NSBezelStyleShadowlessSquare;
    [_lookAtBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(kMarginLeft);
        make.top.equalTo(self.includeContentTF.mas_bottom).offset(40.f);
        make.width.mas_equalTo(80.f);
        make.height.mas_equalTo(28.f);
    }];
    
    [_totalDataSizeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lookAtBtn.mas_right).offset(15.f);
        make.centerY.equalTo(self.lookAtBtn);
        make.right.equalTo(self).offset(-kMarginRight);
    }];
}

- (void)initStyle {
    [self initTitleStyle];
    [self initContentStyle];
    [self initBottomStyle];
    [self initIncludeStyle];
}

- (void)initTitleStyle {
    _titleTF.cell.title = @"扫描完毕";
    _titleTF.textColor = [NSColor whiteColor];
    _titleTF.bordered = NO;
    _titleTF.font = [NSFont boldSystemFontOfSize:26.f];
    _titleTF.backgroundColor = [NSColor clearColor];
    _titleTF.editable = NO;
    
    _titleBottomLine.layer = CALayer.layer;
    _titleBottomLine.layer.backgroundColor = [NSColor colorWithRed:104.f/255.f green:118.f/255.f blue:123.f/255.f alpha:1.f].CGColor;
}

- (void)initContentStyle {
    
    [_trashDataTF configNoBorderedClearBGWithTextColor:[NSColor colorWithRed:39.f/255.f green:217.f/255.f blue:1.f alpha:1.f] font:[NSFont systemFontOfSize:40.f] title:@"垃圾的数据"];
    _trashDataTF.editable = NO;
    [_trashDataTF sizeToFit];
    
    [_intelligenceDescTF configNoBorderedClearBGWithTextColor:[NSColor colorWithWhite:0.8 alpha:0.7] font:[NSFont systemFontOfSize:14.f] title:@"智能选择" alignment:NSTextAlignmentRight];
    _intelligenceDescTF.editable = NO;
    
    _trashDataBottomLine.layer = CALayer.layer;
    _trashDataBottomLine.layer.backgroundColor = [NSColor colorWithRed:104.f/255.f green:118.f/255.f blue:123.f/255.f alpha:1.f].CGColor;
    
    [_includeTitleTF configNoBorderedClearBGWithTextColor:[NSColor colorWithWhite:0.9 alpha:1.f] font:[NSFont systemFontOfSize:13.f] title:@"包括" alignment:NSTextAlignmentLeft];
    [_includeContentTF configNoBorderedClearBGWithTextColor:[NSColor colorWithWhite:0.8 alpha:0.7] font:[NSFont systemFontOfSize:13.f] title:@"· Macintosh HD 上的废纸篓"];
}

- (void)initBottomStyle {
    _lookAtBtn.font  = [NSFont systemFontOfSize:13.f];
    _lookAtBtn.layer = CALayer.layer;
    _lookAtBtn.layer.backgroundColor = [NSColor colorWithRed:52.f/255.f green:62.f/255.f blue:75.f/255.f alpha:1.f].CGColor;
    _lookAtBtn.layer.cornerRadius = 10.f;
    _lookAtBtn.layer.masksToBounds  = YES;
    NSArray<NSView *> *subViews = _lookAtBtn.subviews;
    for (NSView *subView in subViews) {
        if ([subView isKindOfClass:NSClassFromString(@"NSButtonBezelView")]) {
            subView.layer = CALayer.layer;
            subView.layer.backgroundColor = [NSColor clearColor].CGColor;
        }
    }
    _lookAtBtn.attributedTitle = [[NSAttributedString alloc] initWithString:@"查看项目" attributes:@{NSForegroundColorAttributeName:[NSColor colorWithRed:122.f/255.f green:221.f/255.f blue:251.f/255.f alpha:1.f]}];
    
    _totalDataSizeTF.font = [NSFont systemFontOfSize:13.f];
    _totalDataSizeTF.textColor = [NSColor colorWithWhite:0.8 alpha:0.6];
    _totalDataSizeTF.backgroundColor = [NSColor clearColor];
    _totalDataSizeTF.bordered = NO;
    _totalDataSizeTF.editable = NO;
    [_totalDataSizeTF sizeToFit];
}

- (void)initIncludeStyle {
    _includeTitleTF.cell.title = @"包括";
    _includeTitleTF.textColor =[NSColor colorWithRed:170.f/255.f green:176.f/255.f blue:186.f/255.f alpha:1.f];
    _includeTitleTF.bordered = NO;
    _includeTitleTF.font = [NSFont boldSystemFontOfSize:13.f];
    _includeTitleTF.backgroundColor = [NSColor clearColor];
    _includeTitleTF.editable = NO;
    
    _includeContentTF.cell.title = @"· Macintosh HD 上的废纸篓";
    _includeContentTF.textColor = [NSColor colorWithRed:170.f/255.f green:176.f/255.f blue:186.f/255.f alpha:1.f];
    _includeContentTF.bordered = NO;
    _includeContentTF.font = [NSFont boldSystemFontOfSize:13.f];
    _includeContentTF.backgroundColor = [NSColor clearColor];
    _includeContentTF.editable = NO;
}

#pragma mark -- no data

- (void)initbNoDataUI {
    _noDataIconView = [NSImageView new];
    _noDataTitleTF = [NSTextField new];
    _noDataDescTF = [NSTextField new];
    [self cm_addSubviews:@[_noDataIconView,_noDataTitleTF, _noDataDescTF]];
    
    [self initNoDataConstraints];
    [self initNoDataStyle];
}

- (void)initNoDataConstraints {
    //     net
    [_noDataIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_centerY);
        make.left.equalTo(self.rightLogoImgView.mas_right).offset(10.f);
        make.width.height.mas_equalTo(25.f);
    }];
    
    [_noDataTitleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.noDataIconView);
        make.left.equalTo(self.noDataIconView.mas_right).offset(2.f);
    }];
    
    [_noDataDescTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.noDataTitleTF.mas_bottom).offset(6.f);
        make.left.equalTo(self.noDataIconView);
    }];
}

- (void)initNoDataStyle {
    _noDataIconView.image = [NSImage imageNamed:@"icon_trahs_end_empty"];
    _noDataTitleTF.font = [NSFont systemFontOfSize:23.f];
    _noDataTitleTF.textColor = [NSColor whiteColor];
    _noDataTitleTF.backgroundColor = [NSColor clearColor];
    _noDataTitleTF.bordered = NO;
    _noDataTitleTF.alignment = NSTextAlignmentLeft;
    _noDataTitleTF.cell.title = @"非常干净";
    _noDataTitleTF.editable = NO;
    [_noDataTitleTF sizeToFit];
    
    _noDataDescTF.font = [NSFont systemFontOfSize:13.f];
    _noDataDescTF.textColor = [NSColor colorWithWhite:0.8 alpha:1.f];
    _noDataDescTF.backgroundColor = [NSColor clearColor];
    _noDataDescTF.bordered = NO;
    _noDataDescTF.alignment = NSTextAlignmentLeft;
    _noDataDescTF.cell.title = @"任何废纸篓中都没有文件";
    _noDataDescTF.editable = NO;
    [_noDataDescTF sizeToFit];
}


- (void)configDataIsEmpty:(BOOL)isEmtpy {
    [self configNoDataUIHidden:!isEmtpy];
    [self configDataUIHidden:isEmtpy];
}

- (void)configDataUIHidden:(BOOL)isHidden {
    _titleTF.hidden = isHidden;
    _titleBottomLine.hidden = isHidden;
    _trashDataTF.hidden = isHidden;
    _intelligenceDescTF.hidden = isHidden;
    _trashDataBottomLine.hidden = isHidden;
    _includeTitleTF.hidden = isHidden;
    _includeContentTF.hidden = isHidden;
    _lookAtBtn.hidden = isHidden;
    _totalDataSizeTF.hidden = isHidden;
}

- (void)configNoDataUIHidden:(BOOL)isHidden {
    _noDataTitleTF.hidden = isHidden;
    _noDataDescTF.hidden = isHidden;
    _noDataIconView.hidden = isHidden;
}

- (void)onLookAtMoreAction:(id)sender {
    NSLog(@"look at more project");
    !_seeMoreInfoBlock? :_seeMoreInfoBlock();
}

- (void)onTrachBackAction:(NSButton *)sender {
    
#warning -- fix the warning alert ui 
    
    [NSAlert showAtWindow:[self window] title:@"您是否要重置当前扫描结果并重新开始？" desc:@"当前扫描结果不会存储，您需要再运行一次扫描查找项目。" cancelText:@"取消" okText:@"重新开始" cancelThen:^{
        NSLog(@"lt - 保持在这个页面");
    } okThen:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"back.notification" object:nil];
    }];
}

@end
