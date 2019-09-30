//
//  CMPreScanView.m
//  CleanMac
//
//  Created by Aka on 2019/9/27.
//  Copyright © 2019 Aka. All rights reserved.
//

#import "CMPreScanView.h"
#import <AppKit/AppKit.h>
#import <Cocoa/Cocoa.h>
#import "CMPreScanLeftTitleView.h"
#import "CMPreScanLeftCellView.h"
#import "CMPreScanTitleModel.h"
#import "CMPreScanContentModel.h"

@interface CMPreScanView ()<NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, strong) CMPreScanLeftTitleView *titleView;
@property (nonatomic, strong) NSTableView *tableView;
@property (nonatomic, strong) NSImageView *iconView;
@property (nonatomic, strong) NSButton *scanBtn;

@property (nonatomic, strong) NSArray<CMPreScanContentModel *> *datasources;

@end

@implementation CMPreScanView

- (void)baseInit {
    [super baseInit];
    
    _titleView = [CMPreScanLeftTitleView new];
    _tableView = [NSTableView new];
    _iconView = [NSImageView new];
    _scanBtn = [NSButton cm_buttonWithTitle:@"扫描" target:self action:@selector(onScanAction:)];
    [self cm_addSubviews:@[_titleView, _tableView, _iconView, _scanBtn]];
    
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20.f);
        make.bottom.equalTo(self.tableView.mas_top);
        make.height.mas_equalTo(50.f);
        make.right.equalTo(self).offset(-150.f);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(50.f);
        make.left.equalTo(self).offset(20.f);
        make.height.mas_equalTo(300.f);
        make.width.mas_equalTo(250.f);
    }];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(100.f);
        make.right.equalTo(self).offset(-20.f);
    }];
    
    [_scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.centerX.equalTo(self);
        make.width.height.mas_equalTo(100.f);
    }];
}

- (void)onScanAction:(NSButton *)sender {
    NSLog(@"lt- scan");
}

- (void)configData:(NSArray<CMPreScanContentModel *> *)datasources update:(BOOL)isUpdate {
    _datasources = datasources;
    
    if (isUpdate) {
        [self.tableView reloadData];
    }
}

#pragma mark -- datasource & delegate

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.datasources.count;
}

- (NSInteger)rowForView:(NSView *)view API_AVAILABLE(macos(10.7)) {
    return 1;
}
- (NSInteger)columnForView:(NSView *)view API_AVAILABLE(macos(10.7)) {
    return 1;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    CMPreScanLeftCellView *cellView = [tableView makeViewWithIdentifier:NSStringFromClass([CMPreScanLeftCellView class]) owner:self];
    return cellView;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    CMPreScanLeftCellView *cellView = [tableView makeViewWithIdentifier:NSStringFromClass([CMPreScanLeftCellView class]) owner:self];
//     config data
    [cellView configIconName:@"" title:@"名字" desc:@"描述"];
    return cellView;
}

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 100.f;
}

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
//    [self updateCurRowAndView:row];
    return YES;
}

-(void)tableViewSelectionDidChange:(nonnull NSNotification *)notification{
    
}


/* View Based TableView:
 Non-bindings: This method is required if you wish to turn on the use of NSViews instead of NSCells. The implementation of this method will usually call -[tableView makeViewWithIdentifier:[tableColumn identifier] owner:self] in order to reuse a previous view, or automatically unarchive an associated prototype view for that identifier. The -frame of the returned view is not important, and it will be automatically set by the table. 'tableColumn' will be nil if the row is a group row. Returning nil is acceptable, and a view will not be shown at that location. The view's properties should be properly set up before returning the result.
 
 Bindings: This method is optional if at least one identifier has been associated with the TableView at design time. If this method is not implemented, the table will automatically call -[self makeViewWithIdentifier:[tableColumn identifier] owner:[tableView delegate]] to attempt to reuse a previous view, or automatically unarchive an associated prototype view. If the method is implemented, the developer can setup properties that aren't using bindings.
 
 The autoresizingMask of the returned view will automatically be set to NSViewHeightSizable to resize properly on row height changes.
 */
- (nullable NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row API_AVAILABLE(macos(10.7)) {
    
}

/* View Based TableView: The delegate can optionally implement this method to return a custom NSTableRowView for a particular 'row'. The reuse queue can be used in the same way as documented in tableView:viewForTableColumn:row:. The returned view will have attributes properly set to it before it is added to the tableView. Returning nil is acceptable. If nil is returned, or this method isn't implemented, a regular NSTableRowView will be created and used.
 */
- (nullable NSTableRowView *)tableView:(NSTableView *)tableView rowViewForRow:(NSInteger)row API_AVAILABLE(macos(10.7)) {
    
}

/* View Based TableView: Optional: This delegate method can be used to know when a new 'rowView' has been added to the table. At this point, you can choose to add in extra views, or modify any properties on 'rowView'.
 */
- (void)tableView:(NSTableView *)tableView didAddRowView:(NSTableRowView *)rowView forRow:(NSInteger)row API_AVAILABLE(macos(10.7)) {
    
}

/* View Based TableView: Optional: This delegate method can be used to know when 'rowView' has been removed from the table. The removed 'rowView' may be reused by the table so any additionally inserted views should be removed at this point. A 'row' parameter is included. 'row' will be '-1' for rows that are being deleted from the table and no longer have a valid row, otherwise it will be the valid row that is being removed due to it being moved off screen.
 */
- (void)tableView:(NSTableView *)tableView didRemoveRowView:(NSTableRowView *)rowView forRow:(NSInteger)row API_AVAILABLE(macos(10.7)) {
    
}


@end
