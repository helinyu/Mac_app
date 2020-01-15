//
//  NSButton+CMAdd.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 17:10 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "NSButton+CMAdd.h"

#import <AppKit/AppKit.h>


@implementation NSButton (CMAdd)

+ (NSButton *)cm_buttonWithTitle:(NSString *)title imgName:(NSString *)imgName target:(nullable id)target action:(nullable SEL)sel {
   return [self cm_buttonWithTitle:title image:[NSImage imageNamed:imgName] target:target action:sel];
}

+ (NSButton *)cm_buttonWithTitle:(NSString *)title image:(NSImage *)image target:(nullable id)target action:(nullable SEL)action {
    if (@available(macOS 10.12, *)) {
        NSButton *btn = [NSButton buttonWithTitle:title image:image target:target action:action];
        return btn;
    } else {
        NSButton *btn = [NSButton new];
        btn.title = title;
        btn.image = image;
        btn.target = target;
        btn.action = action;
        return btn;
    }
}

+ (NSButton *)cm_buttonWithTitle:(NSString *)title target:(nullable id)target action:(nullable SEL)action {
    if (@available(macOS 10.12, *)) {
        NSButton *btn = [NSButton buttonWithTitle:title target:target action:action];
        return btn;
    } else {
        NSButton *btn = [NSButton new];
        btn.title = title;
        btn.target = target;
        btn.action = action;
        return btn;
    }
}

+ (NSButton *)cm_buttonWithImage:(NSImage *)image target:(nullable id)target action:(nullable SEL)action {
    if (@available(macOS 10.12, *)) {
        NSButton *btn = [NSButton buttonWithImage:image target:target action:action];
        return btn;
    } else {
        NSButton *btn = [NSButton new];
        btn.image = image;
        btn.target = target;
        btn.action = action;
        return btn;
    }
}

@end
