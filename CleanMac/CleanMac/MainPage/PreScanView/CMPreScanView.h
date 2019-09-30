//
//  CMPreScanView.h
//  CleanMac
//
//  Created by Aka on 2019/9/27.
//  Copyright © 2019 Aka. All rights reserved.
//

#import "CMBaseView.h"
@class CMPreScanLeftTitleView;
@class CMPreScanContentModel;

NS_ASSUME_NONNULL_BEGIN

@interface CMPreScanView : CMBaseView

@property (nonatomic, strong, readonly) CMPreScanLeftTitleView *titleView;
@property (nonatomic, strong, readonly) NSTableView *tableView;
@property (nonatomic, strong, readonly) NSImageView *iconView;

- (void)configData:(NSArray<CMPreScanContentModel *> *)datasources update:(BOOL)isUpdate;

@end

NS_ASSUME_NONNULL_END
