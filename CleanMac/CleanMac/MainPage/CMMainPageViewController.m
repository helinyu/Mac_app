//
//  CMMainPageViewController.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/16 20:29 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMMainPageViewController.h"
#import <Masonry.h>
#import "CMMainPageClassTCellView.h"

@interface CMMainPageViewController ()<NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, strong) NSTableView *tableView;

@end

@implementation CMMainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    [self viewInit];
}

- (void)viewInit {
    self.view.window.backgroundColor = [NSColor cyanColor];
    
    _tableView = [[NSTableView alloc] initWithFrame:NSMakeRect(0.f, 0.f, 150.f, self.view.bounds.size.height)];
    NSTableColumn *column = [[NSTableColumn alloc] initWithIdentifier:@"columnFrist"];
    column.title = @"分类";
    [column setWidth:100];
    [self.tableView addTableColumn:column];
    
    self.tableView.focusRingType = NSFocusRingTypeNone;
    self.tableView.selectionHighlightStyle = NSTableViewSelectionHighlightStyleRegular;
    self.tableView.backgroundColor = [NSColor orangeColor];
    self.tableView.usesAlternatingRowBackgroundColors = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.gridColor = [NSColor magentaColor];

    NSScrollView *tableContainerView = [[NSScrollView alloc] initWithFrame:CGRectMake(0, 0, 150, self.view.bounds.size.height)];
    tableContainerView.backgroundColor = [NSColor redColor];
    [tableContainerView setDocumentView:self.tableView];
    [tableContainerView setDrawsBackground:NO];//不画背景（背景默认画成白色）
    [tableContainerView setHasVerticalScroller:YES];//有垂直滚动条
    tableContainerView.autohidesScrollers = YES;//自动隐藏滚动条（滚动的时候出现）
    [self.view addSubview:tableContainerView];
    
    [self.view setNeedsDisplay:YES];
    [self.view layoutSubtreeIfNeeded];
    
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 100;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *strIdt = @"123";
    CMMainPageClassTCellView *cell = [tableView makeViewWithIdentifier:strIdt owner:self];
    if (!cell) {
        cell = [[CMMainPageClassTCellView alloc]init];
        cell.identifier = strIdt;
    }
    
    cell.wantsLayer = YES;
    cell.layer.backgroundColor = [NSColor yellowColor].CGColor;
    //    cell.textField.stringValue = [NSString stringWithFormat:@"cell %ld",(long)row];
    [cell setNeedsDisplay:YES];
    return cell;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    NSString *strIdt = @"123";
    CMMainPageClassTCellView *cell = [tableView makeViewWithIdentifier:strIdt owner:self];
    if (!cell) {
        cell = [[CMMainPageClassTCellView alloc]init];
        cell.identifier = strIdt;
    }
    
    cell.wantsLayer = YES;
    cell.layer.backgroundColor = [NSColor yellowColor].CGColor;
    //    cell.textField.stringValue = [NSString stringWithFormat:@"cell %ld",(long)row];
    [cell setNeedsDisplay:YES];
    return cell;
}

#pragma mark - 行高
-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row{
    return 44;
}

#pragma mark - 是否可以选中单元格
-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row{
    NSTableRowView *myRowView = [self.tableView rowViewAtRow:row makeIfNecessary:NO];
    [myRowView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleRegular];
    [myRowView setEmphasized:NO];
    
    NSLog(@"shouldSelect : %ld",(long)row);
    return YES;
}

-(void)tableViewSelectionDidChange:(nonnull NSNotification *)notification{
    NSTableView* tableView = notification.object;
    NSLog(@"didSelect：%@",notification.userInfo);
}

@end
