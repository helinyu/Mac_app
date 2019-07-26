//
//  NSTextField+CMAdd.h
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/26 17:09 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import <AppKit/AppKit.h>


#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTextField (CMAdd)

- (void)configNoBorderedClearBGWithTextColor:(NSColor *)textColor font:(NSFont *)font title:(NSString *)title;
- (void)configNoBorderedClearBGWithTextColor:(NSColor *)textColor font:(NSFont *)font title:(NSString *)title alignment:(NSTextAlignment)alignment;
- (void)configNoBorderedWithTextColor:(NSColor *)textColor font:(NSFont *)font bgColor:(NSColor *)bgColor title:(NSString *)title alignment:(NSTextAlignment)alignment;
- (void)configWithTextColor:(NSColor *)textColor font:(NSFont *)font bordered:(BOOL)bordered bgColor:(NSColor *)bgColor title:(NSString *)title alignment:(NSTextAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
