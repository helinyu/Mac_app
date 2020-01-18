//
//  CMFileManger.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 15:15 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMFileManger.h"
#import "NSNumber+CMAdd.h"
#import "KMSystem.h"
#import <Foundation/NSFileCoordinator.h>

#if defined(__LP64__) && __LP64__

typedef NSInteger kInteger;

#else

typedef long long kInteger;

#endif


@interface CMFileManger ()

@property (nonatomic, strong) NSFileManager *originFileManger;

@end

static CGFloat const kMagnitude = 1024.f;

@implementation CMFileManger

+ (instancetype)single {
    static CMFileManger *thiz;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        thiz = [CMFileManger new];
        thiz.originFileManger = [NSFileManager defaultManager];
    });
    return thiz;
}

- (void)scanfile {
    
//    - (nullable NSArray<NSURL *> *)mountedVolumeURLsIncludingResourceValuesForKeys:(nullable NSArray<NSURLResourceKey> *)propertyKeys options:(NSVolumeEnumerationOptions)options API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
    
    
}

//- (NSArray *)mountedVolumefileURls {
//    NSArray<NSURLResourceKey> *urlSourceKeys = @[
//        NSURLNameKey,
//        NSURLLocalizedNameKey,
//        NSURLIsRegularFileKey,
//        NSURLIsDirectoryKey,
//        NSURLIsSymbolicLinkKey,
//        NSURLIsVolumeKey,
//        NSURLIsPackageKey,
//        NSURLIsApplicationKey,
//        NSURLApplicationIsScriptableKey,
//        NSURLIsSystemImmutableKey,
//        NSURLIsUserImmutableKey,
//        NSURLIsHiddenKey,
//        NSURLHasHiddenExtensionKey,
//        NSURLCreationDateKey,
//        NSURLContentAccessDateKey,
//        NSURLContentModificationDateKey,
//        NSURLAttributeModificationDateKey,
//        NSURLLinkCountKey,
//        NSURLParentDirectoryURLKey,
//        NSURLVolumeURLKey,
//        NSURLTypeIdentifierKey,
//        NSURLLocalizedTypeDescriptionKey,
//        NSURLLabelNumberKey,
//        NSURLLabelColorKey,
//        NSURLLocalizedLabelKey,
//        NSURLEffectiveIconKey,
//        NSURLCustomIconKey,
//        NSURLFileResourceIdentifierKey,
//        NSURLVolumeIdentifierKey,
//        NSURLPreferredIOBlockSizeKey,
//        NSURLIsReadableKey,
//        NSURLIsWritableKey,
//        NSURLIsExecutableKey,
//        NSURLFileSecurityKey,
//        NSURLIsExcludedFromBackupKey,
//        NSURLTagNamesKey,
//        NSURLPathKey,
//        NSURLCanonicalPathKey,
//        NSURLIsMountTriggerKey,
//        NSURLGenerationIdentifierKey,
//        NSURLDocumentIdentifierKey,
//        NSURLAddedToDirectoryDateKey,
//        NSURLQuarantinePropertiesKey,
//        NSURLFileResourceTypeKey
//    ];
//    NSArray *mountedURLs = [_originFileManger mountedVolumeURLsIncludingResourceValuesForKeys:urlSourceKeys options:NSVolumeEnumerationProduceFileReferenceURLs];
////    挂载volume
////    - (void)unmountVolumeAtURL:(NSURL *)url options:(NSFileManagerUnmountOptions)mask completionHandler:(void (^)(NSError * _Nullable errorOrNil))completionHandler API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios, watchos, tvos);
////     卸载volume
//    return mountedURLs;
//}

- (NSArray *)fileUrls {
//    - (nullable NSArray<NSURL *> *)contentsOfDirectoryAtURL:(NSURL *)url includingPropertiesForKeys:(nullable NSArray<NSURLResourceKey> *)keys options:(NSDirectoryEnumerationOptions)mask error:(NSError **)error API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
    
    NSError *error = nil;
    NSString *homePath =NSSearchPathForDirectoriesInDomains(NSAllLibrariesDirectory, NSAllDomainsMask, YES).firstObject;
    NSArray *contents = [_originFileManger contentsOfDirectoryAtPath:homePath error:&error];
    NSLog(@"contents :%@",contents);
    return contents;
}

- (NSArray *)trashFiles {
    NSError *error = nil;
    NSString *trashPath =NSSearchPathForDirectoriesInDomains(NSTrashDirectory, NSAllDomainsMask, YES).firstObject;
    NSArray *files = [_originFileManger contentsOfDirectoryAtPath:trashPath error:&error];
    return files;
}


// protocol
- (NSURL *)presentedItemURL {
    return [NSURL URLWithString:@"http://www.baidu.com"];
}

@end

@implementation CMFileManger (Path)

+ (NSString *)getPathWithUrlResourceKey:(NSSearchPathDirectory)pathDirectory {
    NSString *path =NSSearchPathForDirectoriesInDomains(pathDirectory, NSAllDomainsMask, YES).firstObject;
    return path;
}

+ (NSString *)trashPath {
   return [CMFileManger getPathWithUrlResourceKey:NSTrashDirectory];
}

@end

@implementation CMFileManger (Size)

+ (kInteger)sizeOfFilePath:(NSString*)filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

+ (kInteger)sizeOfFilePathUrl:(NSURL *)filePathUrl {
    NSNumber *fileSize;
    [filePathUrl getResourceValue:&fileSize forKey:NSURLFileSizeKey error:NULL];
    return fileSize.unsignedLongLongValue;
}

