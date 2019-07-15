//
//  AppDelegate.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/8 12:14 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification;{
    NSLog(@"lt- applicationWillFinishLaunching ;%@",self.window);
    
    [self onBind];
}
- (void)applicationDidFinishLaunching:(NSNotification *)notification;{
    NSLog(@"lt- applicationDidFinishLaunching ;%@",self.window);
}
- (void)applicationWillHide:(NSNotification *)notification;{
    NSLog(@"lt- applicationWillHide ;%@",self.window);

}
- (void)applicationDidHide:(NSNotification *)notification;{
    NSLog(@"lt- applicationDidHide ;%@",self.window);

}
- (void)applicationWillUnhide:(NSNotification *)notification;{
    NSLog(@"lt- applicationWillUnhide ;%@",self.window);

}
- (void)applicationDidUnhide:(NSNotification *)notification;{
    NSLog(@"lt- applicationDidUnhide ;%@",self.window);

}
- (void)applicationWillBecomeActive:(NSNotification *)notification;{
    NSLog(@"lt- applicationWillBecomeActive ;%@",self.window);

}
- (void)applicationDidBecomeActive:(NSNotification *)notification;{
    NSLog(@"lt- applicationDidBecomeActive ;%@",self.window);

}
- (void)applicationWillResignActive:(NSNotification *)notification;{
    NSLog(@"lt- applicationWillResignActive ;%@",self.window);

}
- (void)applicationDidResignActive:(NSNotification *)notification{
    NSLog(@"lt- applicationDidResignActive ;%@",self.window);

}
- (void)applicationWillUpdate:(NSNotification *)notification {
    NSLog(@"lt- applicationWillUpdate ;%@",self.window);

}
- (void)applicationDidUpdate:(NSNotification *)notification {
    NSLog(@"lt- applicationDidUpdate ;%@",self.window);

}
- (void)applicationWillTerminate:(NSNotification *)notification {
    NSLog(@"lt- applicationWillTerminate ;%@",self.window);

}
- (void)applicationDidChangeScreenParameters:(NSNotification *)notification {
    NSLog(@"lt- applicationDidChangeScreenParameters ;%@",self.window);
}
- (void)applicationDidChangeOcclusionState:(NSNotification *)notification API_AVAILABLE(macos(10.9)) {
    NSLog(@"lt- applicationDidChangeOcclusionState ;%@",self.window);
}


#pragma mark -- custom

- (void)onBind {
//NSWindowDidBecomeKeyNotification:窗口成为keyWindow
//NSWindowDidBecomeMainNotification:窗口成为mainWindow
//NSWindowDidMoveNotification:窗口移动
//NSWindowDidResignKeyNotification:窗口不再是keyWindow
//NSWindowDidResignMainNotification:窗口不再是mainWindow
//NSWindowDidResizeNotification:窗口大小改变
//NSWindowWillCloseNotification:关闭窗口
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDidBecomeKeyAction:) name:NSWindowDidBecomeKeyNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDidBecomeMainAction:) name:NSWindowDidBecomeMainNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDidMoveAction:) name:NSWindowDidMoveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDidResignKeyAction:) name:NSWindowDidResignKeyNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDidResignMainAction:) name:NSWindowDidResignMainNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onDidResizeAction:) name:NSWindowDidResizeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onWillCloseAction:) name:NSWindowWillCloseNotification object:nil];
}

- (void)onDidBecomeKeyAction:(NSNotification *)noti {
    NSLog(@"lt- onDidBecomeKeyAction:%@", noti);
}

- (void)onDidBecomeMainAction:(NSNotification *)noti {
    NSLog(@"lt- onDidBecomeMainAction:%@", noti);
}

- (void)onDidMoveAction:(NSNotification *)noti {
    NSLog(@"lt- onDidMoveAction:%@", noti);
}

- (void)onDidResignKeyAction:(NSNotification *)noti {
    NSLog(@"lt- onDidResignKeyAction:%@", noti);
}

- (void)onDidResignMainAction:(NSNotification *)noti {
    NSLog(@"lt- onDidResignMainAction:%@", noti);
}

- (void)onDidResizeAction:(NSNotification *)noti {
    NSLog(@"lt- onDidResizeAction:%@", noti);
}

- (void)onWillCloseAction:(NSNotification *)noti {
    NSLog(@"lt- onWillCloseAction:%@", noti);
}

@end
