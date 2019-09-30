//
//  NSFont+CMAdd.h
//  CleanMac
//
//  Created by Aka on 2019/9/29.
//  Copyright © 2019 Aka. All rights reserved.
//

#import <AppKit/AppKit.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSFont (CMAdd)

+ (NSFont *)cm_monospacedSystemFontOfSize:(CGFloat)fontSize weigth:(NSFontWeight)weigth;

@end

NS_ASSUME_NONNULL_END
