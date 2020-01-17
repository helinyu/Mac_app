//
//  CMTrashInfoDetailRightView.m
//  CleanMac
//
//  Created by Aka on 2020/1/17.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMTrashInfoDetailRightView.h"
#import "CMTrashInfoDetailCellView.h"

@interface CMTrashInfoDetailRightView ()<NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, strong) NSTableView *tableView;
@property (nonatomic, strong) NSArray *datasources;

@property (nonatomic, strong) NSTextField *titleTF;
@property (nonatomic, strong) NSTextField *descTF;

@property (nonatomic, strong) NSButton *rangeBtn;

@end

@implementation CMTrashInfoDetailRightView

- (void)baseInit {
    [super baseInit];
    
    _titleTF = [NSTextField new];
    _descTF = [NSTextField new];
    [self cm_addSubviews:@[_titleTF, _descTF]];
    [_titleTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
    }];
    _titleTF.font = [NSFont boldSystemFontOfSize:40.f];
    _titleTF.textColor = [NSColor whiteColor];
    _titleTF.cell.title = @"Macintosh HD 上的废纸篓";
    _titleTF.bordered = NO;
    _titleTF.editable = NO;
    _titleTF.backgroundColor = [NSColor clearColor];
    [_titleTF sizeToFit];
    
    [_descTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self.titleTF.mas_bottom).offset(2.f);
    }];
    _descTF.font = [NSFont systemFontOfSize:14.f];
    _descTF.textColor = [NSColor whiteColor];
    _descTF.cell.title = @"系统废纸篓文件夹存储先前删除的项目，但是它们仍然占用磁盘空间";
    _descTF.backgroundColor = [NSColor clearColor];
    _descTF.bordered = NO;
    _descTF.editable = NO;
    [_descTF sizeToFit];
    
    _rangeBtn = [NSButton cm_buttonWithTitle:@"排序按钮" target:self action:@selector(onRangeAction:)];
    [self addSubview:_rangeBtn];
    [_rangeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(30.f);
    }];
    [_rangeBtn cleanBezelView];
    [_rangeBtn sizeToFit];
    
    _tableView = [[NSTableView alloc] init];
    [self addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.top.equalTo(self).offset(110.f);
    }];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.layer.backgroundColor = [NSColor clearColor].CGColor;
    _tableView.backgroundColor = [NSColor redColor];
    _tableView.layer.borderColor = [NSColor clearColor].CGColor;
    _tableView.layer.borderWidth = CGFLOAT_MIN;
    if (@available(macOS 10.12, *)) {
        _tableView.enclosingScrollView.borderType = NSTabViewBorderTypeNone;
    } else {
        // Fallback on earlier versions
    }
}

- (void)onRangeAction:(NSButton *)sender {
    
}

#pragma mark - tableView datasource & delegate

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.datasources.count;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    CMTrashInfoDetailCellView *cellView = [tableView makeViewWithIdentifier:NSStringFromClass([CMTrashInfoDetailCellView class]) owner:self];
    return cellView;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    CMTrashInfoDetailCellView *cellView = [tableView makeViewWithIdentifier:NSStringFromClass([CMTrashInfoDetailCellView class]) owner:self];
    //    cellView.titleTF.cell.title = self.datasources[row];
    return cellView;
}

#warning -- 如何设置左边的列表的大小以及各种距离

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 80;
}

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    //    [self updateCurRowAndView:row];
    return YES;
}

-(void)tableViewSelectionDidChange:(nonnull NSNotification *)notification{
    NSLog(@"didSelect：%@",notification.object);
}

- (void)setFiles:(NSArray *)files {
    _files = files;
    
//    [self.datasources addObjectsFromArray:files];
    
    [self.tableView reloadData];
}


@end
