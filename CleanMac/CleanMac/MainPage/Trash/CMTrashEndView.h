//
//  CMTrashEndView.h
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/20 19:42 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMRightLogoBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CMTrashEndView : CMRightLogoBaseView

@property (nonatomic, strong, readonly) NSTextField *trashDataTF;
@property (nonatomic, strong, readonly) NSTextField *totalDataSizeTF;

@end

NS_ASSUME_NONNULL_END
