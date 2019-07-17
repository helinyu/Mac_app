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

+ (NSArray<NSString *> *)getMainClassInfo {

    NSString *path = [[NSBundle mainBundle] pathForResource:@"classList" ofType:@"plist"];
    NSArray<NSString *> *classes = [[NSArray alloc] initWithContentsOfFile:path];
//    NSData *data = [NSData dataWithContentsOfFile:path];
//    NSString *result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    return classes;
}

@end
