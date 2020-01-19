//
//  CMMenuToolCodewindowController.m
//  CleanMac
//
//  Created by Aka on 2020/1/19.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMMenuToolCodewindowController.h"

@interface CMMenuToolCodewindowController ()<NSToolbarDelegate>

@property (nonatomic, strong) NSToolbar *toolbar;


@end

kConstString(KAppToolBar, @"app.toolbar");
kConstString(kFontSettings, @"font.settings");
kConstString(kSaveImage, @"save.image");

@implementation CMMenuToolCodewindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    [self setUpToolbar];
}


//通过这些代码来实现UI感觉还是不错的, 如果有些UI不行，可以到mainStoryborad上看看，对比一下
- (void)setUpToolbar {
    
    NSToolbar *toolbar = [[NSToolbar alloc] initWithIdentifier:KAppToolBar];
    toolbar.allowsUserCustomization = NO;
    toolbar.autosavesConfiguration = NO;
    toolbar.displayMode = NSToolbarDisplayModeIconAndLabel;
    toolbar.delegate = self;
    toolbar.sizeMode = NSToolbarSizeModeSmall;
    
    self.toolbar = toolbar;
    
    self.window.toolbar = toolbar;
}

- (nullable NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSToolbarItemIdentifier)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag {
    NSToolbarItem *toolbarItem = [[NSToolbarItem alloc] initWithItemIdentifier:itemIdentifier];
    if (itemIdentifier == kFontSettings) {
        toolbarItem.label = @"Font";
        toolbarItem.paletteLabel = @"Font";
        toolbarItem.toolTip = @"Font Settings";
        toolbarItem.image = [NSImage imageNamed:@"NSFontPanel"];
        toolbarItem.tag = 1;
    }
    
    if (itemIdentifier == kSaveImage) {
        toolbarItem.label = @"Save";
        toolbarItem.paletteLabel = @"Save";
        toolbarItem.toolTip = @"save files";
        toolbarItem.image = [NSImage imageNamed:@"icon_clear"];
        toolbarItem.tag = 2;
    }
    
    toolbarItem.minSize = NSMakeSize(25.f, 25.f);
    toolbarItem.maxSize = NSMakeSize(100.f, 100.f);
    toolbarItem.target = self;
    toolbarItem.action = @selector(onToolBarItemAction:);
    
    //     实现工具栏和窗口控制按钮融合显示, 也就是在同一行
    self.window.titleVisibility = NSWindowTitleHidden;
    
    return toolbarItem;
}

- (void)onToolBarItemAction:(NSToolbarItem *)toolbarItem {
    NSLog(@"lt - tool bar Item ");
}

- (NSArray<NSToolbarItemIdentifier> *)toolbarDefaultItemIdentifiers:(NSToolbar *)toolbar {
    return @[kFontSettings, kSaveImage];
}

- (NSArray<NSToolbarItemIdentifier> *)toolbarAllowedItemIdentifiers:(NSToolbar *)toolbar {
    return @[kFontSettings, kSaveImage];
}

@end
