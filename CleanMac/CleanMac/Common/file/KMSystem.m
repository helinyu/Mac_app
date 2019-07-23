//
//  KMSytem.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/18 17:55 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "KMSystem.h"

//static NSInteger k32VoidPointByteLength = 4; // 32位
static NSInteger k64VoidPointByteLength = 8; // 66位

@implementation KMSystem

+ (BOOL)is64BitSystem {
    if (sizeof(void *) == k64VoidPointByteLength) {
        return YES;
    }
    else {
        return NO;
    }
}

@end
