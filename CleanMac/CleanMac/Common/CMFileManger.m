//
//  CMFileManger.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 15:15 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMFileManger.h"

@implementation CMFileManger

+ (NSArray<NSString *> *)getMainClassInfos {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"classList" ofType:@"plist"];
    NSArray<NSString *> *classes = [[NSArray alloc] initWithContentsOfFile:path];
    return classes;
}

+ (NSDictionary *)getMainClassInfoDic {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"classListDic" ofType:@"plist"];
    NSDictionary *classDic = [[NSDictionary alloc] initWithContentsOfFile:path];
    return classDic;
}

@end
