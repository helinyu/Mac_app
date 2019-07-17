//
//  NSView+CMAdd.h
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 17:35 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import <AppKit/AppKit.h>


#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSView (CMAdd)

- (void)cm_addSubviews:(NSArray<NSView *> *)views;

@end

NS_ASSUME_NONNULL_END
