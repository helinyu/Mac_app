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

- (void)mountedVolume {
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
