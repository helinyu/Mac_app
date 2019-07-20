//
//  KMSytem.h
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/18 17:55 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import <Cocoa/Cocoa.h>

#pragma mark -- 64bit
#if defined(__LP64__) && __LP64__

typedef NSInteger kInteger;

#else
#pragma mark -- 32bit

typedef long long kInteger;

#endif

NS_ASSUME_NONNULL_BEGIN

#define k64BitSystem [KMSystem is64BitSystem]

@interface KMSystem : NSObject

//+ (BOOL)is64BitSystem;

@end

@interface KMSystem (Number)


@end

NS_ASSUME_NONNULL_END