//+ (BOOL)is64BitSystem {
//    if (sizeof(void *) == k64VoidPointByteLength) {
//        return YES;
//    }
//    else {
//        return NO;
//    }
//}

+ (kInteger)sizeTotalOfFolderPath:(NSString *)folderPath {
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    kInteger folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [CMFileManger sizeOfFilePath:fileAbsolutePath];
    }
    return folderSize;
}

+ (void)sizeTotalOfFolderPath:(NSString *)folderPath then:(ScanResultBlock)resultBlock {
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) {
        !resultBlock? :resultBlock(NO, nil, folderPath, 0);
        !resultBlock? :resultBlock(YES, nil, folderPath, 0);
        return ;
    }
    
    
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    kInteger folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        kInteger curFileSize = [CMFileManger sizeOfFilePath:fileAbsolutePath];
        folderSize += curFileSize;
        NSLog(@"trash :%@ cur file size ;%ld",fileName, (long)curFileSize);
        NSString *totalFileName = [NSString stringWithFormat:@"%@/%@",folderPath,fileName];
        !resultBlock? :resultBlock(NO, nil, totalFileName, folderSize);
    }
    !resultBlock? :resultBlock(YES, nil, @"", folderSize);
//    return folderSize;
}

+ (NSString *)fileSizeTranslateToLargerUnitWithOriginSize:(kInteger)originSize {
    if (originSize < kMagnitude) {
        return  [NSString stringWithFormat:@"%ld Byte",(long)originSize];
    }else if (originSize >= kMagnitude && originSize < (kMagnitude *kMagnitude)){
        return  [NSString stringWithFormat:@"%.2f KB",originSize *1.f/kMagnitude];
    }if (originSize >= (kMagnitude *kMagnitude) && originSize < (kMagnitude *kMagnitude *kMagnitude)) {
        return [NSString stringWithFormat:@"%.2fMB", originSize/(kMagnitude *kMagnitude)];
    }else{
        return [NSString stringWithFormat:@"%.2fGB", originSize/(kMagnitude *kMagnitude *kMagnitude)];
    }
}

+ (kInteger)sizeOfSkinHiddenFilesFolderPath:(NSString *)folderPath {
    NSURL *diskCacheURL = [NSURL fileURLWithPath:folderPath isDirectory:YES];
    
    NSUInteger fileCount = 0;
    NSUInteger totalSize = 0;
    
    //     一般都是不计算隐藏文件的
    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtURL:diskCacheURL
                                                        includingPropertiesForKeys:@[NSFileSize]
                                                                           options:NSDirectoryEnumerationSkipsHiddenFiles
                                                                      errorHandler:NULL];
    
    for (NSURL *fileURL in fileEnumerator) {
        kInteger fileSize = [self sizeOfFilePathUrl:fileURL];
        totalSize += fileSize;
        fileCount += 1;
    }
    
    return totalSize;
}

+ (void)sizeOfSkinHiddenFilesFolderPath:(NSString *)folderPath then:(ScanResultBlock)resultBlock {
    NSURL *diskCacheURL = [NSURL fileURLWithPath:folderPath isDirectory:YES];
    NSUInteger fileCount = 0;
    NSUInteger totalSize = 0;
    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtURL:diskCacheURL includingPropertiesForKeys:@[NSFileSize] options:NSDirectoryEnumerationSkipsHiddenFiles errorHandler:NULL];
    
    for (NSURL *fileURL in fileEnumerator) {
        kInteger fileSize = [self sizeOfFilePathUrl:fileURL];
        totalSize += fileSize;
        fileCount += 1;
        NSLog(@"trash url:%@ , size:%ld",fileURL,fileSize);
        !resultBlock? :resultBlock(NO, nil,fileURL.absoluteString, totalSize);
    }
    
    !resultBlock? :resultBlock(YES, nil, @"", totalSize);
}

+ (NSString *)scanTrashFolderThen:(ScanResultBlock)resultBlock {
    NSString *trashPath = [CMFileManger trashPath];
//    [CMFileManger sizeOfSkinHiddenFilesFolderPath:trashPath then:resultBlock];
    [CMFileManger sizeTotalOfFolderPath:trashPath then:resultBlock];
    return trashPath;
}

+ (void)clearTrashFolderThen:(BoolBlock)then {
//    NSFilePresenter 删除
//    这个类进行操作；
//    [NSFilePresenter Comment];
    
}

+ (BOOL)removePath:(NSString *)path {
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        return YES;
    }
    
    if (![[NSFileManager defaultManager] isDeletableFileAtPath:path]) {
        return  NO;
    }
    
    BOOL flag = YES;
    if ([[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&flag]) {
        path = [NSString stringWithFormat:@"%@/.",path];
    }
    
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    if (error) {
        if (error.code == 512) {
            return  YES;
        }
        return NO;
    }
    return YES;
}

+ (BOOL)removePathUrl:(NSURL *)pathUrl {
    return [CMFileManger removePath:pathUrl.path];
}

@end

@implementation CMFileManger (ClassMathod)

+ (NSArray<NSString *> *)getMainClassInfos {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"classList" ofType:@"plist"];
    NSArray<NSString *> *classes = [[NSArray alloc] initWithContentsOfFile:path];
    return classes;
}

+ (NSDictionary *)getMainClassInfoDic {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"classListDic" ofType:@"plist"];
    NSDictionary *classDic = [[NSDictionary alloc] initWithContentsOfFile:path];
    return classDic;
}

@end


@implementation CMFileManger (NSFileCoordinator)


+ (NSFileCoordinator *)fileCoordinator {
   return [[NSFileCoordinator alloc] initWithFilePresenter:self];
}


@end
