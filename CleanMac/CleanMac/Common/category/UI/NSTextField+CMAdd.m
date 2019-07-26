//
//  NSTextField+CMAdd.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/26 17:09 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "NSTextField+CMAdd.h"

#import <AppKit/AppKit.h>


@implementation NSTextField (CMAdd)

- (void)configNoBorderedClearBGWithTextColor:(NSColor *)textColor font:(NSFont *)font title:(NSString *)title {
    [self configWithTextColor:textColor font:font bordered:NO bgColor:[NSColor clearColor] title:title alignment:NSTextAlignmentLeft];
}

- (void)configNoBorderedClearBGWithTextColor:(NSColor *)textColor font:(NSFont *)font title:(NSString *)title alignment:(NSTextAlignment)alignment {
    [self configWithTextColor:textColor font:font bordered:NO bgColor:[NSColor clearColor] title:title alignment:alignment];
}

- (void)configNoBorderedWithTextColor:(NSColor *)textColor font:(NSFont *)font bgColor:(NSColor *)bgColor title:(NSString *)title alignment:(NSTextAlignment)alignment {
    [self configWithTextColor:textColor font:font bordered:NO bgColor:bgColor title:title alignment:alignment];
}

- (void)configWithTextColor:(NSColor *)textColor font:(NSFont *)font bordered:(BOOL)bordered bgColor:(NSColor *)bgColor title:(NSString *)title alignment:(NSTextAlignment)alignment {
    [self setTextColor:textColor];
    [self setFont:font];
    self.bordered = bordered;
    self.backgroundColor = bgColor;
    self.cell.title = title;
    self.alignment = alignment;
}

@end
