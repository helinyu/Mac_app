//
//  CMTrashInfoDetailLeftView.m
//  CleanMac
//
//  Created by Aka on 2020/1/17.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMTrashInfoDetailLeftView.h"
#import "CMTrashInfoDetailCellView.h"
#import "CMMainPageClassTCellView.h"
#import "CMTrashInfoDetailRowView.h"
#import "CMTrashInfoDetailRowView.h"

#import "NSButton+CMAdd.h"

#import "CMFileInfoModel.h"

@interface CMTrashInfoDetailLeftView ()<NSTableViewDataSource, NSTableViewDelegate, CMViewProtocol>

@property (nonatomic, strong) NSButton *allToggleBtn;
@property (nonatomic, assign) BOOL isAllSelected;

@property (nonatomic, strong) NSButton *rangeBtn;

@property (nonatomic, strong) NSTableView *tableView;

@property (nonatomic, strong) NSMutableArray<CMFileInfoModel *> *datasources;

@end

kConstString(kAllSelected, @"全选");
kConstString(kAllCancel, @"取消全选");

@implementation CMTrashInfoDetailLeftView

- (void)baseInit {
    [super baseInit];
    
    _datasources = [NSMutableArray new];
    
    _allToggleBtn = [NSButton cm_buttonWithTitle:@"取消选择" target:self action:@selector(onAllToggleAciton:)];
    [self addSubview:_allToggleBtn];
    
    [_allToggleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20.f);
        make.left.equalTo(self).offset(5.f);
        make.top.equalTo(self).offset(8.f);
    }];
    _allToggleBtn.layer.cornerRadius = 4.f;
    _allToggleBtn.layer.masksToBounds = YES;
    [self setAllToggleSelected:_isAllSelected];
    [_allToggleBtn cleanBezelView];

    
    NSButton *rangeBtn = [NSButton cm_buttonWithTitle:@"排序" image:[NSImage imageNamed:@"icon_triangle_white_down_10"] target:self action:@selector(onRangeAction:)];
    [self addSubview:rangeBtn];
    [rangeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10.f);
        make.right.equalTo(self).offset(20.f);
        make.width.mas_equalTo(100.f);
    }];
    self.rangeBtn = rangeBtn;
//     有必要封装一下这个button的样式
    
//     tableView
    NSScrollView *scrollView = [NSScrollView new];
    scrollView.borderType = NSNoBorder;
    scrollView.wantsLayer = YES;
    scrollView.layer.backgroundColor = [NSColor blueColor].CGColor;
    scrollView.backgroundColor = [NSColor orangeColor];
    scrollView.hasVerticalRuler = YES;
    scrollView.alphaValue = 1.f;
    scrollView.drawsBackground = NO;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(self).offset(44.f);
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
//    scrollView.contentView.backgroundColor = [NSColor clearColor];
    
    W_S;
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.tableView.superview);
    }];
    [_tableView reloadData];
    
//     有关的内容处理
  
}

- (void)onMenuAction:(NSMenuItem *)menuItem {
    NSLog(@"lt - did selected ");
}

- (void)setFiles:(NSArray *)files {
    _files = files;
    
    [self.datasources removeAllObjects];
    [self.datasources addObjectsFromArray:files];
    
    [self updateTotalSelectBtnStyle];
    
    [self.tableView reloadData];
}

-  (BOOL)getFlagOfAllSelected:(NSArray *)files {
    BOOL isAllSelected = YES;
    for (CMFileInfoModel *item in files) {
        if (!item.isSelected) {
            isAllSelected = NO;
            break;
        }
    }
    return isAllSelected;
}

#pragma mark -- tableView dataosurce & delegate

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.datasources.count;
}

//- (NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row {
//    CMTrashInfoDetailRowView *rowView = [tableView makeViewWithIdentifier:NSStringFromClass([CMTrashInfoDetailRowView class]) owner:self];
//    if (rowView == nil) {
//        rowView = [CMTrashInfoDetailRowView new];
//    }
//    return rowView;
//}

