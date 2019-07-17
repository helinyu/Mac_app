//
//  NSView+CMAdd.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 17:35 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "NSView+CMAdd.h"

#import <AppKit/AppKit.h>


@implementation NSView (CMAdd)

- (void)cm_addSubviews:(NSArray<NSView *> *)views {
    if (views.count <=0) {
        return;
    }
    for (NSView *view  in views) {
        if ([view isKindOfClass:[NSView class]]) {
            [self addSubview:view];
        }
    }
}

@end
