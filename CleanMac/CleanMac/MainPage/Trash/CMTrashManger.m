//
//  CMTrashManger.m
//  CleanMac
//
//  Created by Aka on 2020/1/17.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMTrashManger.h"

@implementation CMTrashManger

+ (instancetype)single{
    static dispatch_once_t token;
    static CMTrashManger *manager;
    dispatch_once(&token, ^{
        manager = [[self alloc]init];
    });
    return manager;
}



@end
