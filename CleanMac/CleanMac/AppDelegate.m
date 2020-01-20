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
#import "CMPopViewController.h"

@interface AppDelegate ()

@property (strong,nonatomic) NSStatusItem *rightTopStatusitem;
@property (nonatomic ,strong) NSPopover *popover;
@property(nonatomic)BOOL  isShow;
@property (weak) IBOutlet NSMenu *dockMenu;

@end

@implementation AppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification;{
//    NSLog(@"lt- applicationWillFinishLaunching ;%@",self.window);
    
    [self onBind];
    [self createRightTipStatusItem];
    [self getdSystemMenu];
}
- (void)applicationDidFinishLaunching:(NSNotification *)notification;{
//    NSLog(@"lt- applicationDidFinishLaunching ;%@",self.window);
}
- (void)applicationWillHide:(NSNotification *)notification;{
//    NSLog(@"lt- applicationWillHide ;%@",self.window);

}
- (void)applicationDidHide:(NSNotification *)notification;{
//    NSLog(@"lt- applicationDidHide ;%@",self.window);

}
- (void)applicationWillUnhide:(NSNotification *)notification;{
//    NSLog(@"lt- applicationWillUnhide ;%@",self.window);

}
- (void)applicationDidUnhide:(NSNotification *)notification;{
//    NSLog(@"lt- applicationDidUnhide ;%@",self.window);

}
- (void)applicationWillBecomeActive:(NSNotification *)notification;{
//    NSLog(@"lt- applicationWillBecomeActive ;%@",self.window);

}
- (void)applicationDidBecomeActive:(NSNotification *)notification;{
//    NSLog(@"lt- applicationDidBecomeActive ;%@",self.window);

}
- (void)applicationWillResignActive:(NSNotification *)notification;{
//    NSLog(@"lt- applicationWillResignActive ;%@",self.window);

}
- (void)applicationDidResignActive:(NSNotification *)notification{
//    NSLog(@"lt- applicationDidResignActive ;%@",self.window);

}
- (void)applicationWillUpdate:(NSNotification *)notification {
//    NSLog(@"lt- applicationWillUpdate ;%@",self.window);

}
- (void)applicationDidUpdate:(NSNotification *)notification {
//    NSLog(@"lt- applicationDidUpdate ;%@",self.window);

}
- (void)applicationWillTerminate:(NSNotification *)notification {
//    NSLog(@"lt- applicationWillTerminate ;%@",self.window);
    
    NSStatusBar *statusBar = [NSStatusBar systemStatusBar];
    [statusBar removeStatusItem:self.rightTopStatusitem];

}
- (void)applicationDidChangeScreenParameters:(NSNotification *)notification {
//    NSLog(@"lt- applicationDidChangeScreenParameters ;%@",self.window);
}
- (void)applicationDidChangeOcclusionState:(NSNotification *)notification API_AVAILABLE(macos(10.9)) {
//    NSLog(@"lt- applicationDidChangeOcclusionState ;%@",self.window);
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
//    NSLog(@"lt- onDidBecomeKeyAction:%@", noti);
}

- (void)onDidBecomeMainAction:(NSNotification *)noti {
//    NSLog(@"lt- onDidBecomeMainAction:%@", noti);
}

- (void)onDidMoveAction:(NSNotification *)noti {
//    NSLog(@"lt- onDidMoveAction:%@", noti);
}

- (void)onDidResignKeyAction:(NSNotification *)noti {
//    NSLog(@"lt- onDidResignKeyAction:%@", noti);
}

- (void)onDidResignMainAction:(NSNotification *)noti {
//    NSLog(@"lt- onDidResignMainAction:%@", noti);
}

- (void)onDidResizeAction:(NSNotification *)noti {
//    NSLog(@"lt- onDidResizeAction:%@", noti);
}

