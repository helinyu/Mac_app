//
//  NSMutableArray+CMAdd.m
//  CleanMac
//
//  Created by Aka on 2020/1/17.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "NSMutableArray+CMAdd.h"

#import <AppKit/AppKit.h>
#import <objc/runtime.h>


@implementation NSMutableArray (CMAdd)

+ (void)load {
     method_exchangeImplementations(class_getInstanceMethod(self, @selector(addObject:)),
                                    class_getInstanceMethod(self, @selector(safeAddObject:)));
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(objectAtIndex:)),
                                      class_getInstanceMethod(self, @selector(safeObjectAtIndex:)));
 }


- (void)safeAddObject:(id)anObject {
    if (!anObject || [anObject isKindOfClass:[NSNull class]]) {
        return;
    }
    [self safeAddObject:anObject];
}

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index<0 || index >self.count) {
        return nil;
    }
    
    return [self safeObjectAtIndex:index];
}

@end
