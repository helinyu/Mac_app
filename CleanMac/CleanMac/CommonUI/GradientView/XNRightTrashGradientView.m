//
//  GradientView.m
//  CleanMac
//
//  Created by Aka on 2020/1/15.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "XNRightTrashGradientView.h"

@implementation XNRightTrashGradientView

- (void)drawRect:(NSRect)dirtyRect {
    
    if ([[self window] isKeyWindow]) {
        NSColor *startingColor = [NSColor colorWithRed:84.f/255.f green:112.f/255.f blue:105.f/255.f alpha:1.f];
        NSColor *endingColor = [NSColor colorWithRed:50.f/255.f green:57.f/255.f blue:77.f/255.f alpha:1.f];
        NSGradient* aGradient = [[NSGradient alloc]
                                 initWithStartingColor:startingColor
                                 endingColor:endingColor];
        [aGradient drawInRect:[self bounds] angle:270];
    } else {
       NSColor *startingColor = [NSColor colorWithRed:84.f/255.f green:112.f/255.f blue:105.f/255.f alpha:1.f];
               NSColor *endingColor = [NSColor colorWithRed:50.f/255.f green:57.f/255.f blue:77.f/255.f alpha:1.f];
        NSGradient* aGradient = [[NSGradient alloc]
                                 initWithStartingColor:startingColor
                                 endingColor:endingColor];
        [aGradient drawInRect:[self bounds] angle:270];
    }
    [super drawRect:dirtyRect];
}


@end
