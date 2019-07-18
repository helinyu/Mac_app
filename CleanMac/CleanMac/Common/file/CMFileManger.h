//
//  CMFileManger.h
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 15:15 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMFileManger : NSObject

+ (instancetype)single;


- (NSArray *)mountedVolumefileURls;

@end

@interface CMFileManger (ClassMathod)

+ (NSArray<NSString *> *)getMainClassInfos;
+ (NSDictionary *)getMainClassInfoDic;

@end

NS_ASSUME_NONNULL_END
