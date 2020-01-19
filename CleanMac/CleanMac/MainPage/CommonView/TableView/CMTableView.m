//
//  CMTableView.m
//  CleanMac
//
//  Created by Aka on 2020/1/18.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMTableView.h"

@interface CMTableView ()

@property (nonatomic, strong) NSTableView *tableView;

@end

@implementation CMTableView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)baseInit {
    
    self.borderType = NSNoBorder;
    self.wantsLayer = YES;
    self.hasVerticalRuler = YES;
    self.drawsBackground = NO;
    

    
    _tableView = [NSTableView new];
    _tableView.layer.backgroundColor = k_CG_Clear;
    _tableView.backgroundColor = kClear;
    _tableView.layer.borderColor = k_CG_Clear;
    _tableView.layer.borderWidth = CGFLOAT_MIN;
    _tableView.headerView = [[NSTableHeaderView alloc] initWithFrame:NSMakeRect(0.f, 0.f, CGFLOAT_MIN, CGFLOAT_MIN)];
    if (@available(macOS 10.12, *)) {
          _tableView.enclosingScrollView.borderType = NSTabViewBorderTypeNone;
      } else {
          //FIXME: 需要进一步去处理
      }
    self.contentView.documentView = _tableView;
}

@end
