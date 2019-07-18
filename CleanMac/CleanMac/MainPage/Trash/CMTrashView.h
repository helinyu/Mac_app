//
//  CMTrashView.h
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 19:17 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import <Cocoa/Cocoa.h>
#import "CMBaseView.h"

typedef NS_ENUM(NSUInteger, CMScanState) {
    CMScanStateBegin,
    CMScanStateScaning,
    CMScanStateEnd,
};

NS_ASSUME_NONNULL_BEGIN

@interface CMTrashView : CMBaseView

@property (nonatomic, copy) void(^actionScanBlock)(void);
@property (nonatomic, assign) CMScanState scanState;

@end

NS_ASSUME_NONNULL_END
