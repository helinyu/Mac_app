//
//  CMFileInfoModel.h
//  CleanMac
//
//  Created by Aka on 2020/1/17.
//  Copyright © 2020 Aka. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMFileInfoModel : NSObject

@property (nonatomic, assign) BOOL isDirectory; //YES : directon NO: file
@property (nonatomic, assign) CGFloat weight; // 文件大小

@property (nonatomic, copy) NSString *prePath; // 前面的路径
@property (nonatomic, copy) NSString *name; // 当前的文件以及目录名字

@property (nonatomic, assign) NSInteger state; // reverse state

@end

@interface CMFileInfoModel  (Extra)

@property (nonatomic, assign) BOOL isSelected;

@end

NS_ASSUME_NONNULL_END
