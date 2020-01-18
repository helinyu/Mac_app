//
//  CMFileInfoModel.m
//  CleanMac
//
//  Created by Aka on 2020/1/17.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMFileInfoModel.h"
#import <objc/runtime.h>

@implementation CMFileInfoModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sonFiles = [NSMutableArray new];
    }
    return self;
}

@end

@implementation CMFileInfoModel  (Extra)

- (void)setIsSelected:(BOOL)isSelected {
    NSNumber *selectedObj = @(isSelected);
    objc_setAssociatedObject(self, @"is.selected", selectedObj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isSelected {
    NSNumber *selectedObj = objc_getAssociatedObject(self, @"is.selected");
    return selectedObj.boolValue;
}

@end
