//
//  CMTrashInfoDetailCellView.h
//  CleanMac
//
//  Created by Aka on 2020/1/17.
//  Copyright © 2020 Aka. All rights reserved.
//

#import <Cocoa/Cocoa.h>


NS_ASSUME_NONNULL_BEGIN

@interface CMTrashInfoDetailCellView : NSTableCellView

- (void)configName:(NSString *)name;
- (void)configWeight:(long long)weight;
- (void)configName:(NSString *)name weight:(long long)weight;
- (void)configName:(NSString *)name weight:(long long)weight selectState:(BOOL)isSelected;

@property (nonatomic, weak) id<CMViewProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
