//
//  CMPreScanLeftCellView.h
//  CleanMac
//
//  Created by Aka on 2019/9/27.
//  Copyright © 2019 Aka. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMPreScanLeftCellView : NSTableCellView

- (void)configIconName:(NSString *)iconName title:(NSString *)title desc:(NSString *)desc;

@end

NS_ASSUME_NONNULL_END
