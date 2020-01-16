//
//  CMShadowDrawView.m
//  CleanMac
//
//  Created by Aka on 2020/1/16.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMShadowDrawView.h"

@implementation CMShadowDrawView

// 阴影好像这个没有绘制出来， 这个咋整
- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    [NSGraphicsContext saveGraphicsState];
    
    NSShadow *theShadow = [NSShadow new];
    theShadow.shadowOffset = NSMakeSize(5.f, -5.f);
    theShadow.shadowBlurRadius = 2.f;
    theShadow.shadowColor = [[NSColor blueColor] colorWithAlphaComponent:0.7];
    
    [theShadow set];
    
    NSRect rect = NSInsetRect(dirtyRect, 40.f, 40.f);
    
    [[NSColor redColor] setFill];
    
    [NSBezierPath fillRect:rect];
    
    [NSGraphicsContext restoreGraphicsState];
}

@end
