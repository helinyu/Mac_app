//
//  NSNumber+CMAdd.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/18 17:48 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "NSNumber+CMAdd.h"
#import <AppKit/AppKit.h>
#import "KMSystem.h"

@implementation NSNumber (CMAdd)

- (kInteger)unsignedToInteger {
    if ([KMSystem is64BitSystem]) {
        return self.unsignedIntegerValue;
    }
    else {
        return self.unsignedLongLongValue;
    }
}

@end
