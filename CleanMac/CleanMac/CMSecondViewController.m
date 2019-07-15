//
//  CMSecondViewController.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/15 14:32 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import <Masonry.h>
#import "CMSecondViewController.h"

@interface CMSecondViewController ()<NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, strong) NSTableView *classTableView;

@end

@implementation CMSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = CALayer.layer;
    layer.frame = CGRectMake(0.f, 0.f, self.view.bounds.size.width, self.view.bounds.size.height - 30);
    self.view.layer = layer;
    layer.backgroundColor = [NSColor yellowColor].CGColor;
    [self.view setNeedsDisplay:YES];

    [self viewInit];
    [self bindInit];
}

- (void)viewInit {
    _classTableView = [[NSTableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_classTableView];
    CALayer *tableLayer = [CALayer layer];
    tableLayer.frame = _classTableView.bounds;
    _classTableView.layer = tableLayer;
    tableLayer.backgroundColor = [NSColor grayColor].CGColor;
    [_classTableView setNeedsDisplay:YES];
}

- (void)bindInit {
    _classTableView.dataSource= self;
    _classTableView.delegate = self;
}

#pragma mark -- datasource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 10;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    return nil;
}


#pragma mark -- delegate
- (void)tableView:(NSTableView *)tableView didAddRowView:(NSTableRowView *)rowView forRow:(NSInteger)row API_AVAILABLE(macos(10.7)) {
    NSLog(@"did add row view ");
}

@end
