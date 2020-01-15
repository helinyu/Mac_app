//
//  NSButton+CMAdd.h
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 17:10 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import <AppKit/AppKit.h>


#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSButton (CMAdd)

+ (NSButton *)cm_buttonWithTitle:(NSString *)title imgName:(NSString *)imgName target:(nullable id)target action:(nullable SEL)sel;
+ (NSButton *)cm_buttonWithTitle:(nullable NSString *)title image:(nullable NSImage *)image target:(nullable id)target action:(nullable SEL)action;
+ (NSButton *)cm_buttonWithTitle:(nullable NSString *)title target:(nullable id)target action:(nullable SEL)action;
+ (NSButton *)cm_buttonWithImage:(nullable NSImage *)image target:(nullable id)target action:(nullable SEL)action;

@end

NS_ASSUME_NONNULL_END
