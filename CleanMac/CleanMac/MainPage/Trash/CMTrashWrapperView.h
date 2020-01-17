//
//  CMTrashWrapperView.h
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/20 19:41 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMBaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CMTrashViewActionType) {
    CMTrashViewActionTypeNone,
    CMTrashViewActionTypeInfoDetail,
};

@protocol CMTrashViewDelegate <NSObject>

@optional
- (void)trashView:(id)view actionType:(CMTrashViewActionType)actionType;

@end


typedef NS_ENUM(NSUInteger, CMScanState) {
    CMScanStateScanBefore,
    CMScanStateScaning,
    CMScanStateScanEnd,
    CMScanStateScanInfoDetail,
};

@interface CMTrashWrapperView : CMBaseView

//
@property (nonatomic, weak) id<CMTrashViewDelegate> delegate;

@property (nonatomic, assign) CMScanState scanState;
@property (nonatomic, copy) IntegerBlock actionScanBlock;

@property (nonatomic, copy) NSArray *files;

- (void)configScaningPath:(NSString *)path;
- (void)configureEndScanSizeText:(NSString *)sizeText;
- (void)configureEndScanSize:(long long) size;

@end

NS_ASSUME_NONNULL_END