#warning  -- 第一个row的cell为什么增加了两个
-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    tableColumn.width = self.bounds.size.width;
    CMTrashInfoDetailCellView *cellView = [tableView makeViewWithIdentifier:NSStringFromClass([CMTrashInfoDetailCellView class]) owner:self];
    if (cellView == nil) {
        cellView = [[CMTrashInfoDetailCellView alloc] initWithFrame:NSMakeRect(0.f, 0.f, tableColumn.width, 80.f)];
        cellView.identifier = NSStringFromClass([CMTrashInfoDetailCellView class]);
    }
    CMFileInfoModel *fileItem = [self.datasources objectAtIndex:row];
    [cellView configName:fileItem.path weight:fileItem.weight selectState:fileItem.isSelected];
    cellView.delegate = self;
    return cellView;
}

#warning -- 如何设置左边的列表的大小以及各种距离

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 80;
}

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    //    [self updateCurRowAndView:row];
    NSLog(@"lt - shouldSelectRow: %ld",(long)row);
    return YES;
}

-(void)tableViewSelectionDidChange:(nonnull NSNotification *)notification{
    NSLog(@"didSelect：%@",notification.object);
}

- (void)setAllToggleSelected:(BOOL)selected {
    if (selected) {
        _allToggleBtn.title = kAllCancel;
    }
    else {
        _allToggleBtn.title = kAllSelected;
    }
}

- (void)onAllToggleAciton:(NSButton *)sender {
    
}

// 为什么这样就可以呢？
- (void)onRangeAction:(NSButton *)sender {
    NSMenu *menu = [NSMenu new];
    NSMenuItem *firstItem = [[NSMenuItem alloc] initWithTitle:@"名称" action:@selector(onMenuItemClicked:) keyEquivalent:@""];
    [menu addItem:firstItem];
    NSMenuItem *secondItem = [[NSMenuItem alloc] initWithTitle:@"排序" action:@selector(onMenuItemClicked:) keyEquivalent:@""];
    [menu addItem:secondItem];
    NSMenuItem *separateItem = [NSMenuItem separatorItem];
    [menu addItem:separateItem];
    NSMenuItem *thirdItem = [[NSMenuItem alloc] initWithTitle:@"正序" action:@selector(onMenuItemClicked:) keyEquivalent:@""];
    [menu addItem:thirdItem];
    NSMenuItem *fourItem = [[NSMenuItem alloc] initWithTitle:@"降序" action:@selector(onMenuItemClicked:) keyEquivalent:@""];
    [menu addItem:fourItem];
    CGPoint point = self.rangeBtn.frame.origin;
    point.x = point.x + (self.rangeBtn.frame.size.width- menu.size.width)/2.f;
    [menu popUpMenuPositioningItem:nil atLocation:point inView:self];
}

- (void)onMenuItemClicked:(NSMenuItem *)item {
    NSLog(@"lt - menu item :%@",item);
}

#pragma mark - pop menu delegate

- (void)popMenu:(id)popMenu didSelectedIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"lt - didsele :%@",indexPath);
}


#pragma mark - view protocol

- (void)view:(id)view onActionType:(CMViewActionType)actionType {
    if (actionType == CMViewActionTypeSelect) {
        NSInteger row = [self.tableView rowForView:view];
        CMFileInfoModel *fileInfo = [self.datasources objectAtIndex:row];
        fileInfo.isSelected = !fileInfo.isSelected;
//        [self.tableView reloadDataForRowIndexes:[NSIndexSet indexSetWithIndex:row] columnIndexes:[NSIndexSet indexSetWithIndex:0]];
        
        [self.tableView reloadData];
        [self updateTotalSelectBtnStyle];
    }
    else {
        
    }
}

#pragma mark - update all btn control

- (void)updateTotalSelectBtnStyle {
    self.isAllSelected = [self getFlagOfAllSelected:self.files];
    [self setAllToggleSelected:self.isAllSelected];
}

@end
