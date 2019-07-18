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


@interface CMFileManger ()

@property (nonatomic, strong) NSFileManager *originFileManger;

@end

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

- (NSArray *)mountedVolumefileURls {
    NSArray<NSURLResourceKey> *urlSourceKeys = @[
        NSURLNameKey,
        NSURLLocalizedNameKey,
        NSURLIsRegularFileKey,
        NSURLIsDirectoryKey,
        NSURLIsSymbolicLinkKey,
        NSURLIsVolumeKey,
        NSURLIsPackageKey,
        NSURLIsApplicationKey,
        NSURLApplicationIsScriptableKey,
        NSURLIsSystemImmutableKey,
        NSURLIsUserImmutableKey,
        NSURLIsHiddenKey,
        NSURLHasHiddenExtensionKey,
        NSURLCreationDateKey,
        NSURLContentAccessDateKey,
        NSURLContentModificationDateKey,
        NSURLAttributeModificationDateKey,
        NSURLLinkCountKey,
        NSURLParentDirectoryURLKey,
        NSURLVolumeURLKey,
        NSURLTypeIdentifierKey,
        NSURLLocalizedTypeDescriptionKey,
        NSURLLabelNumberKey,
        NSURLLabelColorKey,
        NSURLLocalizedLabelKey,
        NSURLEffectiveIconKey,
        NSURLCustomIconKey,
        NSURLFileResourceIdentifierKey,
        NSURLVolumeIdentifierKey,
        NSURLPreferredIOBlockSizeKey,
        NSURLIsReadableKey,
        NSURLIsWritableKey,
        NSURLIsExecutableKey,
        NSURLFileSecurityKey,
        NSURLIsExcludedFromBackupKey,
        NSURLTagNamesKey,
        NSURLPathKey,
        NSURLCanonicalPathKey,
        NSURLIsMountTriggerKey,
        NSURLGenerationIdentifierKey,
        NSURLDocumentIdentifierKey,
        NSURLAddedToDirectoryDateKey,
        NSURLQuarantinePropertiesKey,
        NSURLFileResourceTypeKey
    ];
    NSArray *mountedURLs = [_originFileManger mountedVolumeURLsIncludingResourceValuesForKeys:urlSourceKeys options:NSVolumeEnumerationProduceFileReferenceURLs];
//    挂载volume
//    - (void)unmountVolumeAtURL:(NSURL *)url options:(NSFileManagerUnmountOptions)mask completionHandler:(void (^)(NSError * _Nullable errorOrNil))completionHandler API_AVAILABLE(macos(10.11)) API_UNAVAILABLE(ios, watchos, tvos);
//     卸载volume
    return mountedURLs;
}

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
    NSLog(@"trashFiles :%@",files);
    
    NSString *homePath =NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSAllDomainsMask, YES).firstObject;
    NSString *uniPath = [homePath stringByAppendingPathComponent:@"Untitled-1.oc"];
    NSArray *contents = [_originFileManger contentsOfDirectoryAtPath:homePath error:&error];

    long long fileSize2 = [[_originFileManger attributesOfItemAtPath:trashPath error:nil] fileSize];
    [self folderSizeAtPath:trashPath];
    NSLog(@"trash file size :%lld",fileSize2);

    NSURL *unitUrl = [NSURL fileURLWithPath:uniPath];
    long long unitFileSize1 = [[_originFileManger attributesOfItemAtPath:uniPath error:nil] fileSize];
    NSNumber *unitFileSize;
    [unitUrl getResourceValue:&unitFileSize forKey:NSURLFileSizeKey error:NULL];
    NSLog(@"lt- unit fize size;%@ , unit size 1 ;%lld",unitFileSize,unitFileSize1);

    
    long long fileSize1 =  [self folderSizeAtPath:homePath];
    NSLog(@"file size :%lld",fileSize1);
    
    long long fileSize = [self calculateSizeWithPath:trashPath];
    NSLog(@"lt-, file size :%lld",fileSize);
    return files;
}

- (long long)calculateSizeWithPath:(NSString *)folderPath {
    NSURL *diskCacheURL = [NSURL fileURLWithPath:folderPath isDirectory:YES];
    
        NSUInteger fileCount = 0;
        NSUInteger totalSize = 0;
        
        NSDirectoryEnumerator *fileEnumerator = [self.originFileManger enumeratorAtURL:diskCacheURL
                                                       includingPropertiesForKeys:@[NSFileSize]
                                                                          options:NSDirectoryEnumerationSkipsHiddenFiles
                                                                     errorHandler:NULL];
        
        for (NSURL *fileURL in fileEnumerator) {
            NSNumber *fileSize;
            [fileURL getResourceValue:&fileSize forKey:NSURLFileSizeKey error:NULL];
            totalSize += fileSize.unsignedIntegerValue;
            fileCount += 1;
        }

    NSLog(@"lt- file size ;%lu",(unsigned long)totalSize);
    return totalSize;
}

- (long long) fileSizeAtPath:(NSString*) filePath{
    
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
    
}

- (long long)folderSizeAtPath:(NSString *)folderPath {
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
//    return [self sizeOfFile:folderSize];
    return folderSize;
}

- (NSString *)sizeOfFile:(long long)folderSize {
    if (folderSize < 1024.0) {
        return  [NSString stringWithFormat:@"%.2fB",folderSize * 1.0];
    }else if (folderSize >= 1024.0 && folderSize < (1024.0*1024.0)){
        return  [NSString stringWithFormat:@"%.2fKB",folderSize/1024.0];
    }if (folderSize >= (1024.0*1024.0) && folderSize < (1024.0*1024.0*1024.0)) {
        return [NSString stringWithFormat:@"%.2fMB", folderSize/(1024.0*1024.0)];
    }else{
        return [NSString stringWithFormat:@"%.2fGB", folderSize/(1024.0*1024.0*1024.0)];
    }
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
