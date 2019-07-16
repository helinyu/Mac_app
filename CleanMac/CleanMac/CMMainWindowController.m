//
//  CMMainWindowController.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/15 19:29 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMMainWindowController.h"

@interface CMMainWindowController ()

@end

@implementation CMMainWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
}

- (IBAction)onFileOpenAction:(id)sender {
    
    NSToolbarItem *item =  sender;
    NSInteger tag = item.tag;
    //根据每个ToolbarItem的tag做流程处理
    if(tag==1) {
        
    }
    if(tag==2 ) {
        
    }
}

@end
