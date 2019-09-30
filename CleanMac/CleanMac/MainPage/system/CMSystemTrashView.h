//
//  CMSystemTrashView.h
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 20:04 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import <Cocoa/Cocoa.h>
#import "CMPreScanView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CMSystemTrashView : NSView

@property (nonatomic, strong) CMPreScanView *scanView;

@end

NS_ASSUME_NONNULL_END
