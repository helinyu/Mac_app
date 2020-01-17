//
//  CMFourthViewController.m
//  CleanMac
//
//  Created by Aka on 2020/1/18.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMFourthViewController.h"

@interface MyCell : NSTextFieldCell


@property (nonatomic, strong) NSTextField *titleTF;

@end


@implementation MyCell


@end

@interface CMFourthViewController ()<NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, strong) NSTableView *tableView;
@property (nonatomic, strong) NSMutableArray *datasources;

@end


@implementation CMFourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor redColor].CGColor;
    
    
    _datasources = [NSMutableArray new];
    for (int i=0; i < 30; i++) {
        [_datasources addObject:[NSString stringWithFormat:@"%d行数据",i]];
    }
    
    NSScrollView *scrollView = [NSScrollView new];
    scrollView.hasVerticalScroller = YES; // 表示可以垂直滑动吧
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    
    _tableView = [[NSTableView alloc] initWithFrame:self.view.bounds];
    NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"test1"];
    NSTableColumn *column2 = [[NSTableColumn alloc] initWithIdentifier:@"test2"];
    column2.width = 100.f;
    column2.minWidth = 100.f;
    column2.title  = @"数据";
    column2.editable = YES;
    column2.headerToolTip = @"提示";
    column2.hidden = NO;
    column2.sortDescriptorPrototype = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:NO];
    
    column.resizingMask = NSTableColumnUserResizingMask;
    [_tableView addTableColumn:column];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView reloadData];
    scrollView.contentView.documentView = _tableView;
    
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return _datasources.count;
}

// 设置某个元素的具体视图
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    NSTextField *view = [tableView makeViewWithIdentifier:@"cellId" owner:self];
    if (!view) {
        view = [[NSTextField alloc] initWithFrame:CGRectMake(0.f, 0.f, 100.f, 30.f)];
        view.backgroundColor = [NSColor clearColor];
        view.identifier = @"cellId";
    }
    return view;
}

// 设置每行容易视图
- (NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row {
    NSTableRowView *rowView = [NSTableRowView new];
    return rowView;
}

// 当添加行时调用的回调
- (void)tableView:(NSTableView *)tableView didAddRowView:(NSTableRowView *)rowView forRow:(NSInteger)row {
    NSLog(@"lt - add ");
}

// 当移除行的时候调用
- (void)tableView:(NSTableView *)tableView didRemoveRowView:(NSTableRowView *)rowView forRow:(NSInteger)row {
    NSLog(@"lt - remvoe ");
}

//// 这个方法是返回需要填充和你的数据
//- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
//    return [_datasources objectAtIndex:row];
//}
//
//- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
//    NSLog(@"lt - setobject :%@",object);
//    _datasources[row] = object;
//}
//
//- (void)tableView:(NSTableView *)tableView willDisplayCell:(id)cell forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
//    NSTextFieldCell *_cell = cell;
//    _cell.textColor = [NSColor cyanColor];
//}
//
//- (BOOL)tableView:(NSTableView *)tableView shouldEditTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
//    return YES;
//}
//
//- (NSString *)tableView:(NSTableView *)tableView toolTipForCell:(NSCell *)cell rect:(NSRectPointer)rect tableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row mouseLocation:(NSPoint)mouseLocation {
//    return @"tip";
//}
//
//- (BOOL)tableView:(NSTableView *)tableView shouldShowCellExpansionForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
//    return YES;
//}
//
//
////设置cell交互能力
//
//- (BOOL)tableView:(NSTableView *)tableView shouldTrackCell:(NSCell *)cell forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
//    return YES;
//}
//
//- (NSCell *)tableView:(NSTableView *)tableView dataCellForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
//    if (tableColumn != nil) {
//        MyCell *cell = [MyCell new];
//        return cell;
//    }
//    return nil;
//}
//
//- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
//    return 30.f;
//}
//
//- (void)tableView:(NSTableView *)tableView sortDescriptorsDidChange:(NSArray<NSSortDescriptor *> *)oldDescriptors {
//    NSLog(@"lt - %@, ", oldDescriptors[0]);
//}


@end
