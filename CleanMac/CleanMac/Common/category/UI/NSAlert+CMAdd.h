//
//  NSAlert+CMAdd.h
//  CleanMac
//
//  Created by Aka on 2020/1/10.
//  Copyright © 2020 Aka. All rights reserved.
//

#import <AppKit/AppKit.h>


#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAlert (CMAdd)

+ (instancetype)showAtWindow:(NSWindow *)window title:(NSString *)title desc:(NSString *)desc cancelText:(NSString *)cancelText okText:(NSString *)okText cancelThen:(VoidBlock)cancelBlock okThen:(VoidBlock)okBlock;

@end

NS_ASSUME_NONNULL_END
