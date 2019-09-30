//
//  NSFont+CMAdd.m
//  CleanMac
//
//  Created by Aka on 2019/9/29.
//  Copyright © 2019 Aka. All rights reserved.
//

#import "NSFont+CMAdd.h"

@implementation NSFont (CMAdd)

+ (NSFont *)cm_monospacedSystemFontOfSize:(CGFloat)fontSize weigth:(NSFontWeight)weigth {
    if (@available(macOS 10.15, *)) {
        return [NSFont monospacedSystemFontOfSize:13.f weight:weigth];
    } else {
       // Fallback on earlier versions
//         need to do more by the enum variable
       return [NSFont systemFontOfSize:13.f weight:1.f];
    }
}


@end
