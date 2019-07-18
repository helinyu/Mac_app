//
//  CMSystemTrashView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 20:04 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMSystemTrashView.h"

@implementation CMSystemTrashView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (void)baseInit {
    
    self.layer = CALayer.layer;
    self.layer.backgroundColor = [NSColor orangeColor].CGColor;
    
    
    
}

@end
