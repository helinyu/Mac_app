//
//  CMRightItemView.h
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 19:20 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//


#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMRightItemView : NSView

@property (nonatomic, strong, readonly) NSImageView *iconImgView;
@property (nonatomic, strong, readonly) NSTextField *titleTF;
@property (nonatomic, strong, readonly) NSTextField *descTF;

- (void)configImgName:(NSString *)imgName title:(NSString *)title desc:(NSString *)desc;

@end

NS_ASSUME_NONNULL_END
