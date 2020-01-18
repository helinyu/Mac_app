//
//  CMTrashInfoDetailRightView.m
//  CleanMac
//
//  Created by Aka on 2020/1/17.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMTrashInfoDetailRightView.h"
#import "CMTrashInfoDetailCellView.h"
#import "CMFileInfoModel.h"

@interface CMTrashInfoDetailRightView ()<NSTableViewDataSource, NSTableViewDelegate, CMViewProtocol>

@property (nonatomic, strong) NSTableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasources;

@property (nonatomic, strong) NSTextField *titleTF;
@property (nonatomic, strong) NSTextField *descTF;

@property (nonatomic, strong) NSButton *rangeBtn;

@end

kConstCGFloat(kTableViewTopMargin, 100.f);

@implementation CMTrashInfoDetailRightView

- (void)baseInit {
    [super baseInit];
    
    _datasources = [NSMutableArray new];
    
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
    
    
    //     tableView
    NSScrollView *scrollView = [NSScrollView new];
    scrollView.hasVerticalRuler = YES;
    [self addSubview:scrollView];
    scrollView.drawsBackground = NO;
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self).offset(kTableViewTopMargin);
    }];
    
    _tableView = [[NSTableView alloc] init];
    NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"colum.left.view"];
    column.resizingMask =NSTableColumnUserResizingMask;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView addTableColumn:column];
    _tableView.layer.backgroundColor = [NSColor clearColor].CGColor;
    _tableView.backgroundColor = [NSColor clearColor];
    _tableView.layer.borderColor = [NSColor clearColor].CGColor;
    _tableView.layer.borderWidth = CGFLOAT_MIN;
    _tableView.headerView = [[NSTableHeaderView alloc] initWithFrame:NSMakeRect(0.f, 0.f, CGFLOAT_MIN, CGFLOAT_MIN)];
    if (@available(macOS 10.12, *)) {
        _tableView.enclosingScrollView.borderType = NSTabViewBorderTypeNone;
    } else {
        // Fallback on earlier versions
    }
    scrollView.contentView.documentView = _tableView;
    W_S;
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.tableView.superview);
    }];
    [_tableView reloadData];
}

- (void)onRangeAction:(NSButton *)sender {
    
}

#pragma mark - tableView datasource & delegate

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.datasources.count;
}

#warning  -- 第一个row的cell为什么增加了两个
-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    tableColumn.width = self.bounds.size.width;
    CMTrashInfoDetailCellView *cellView = [tableView makeViewWithIdentifier:NSStringFromClass([CMTrashInfoDetailCellView class]) owner:self];
    if (cellView == nil) {
        cellView = [[CMTrashInfoDetailCellView alloc] initWithFrame:NSMakeRect(0.f, 0.f, tableColumn.width, 80.f)];
        cellView.identifier = NSStringFromClass([CMTrashInfoDetailCellView class]);
    }
    CMFileInfoModel *fileItem = [self.datasources objectAtIndex:row];
    NSImage *icon = [[NSWorkspace sharedWorkspace] iconForFile:fileItem.path];
    NSString *fileName = [fileItem.path stringByReplacingOccurrencesOfString:fileItem.prePath withString:@""];
    [cellView configIconImg:icon fileName:fileName weight:fileItem.weight selectState:fileItem.isSelected];
    cellView.delegate = self;
    return cellView;
}

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 60;
}

- (BOOL)tableView:(NSTableView *)tableView shouldShowCellExpansionForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
    return YES;
}
//设置是否可以进行编辑
- (BOOL)tableView:(NSTableView *)tableView shouldEditTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row{
    return YES;
}

//设置鼠标悬停在cell上显示的提示文本
- (NSString *)tableView:(NSTableView *)tableView toolTipForCell:(NSCell *)cell rect:(NSRectPointer)rect tableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row mouseLocation:(NSPoint)mouseLocation{
    return @"tip";
}

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    //    [self updateCurRowAndView:row];
    NSLog(@"lt - shouldSelectRow: %ld",(long)row);
    return YES;
}

-(void)tableViewSelectionDidChange:(nonnull NSNotification *)notification{
    NSLog(@"didSelect：%@",notification.object);
}

- (void)setFiles:(NSArray *)files {
    _files = files;
    
    [self.datasources removeAllObjects];
    [self.datasources addObjectsFromArray:files];
    
    [self.tableView reloadData];
}

@end
