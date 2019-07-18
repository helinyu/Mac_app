//
//  CMPhotoTrashView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 20:05 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMPhotoTrashView.h"

@implementation CMPhotoTrashView

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
    self.layer.backgroundColor = [NSColor redColor].CGColor;
    
}
@end
