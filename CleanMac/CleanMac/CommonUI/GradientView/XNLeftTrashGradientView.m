//
//  GradientView.m
//  CleanMac
//
//  Created by Aka on 2020/1/15.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "XNLeftTrashGradientView.h"

@implementation XNLeftTrashGradientView

- (void)drawRect:(NSRect)dirtyRect {
    
    if ([[self window] isKeyWindow]) {
        NSColor *startingColor = [NSColor colorWithRed:84.f/255.f green:112.f/255.f blue:105.f/255.f alpha:1.f];
        NSColor *endingColor = [NSColor colorWithRed:68.f/255.f green:74.f/255.f blue:88.f/255.f alpha:1.f];
        NSGradient* aGradient = [[NSGradient alloc]
                                 initWithStartingColor:startingColor
                                 endingColor:endingColor];
        [aGradient drawInRect:[self bounds] angle:270];
    } else {
        NSColor *startingColor = [NSColor colorWithRed:84.f/255.f green:112.f/255.f blue:105.f/255.f alpha:1.f];
        NSColor *endingColor = [NSColor colorWithRed:68.f/255.f green:74.f/255.f blue:88.f/255.f alpha:1.f];
        NSGradient* aGradient = [[NSGradient alloc]
                                 initWithStartingColor:startingColor
                                 endingColor:endingColor];
        [aGradient drawInRect:[self bounds] angle:270];
    }
    [super drawRect:dirtyRect];
}


@end
