//
//  CMScanView.h
//  CleanMac
//
//  Created by Aka on 2020/1/15.
//  Copyright © 2020 Aka. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CMBaseView.h"
NS_ASSUME_NONNULL_BEGIN

@class CMScanContentView;

typedef NS_ENUM(NSUInteger, CMScanViewType) {
    CMScanViewTypeNone,
    CMScanViewTypeScanTap
};

@protocol CMScanViewDelegate <NSObject>

@optional
- (void)scanView:(id)view actionType:(CMScanViewType)actionType;

@end

@interface CMScanView : CMBaseView

@property (nonatomic, strong, readonly) CMScanContentView *scanContentView;

@property (nonatomic, weak) id<CMScanViewDelegate> scanViewDelegate;

@end

NS_ASSUME_NONNULL_END