- (void)onWillCloseAction:(NSNotification *)noti {
//    NSLog(@"lt- onWillCloseAction:%@", noti);
}
- (IBAction)onFileOpenAction:(id)sender {
//    NSLog(@"file open action:");
    
    NSOpenPanel *openDlg = [NSOpenPanel openPanel];
    openDlg.canChooseFiles = YES ;
    openDlg.canChooseDirectories = YES;
    openDlg.allowsMultipleSelection = YES;
    openDlg.allowedFileTypes = @[@"txt",@"png"];
    [openDlg beginWithCompletionHandler: ^(NSInteger result){
        if(result==NSFileHandlingPanelOKButton){
            NSArray *fileURLs = [openDlg URLs];
            for(NSURL *url in fileURLs) {
                NSError *error;
                NSString *string = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
                if(!error){
//                     获取到了文件夹， 怎么获取文件呢？
                    NSLog(@"lt- string ;T%@", string);
//                    self.textView.string = string;
                }
            }
        }
    }];
}

// 系统的方法， 右下图片youji
//-(NSMenu *)applicationDockMenu:(NSApplication *)sender {
//    NSMenu *menu = [self createMenu];
//    return menu;
//}

- (NSMenu *)createMenu {
    NSMenu *customMenu = [[NSMenu alloc]init];
    NSMenuItem *openMenuItem = [[NSMenuItem alloc]initWithTitle:@"Open" action:@selector(menuClicked:) keyEquivalent:@"O"];
    [openMenuItem setKeyEquivalentModifierMask:NSShiftKeyMask];
    NSMenuItem *openRecentMenuItem = [[NSMenuItem alloc]initWithTitle:@"Open Recent..." action:nil keyEquivalent:@""];
    NSMenu *recentMenu = [[NSMenu alloc]init];
    [openRecentMenuItem setSubmenu:recentMenu];
    NSMenuItem *file1MenuItem = [[NSMenuItem alloc]initWithTitle:@"File1" action:@selector(menuClicked:) keyEquivalent:@""];
    [recentMenu addItem:file1MenuItem];
    [customMenu addItem:openMenuItem];
    [customMenu addItem:openRecentMenuItem];
    return customMenu;
}

- (void)menuClicked:(id)sender {
    NSLog(@"file 1：%@",sender);
}

// 右上角的图标
- (void)createRightTipStatusItem {
    //获取系统单例NSStatusBar对象
    NSStatusBar *statusBar = [NSStatusBar systemStatusBar];
    //创建固定宽度的NSStatusItem
    NSStatusItem *item = [statusBar statusItemWithLength:NSVariableStatusItemLength];
    [item.button setTarget:self];
    [item.button setAction:@selector(itemAction:)];
    item.button.image = [NSImage imageNamed:@"icon_clear"];
    self.rightTopStatusitem = item;
    [self setUpPopover];
}

// pop view
-(void)setUpPopover {
    self.popover = [[NSPopover alloc] init];
    self.popover.contentViewController = [CMPopViewController new];
    self.popover.contentViewController.view.frame = NSMakeRect(0.f, 0.f, 400.f, 500.f);
    self.popover.behavior = NSPopoverBehaviorTransient;
    self.popover.animates = YES;
}

-(void)itemAction:(id)sender {
    if (!self.isShow) {
        [self.popover showRelativeToRect:NSZeroRect ofView:[self rightTopStatusitem].button preferredEdge:NSRectEdgeMinY];
    } else {
        [self.popover close];
    }
    self.isShow = !self.isShow;
}

- (NSMenu *)applicationDockMenu:(NSApplication *)sender {
    return self.dockMenu;
}

- (IBAction)onMenuItemClicked:(id)sender {
    NSLog(@"lt - do what you want");
}

- (void)getdSystemMenu {
    NSMenu *mainMenu =  [NSApp mainMenu];
    NSArray *menuItems = [mainMenu itemArray];
    for (NSMenuItem *item in menuItems) {
        NSString *title = item.title;
        NSLog(@"lt - menuItem tilte :%@",title);
        NSMenu *subMenu = item.menu;
        NSArray *submenus = [subMenu itemArray];
        for (NSMenuItem *subItem in submenus) {
            NSLog(@"lt - sub menuitem title :%@",subItem.title);
        }
    }
}

@end
