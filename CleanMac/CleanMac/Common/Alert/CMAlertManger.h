//
//  CMAlertManger.h
//  CleanMac
//
//  Created by Aka on 2020/1/10.
//  Copyright © 2020 Aka. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// list of the alert

typedef NS_ENUM(NSInteger, CMAlertType) {
//     while < 0 will new alert
    CMAlertTypeCommon =0,
    CMAlertTypeOther,
};

@interface CMAlertManger : NSObject

+ (instancetype)single;

+ (NSAlert *)showAtWindow:(NSWindow *)window title:(NSString *)title desc:(NSString *)desc suppressionButton:(BOOL)suppressionButton cancelText:(NSString *)cancelText okText:(NSString *)okText cancelThen:(VoidBlock)cancelBlock okThen:(VoidBlock)okBlock;

@end

NS_ASSUME_NONNULL_END
