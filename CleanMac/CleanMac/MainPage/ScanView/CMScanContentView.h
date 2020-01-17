//
//  CMScanContentView.h
//  CleanMac
//
//  Created by Aka on 2020/1/15.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CMScanContentView : CMBaseView

@property (nonatomic, strong, readonly) NSButton *scanBtn;// 在最上层

@property (nonatomic, copy) VoidBlock scanActionBlock;

@end

NS_ASSUME_NONNULL_END
