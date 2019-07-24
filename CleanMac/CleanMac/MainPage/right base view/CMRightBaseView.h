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
#import "CMRightLogoBaseView.h"
@class CMRightItemView;


NS_ASSUME_NONNULL_BEGIN

@interface CMRightBaseView : CMRightLogoBaseView

@property (nonatomic, strong, readonly) CMRightItemView *firstItemView;
@property (nonatomic, strong, readonly) CMRightItemView *secondItemView;

- (void)InitBaseConfig;

@end

NS_ASSUME_NONNULL_END
