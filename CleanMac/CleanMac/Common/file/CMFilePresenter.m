//
//  CMFilePresenter.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/20 13:12 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMFilePresenter.h"


@interface CMFilePresenter ()<NSFilePresenter>

@end

@implementation CMFilePresenter

@dynamic presentedItemURL;
@dynamic presentedItemOperationQueue;

// 这两个属性看怎么进行处理
- (NSURL *)presentedItemURL {
    return nil;
}
- (NSOperationQueue *)presentedItemOperationQueue {
    return nil;
}

@synthesize primaryPresentedItemURL;

- (NSURL *)primaryPresentedItemURL {
    return [NSURL URLWithString:@""];
}


- (void)relinquishPresentedItemToReader:(void (^)(void (^ _Nullable reacquirer)(void)))reader {
    
    !reader? :reader();
}


- (void)relinquishPresentedItemToWriter:(void (^)(void (^ _Nullable reacquirer)(void)))writer {
    
    !writer? :writer();
}

- (void)savePresentedItemChangesWithCompletionHandler:(void (^)(NSError * _Nullable errorOrNil))completionHandler {
    
    !completionHandler? :completionHandler(nil);
}




- (void)accommodatePresentedItemDeletionWithCompletionHandler:(void (^)(NSError * _Nullable errorOrNil))completionHandler {
    !completionHandler? :completionHandler(nil);
}

- (void)presentedItemDidMoveToURL:(NSURL *)newURL {
    NSLog(@"new Url");
}

#pragma mark *** Files and File Packages ***

- (void)presentedItemDidChange {
    NSLog(@"presented item Did chagne ");
}

- (void)presentedItemDidChangeUbiquityAttributes:(NSSet<NSURLResourceKey> *)attributes API_AVAILABLE(macos(10.13), ios(11.0)) API_UNAVAILABLE(watchos, tvos) {
    NSLog(@"presentedItemDidChangeUbiquityAttributes");
}


//@property (readonly, strong) NSSet<NSURLResourceKey> *observedPresentedItemUbiquityAttributes API_AVAILABLE(macos(10.13), ios(11.0)) API_UNAVAILABLE(watchos, tvos);

- (void)presentedItemDidGainVersion:(NSFileVersion *)version {
    NSLog(@"presentedItemDidGainVersion");
}
- (void)presentedItemDidLoseVersion:(NSFileVersion *)version {
    NSLog(@"presentedItemDidLoseVersion");
}
- (void)presentedItemDidResolveConflictVersion:(NSFileVersion *)version {
    NSLog(@":presentedItemDidResolveConflictVersion ");
}

#pragma mark *** Directories ***

- (void)accommodatePresentedSubitemDeletionAtURL:(NSURL *)url completionHandler:(void (^)(NSError * _Nullable errorOrNil))completionHandler {
    NSLog(@"accommodatePresentedSubitemDeletionAtURL");
    !completionHandler? :completionHandler(nil);
}

- (void)presentedSubitemDidAppearAtURL:(NSURL *)url {
    NSLog(@"presentedSubitemDidAppearAtURL :%@",url);
}

- (void)presentedSubitemAtURL:(NSURL *)oldURL didMoveToURL:(NSURL *)newURL {
    NSLog(@"presentedSubitemAtURL ;%@", newURL);
}

- (void)presentedSubitemDidChangeAtURL:(NSURL *)url {
    NSLog(@"presentedSubitemDidChangeAtURL :%@",url);
}

- (void)presentedSubitemAtURL:(NSURL *)url didGainVersion:(NSFileVersion *)version {
    NSLog(@"presentedSubitemAtURL %@, didGainVersion:%@:",url, version);
}
- (void)presentedSubitemAtURL:(NSURL *)url didLoseVersion:(NSFileVersion *)version {
    NSLog(@"presentedSubitemAtURL :%@, didLoseVersion:%@",url, version);
}
- (void)presentedSubitemAtURL:(NSURL *)url didResolveConflictVersion:(NSFileVersion *)version {
    NSLog(@"presentedSubitemAtURL :%@, didResolveConflictVersion:%@",url, version);
}


@end
