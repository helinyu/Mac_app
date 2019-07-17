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
#import "CMFileManger.h"

@interface CMMainPageViewController ()<NSTableViewDataSource, NSTableViewDelegate>

@property (weak) IBOutlet NSTableView *classTableView;
@property (nonatomic, strong) NSArray<NSString *> *datasources;

@end

@implementation CMMainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self viewInit];
}

- (void)viewInit {
    self.view.window.backgroundColor = [NSColor cyanColor];
    
    NSArray<NSString *> *classInfo = [CMFileManger getMainClassInfo];
    self.datasources = classInfo;
    [self.classTableView reloadData];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.datasources.count;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    CMMainPageClassTCellView *cellView = [tableView makeViewWithIdentifier:NSStringFromClass([CMMainPageClassTCellView class]) owner:self];
    return cellView;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    CMMainPageClassTCellView *cellView = [tableView makeViewWithIdentifier:NSStringFromClass([CMMainPageClassTCellView class]) owner:self];
    return cellView;
}

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 30;
}

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    return YES;
}

-(void)tableViewSelectionDidChange:(nonnull NSNotification *)notification{
    NSLog(@"didSelect：%@",notification.object);
}

@end
