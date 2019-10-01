//
//  FXWindow.m
//  testControl
//
//  Created by Aka on 2019/10/1.
//  Copyright © 2019 Aka. All rights reserved.
//

#import "FXWindow.h"
#import <AppKit/AppKit.h>

@implementation FXWindow

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [NSColor purpleColor];
    }
    return self;
}

- (void)scrollWheel:(NSEvent *)event {
    NSLog(@"lt- scroll wheel ,%@, event :%@", self, event);
}

- (void)touchesBeganWithEvent:(NSEvent *)event {
    NSLog(@"lt- touch :%@, touch event： %@",self, event);
}


@end
