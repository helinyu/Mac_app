//
//  CMViewProtocol.h
//  CleanMac
//
//  Created by Aka on 2020/1/18.
//  Copyright © 2020 Aka. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CMViewActionType) {
    CMViewActionTypeNone,
    CMViewActionTypeSelect,
};

@protocol CMViewProtocol <NSObject>

@optional

- (void)view:(id)view onActionType:(CMViewActionType)actionType;

@end

NS_ASSUME_NONNULL_END
