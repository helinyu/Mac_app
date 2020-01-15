//
//  CMAlertManger.m
//  CleanMac
//
//  Created by Aka on 2020/1/10.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMAlertManger.h"
#import "NSAlert+CMAdd.h"

kConstString(kSuppressionButtonText, @"不在显示次信息");
kConstString(kCommonAlertSuppressionState, @"common.alert.suppression.state");

@interface CMAlertManger ()

@property (nonatomic, strong) NSAlert *commonAlert; // 这个是一个公共的tag
@property (nonatomic, assign) BOOL commonAlertState;

@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSAlert *> *alertCacheDict;
// o 表示一个和state没有啥关系的，我们也是可以处理的


@end

@implementation CMAlertManger

- (NSMutableDictionary<NSNumber *,NSAlert *> *)alertCacheDict {
    if (!_alertCacheDict) {
        _alertCacheDict = [NSMutableDictionary new];
    }
    return _alertCacheDict;
}

- (NSAlert *)commonAlert {
    if (!_commonAlert) {
        _commonAlert = [NSAlert new];
    }
    return _commonAlert;
}

+ (instancetype)single{
    static dispatch_once_t token;
    static CMAlertManger *manager;
    dispatch_once(&token, ^{
        manager = [[self alloc]init];
    });
    return manager;
}

//+ (NSAlert *)showIsCommon:(BOOL)isCommon atWindow:(NSWindow *)window title:(NSString *)title desc:(NSString *)desc suppressionButton:(BOOL)suppressionButton cancelText:(NSString *)cancelText okText:(NSString *)okText cancelThen:(VoidBlock)cancelBlock okThen:(VoidBlock)okBlock  {
//
//}

+ (NSAlert *)showAtWindow:(NSWindow *)window title:(NSString *)title desc:(NSString *)desc suppressionButton:(BOOL)suppressionButton cancelText:(NSString *)cancelText okText:(NSString *)okText cancelThen:(VoidBlock)cancelBlock okThen:(VoidBlock)okBlock  {
    return [NSAlert showAtWindow:window title:title desc:desc cancelText:cancelText okText:okText cancelThen:cancelBlock okThen:okBlock];
}

//- (NSAlert *)getAlertWithFlag:(BOOL)isCommon withTag:(CMAlertType)alertType {
//    if (alertType <0) {
//        return [NSAlert new];
//    }
//
//    NSAlert *alert;
//    if (isCommon) {
//        alert = self.commonAlert;
//        NSInteger state = [[NSUserDefaults standardUserDefaults] integerForKey:(@(alertType).stringValue)];
//        self.commonAlertState = state;
//        return alert;
//    }
//
//
//}



//- (instancetype)initAtWindow:(NSWindow *)window title:(NSString *)title desc:(NSString *)desc cancelText:(NSString *)cancelText okText:(NSString *)okText cancelThen:(VoidBlock)cancelBlock okThen:(VoidBlock)okBlock {
//    [self addButtonWithTitle:okText];
//    [self addButtonWithTitle:cancelText];
//    [self setInformativeText:title];
//    [self setMessageText:desc];
//    [self setAlertStyle:NSAlertStyleWarning];
//    self.showsSuppressionButton = YES;
//    [[self suppressionButton] setTitle:@""];
//    [self beginSheetModalForWindow:window completionHandler:^(NSModalResponse returnCode) {
//        if (returnCode == NSAlertFirstButtonReturn) {
//            !okBlock? :okBlock();
//        }
//        if (returnCode == NSAlertSecondButtonReturn) {
//            !cancelText? :cancelBlock();
//        }
//    }];
//    return self;
//}

@end
