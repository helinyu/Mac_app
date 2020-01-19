//
//  CMMenuToolWindowController.m
//  CleanMac
//
//  Created by Aka on 2020/1/19.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMMenuToolWindowController.h"

@interface CMMenuToolWindowController ()<NSToolbarDelegate,NSToolbarItemValidation>

@property (weak) IBOutlet NSToolbar *toolbar; /// storyboard 中创建控件

@end

@implementation CMMenuToolWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    self.toolbar.delegate = self;
    
}

- (IBAction)onToolbarMenuItemAction:(id)sender {
    if ([sender isKindOfClass:[NSToolbarItem class]]) {
        NSToolbarItem *tbItem = (NSToolbarItem *)sender;
        NSLog(@"lt -  tool bar tag ; %ld",(long)tbItem.tag);
        if (tbItem.tag == 5) {
            NSLog(@"lt - 打开文件");
        }
        else {
           
        }
    }
}


// 不知道扎二个怎么使用， 好像这样子使用还是不行的
- (BOOL)validateMenuItem:(NSMenuItem *)menuItem  {
    NSLog(@"menuitem tilte :%@",menuItem);
    if ([menuItem.title isEqualToString:@"open"]) {
        
    }
    return YES;
}
    


@end
