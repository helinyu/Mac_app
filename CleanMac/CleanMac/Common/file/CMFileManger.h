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


typedef void(^ScanResultBlock)(BOOL finished, NSError * _Nullable error, NSString * _Nullable path, kInteger size);
typedef void(^BoolBlock)(BOOL flag);

NS_ASSUME_NONNULL_BEGIN

@interface CMFileManger : NSObject

+ (instancetype)single;


//- (NSArray *)mountedVolumefileURls;
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


+ (NSString *)fileSizeTranslateToLargerUnitWithOriginSize:(kInteger)originSize;

+ (kInteger)sizeTotalOfFolderPath:(NSString *)folderPath;
+ (void)sizeTotalOfFolderPath:(NSString *)folderPath then:(ScanResultBlock)resultBlock;

+ (kInteger)sizeOfSkinHiddenFilesFolderPath:(NSString *)folderPath;
+ (void)sizeOfSkinHiddenFilesFolderPath:(NSString *)folderPath then:(ScanResultBlock)resultBlock;

// 扫描垃圾桶的大小
+ (NSString *)scanTrashFolderThen:(ScanResultBlock)resultBlock;
+ (void)clearTrashFolderThen:(BoolBlock)then;

+ (BOOL)removePath:(NSString *)filePath;
+ (BOOL)removePathUrl:(NSURL *)pathUrl;


@end

@interface CMFileManger (ClassMathod)

+ (NSArray<NSString *> *)getMainClassInfos;
+ (NSDictionary *)getMainClassInfoDic;

@end

// 文件协调
@interface CMFileManger (NSFileCoordinator)<NSFilePresenter>



@end

NS_ASSUME_NONNULL_END
