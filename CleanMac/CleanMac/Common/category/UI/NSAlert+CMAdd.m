//
//  NSAlert+CMAdd.m
//  CleanMac
//
//  Created by Aka on 2020/1/10.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "NSAlert+CMAdd.h"

#import <AppKit/AppKit.h>


@implementation NSAlert (CMAdd)

+ (instancetype)showAtWindow:(NSWindow *)window title:(NSString *)title desc:(NSString *)desc cancelText:(NSString *)cancelText okText:(NSString *)okText cancelThen:(VoidBlock)cancelBlock okThen:(VoidBlock)okBlock {
    NSAlert *alert = [NSAlert new];
    return [alert initAtWindow:window title:title desc:desc cancelText:cancelText okText:okText cancelThen:cancelBlock okThen:okBlock];
}

- (instancetype)initAtWindow:(NSWindow *)window title:(NSString *)title desc:(NSString *)desc cancelText:(NSString *)cancelText okText:(NSString *)okText cancelThen:(VoidBlock)cancelBlock okThen:(VoidBlock)okBlock {
    [self addButtonWithTitle:okText];
    [self addButtonWithTitle:cancelText];
    [self setInformativeText:title];
    [self setMessageText:desc];
    [self setAlertStyle:NSAlertStyleWarning];
    self.showsSuppressionButton = YES;
    [[self suppressionButton] setTitle:@"不在显示次信息"];
    [self beginSheetModalForWindow:window completionHandler:^(NSModalResponse returnCode) {
        if (returnCode == NSAlertFirstButtonReturn) {
            !okBlock? :okBlock();
        }
        if (returnCode == NSAlertSecondButtonReturn) {
            !cancelText? :cancelBlock();
        }
    }];
    return self;
}

- (instancetype)initAtWindow:(NSWindow *)window title:(NSString *)title desc:(NSString *)desc cancelText:(NSString *)cancelText okText:(NSString *)okText {
    [self addButtonWithTitle:okText];
    [self addButtonWithTitle:cancelText];
    [self setInformativeText:title];
    [self setMessageText:desc];
    [self setAlertStyle:NSAlertStyleWarning];
    
    return self;
}



@end
