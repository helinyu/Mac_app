//
//  CMSecondWindowController.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/15 14:38 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMSecondWindowController.h"

@interface CMSecondWindowController ()

@end

@implementation CMSecondWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    [self.window setTitle:@"二级window"];
    [[self.window standardWindowButton:NSWindowDocumentIconButton] setImage:[NSImage imageNamed:@"window"]];
    
    [self.window setOpaque:NO];
    [self.window setBackgroundColor:[NSColor greenColor]];
}

@end
