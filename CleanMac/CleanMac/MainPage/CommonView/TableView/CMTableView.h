//
//  CMTableView.h
//  CleanMac
//
//  Created by Aka on 2020/1/18.
//  Copyright © 2020 Aka. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMTableView : NSScrollView

@property (nonatomic, strong, readonly) NSTableView *tableView;

@end

NS_ASSUME_NONNULL_END
