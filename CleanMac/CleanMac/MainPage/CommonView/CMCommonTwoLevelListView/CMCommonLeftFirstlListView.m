//
//  CMCommonLeftFirstlListView.m
//  CleanMac
//
//  Created by Aka on 2020/1/18.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMCommonLeftFirstlListView.h"
#import "CMCommonHeader.h"

kConstCGFloat(kHeaderH, 44.f);

@interface CMCommonLeftFirstlListView ()

@property (nonatomic, strong) NSButton *rangebtn;// need to change
@property (nonatomic, strong) CMTableView *listView; // 下面的列表

@end

@implementation CMCommonLeftFirstlListView

- (void)baseInit {
    [super baseInit];
    
    _rangebtn = [NSButton cm_buttonWithTitle:@"排序" target:self action:@selector(onRangeAction:)];
    _listView = [CMTableView new];
    [self cm_addSubviews:@[_rangebtn, _listView]];
    
}

- (void)onRangeAction:(NSButton *)btn {
    NSLog(@"lt - range :%@",btn);
}

@end
