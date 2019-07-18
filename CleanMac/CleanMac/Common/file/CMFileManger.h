//
//  CMFileManger.h
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 15:15 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import <Foundation/Foundation.h>
#import "NSNumber+CMAdd.h"
#import "KMSystem.h"


typedef void(^ScanResultBlock)(BOOL finished, NSError *error, NSString * _Nullable path, kInteger size);

NS_ASSUME_NONNULL_BEGIN

@interface CMFileManger : NSObject

+ (instancetype)single;


- (NSArray *)mountedVolumefileURls;
- (NSArray *)fileUrls;
- (NSArray *)trashFiles;

@end

@interface CMFileManger (Path)

// common get path method
+ (NSString *)getPathWithUrlResourceKey:(NSSearchPathDirectory)pathDirectory;

+ (NSString *)trashPath;

@end

@interface CMFileManger (Size)

+ (kInteger)sizeOfFilePath:(NSString*)filePath;
+ (kInteger)sizeOfFilePathUrl:(NSURL *)filePathUrl;
+ (kInteger)sizeTotalOfFolderPath:(NSString *)folderPath;
+ (NSString *)fileSizeTranslateToLargerUnitWithOriginSize:(kInteger)originSize;
+ (kInteger)sizeOfSkinHiddenFilesFolderPath:(NSString *)folderPath;
+ (void)sizeOfSkinHiddenFilesFolderPath:(NSString *)folderPath then:(ScanResultBlock)resultBlock;

// 扫描垃圾桶的大小
+ (void)scanTrashFolderThen:(ScanResultBlock)resultBlock;

@end

@interface CMFileManger (ClassMathod)

+ (NSArray<NSString *> *)getMainClassInfos;
+ (NSDictionary *)getMainClassInfoDic;

@end

NS_ASSUME_NONNULL_END
