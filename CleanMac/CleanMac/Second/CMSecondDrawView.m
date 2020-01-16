//
//  CMSecondDrawView.m
//  CleanMac
//
//  Created by Aka on 2020/1/16.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMSecondDrawView.h"

@interface CMSecondDrawView ()



@end

@implementation CMSecondDrawView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    self.wantsLayer = YES;
    self.layer.borderWidth = 3.f;
    
    //    NSImage *canvas = [[NSImage alloc] initWithSize:dirtyRect.size];
    //    [canvas lockFocus];
    //    [NSBezierPath fillRect:NSMakeRect(0.f, 0.f, 50.f, 50.f)];
    //    [NSBezierPath strokeRect:dirtyRect];
    //    [[NSColor redColor] setFill];
    //    [canvas unlockFocus];
    
    //    mac 10.8 之后的版本
    //     所以还是需要使用这些方法
    NSImage *canvas = [NSImage imageWithSize:NSMakeSize(50.f, 50.f) flipped:YES drawingHandler:^BOOL(NSRect dstRect) {
        [[NSColor redColor] setFill];
        [NSBezierPath fillRect:dstRect];
        [NSBezierPath strokeRect:dstRect];
        return YES;
    }];
    [canvas drawAtPoint:NSMakePoint(0., 0.f) fromRect:NSMakeRect(0.f, 0.f, 40.f, 40.f) operation:NSCompositingOperationSourceOut fraction:1.f];
}

@end
