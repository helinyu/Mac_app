//
//  XNSecondCustomView.m
//  CleanMac
//
//  Created by Aka on 2020/1/17.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "XNSecondCustomView.h"
#import <QuartzCore/CAAnimation.h>
#import <QuartzCore/CATransaction.h>
#import "NSButton+CMAdd.h"

@interface XNSecondCustomView () <CAAnimationDelegate,NSAnimatablePropertyContainer>


@end

@implementation XNSecondCustomView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self animationSetup];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    self.wantsLayer = YES;
    self.layer.backgroundColor = [NSColor redColor].CGColor;
    
}

// 代理的方式回调
- (void)animationSetup {
    CABasicAnimation *animation1 = [CABasicAnimation new];
    animation1.keyPath = @"borderWidth";
    animation1.delegate = self;
    [self.layer addAnimation:animation1 forKey:nil];
}

// block方式回调
- (void)animationSetupBlockCallBack {
    [CATransaction begin];
    CABasicAnimation *animation1 = [CABasicAnimation new];
    animation1.keyPath = @"borderWidth";
    animation1.toValue = @(10);
    animation1.delegate = self;
    [self.layer addAnimation:animation1 forKey:nil];
    [CATransaction commit ];
    [CATransaction setCompletionBlock:^{
        self.layer.borderWidth = 10.f;
    }];
    
}


- (void)test0 {
    
}

#pragma mark -- delegate

/* Called when the animation begins its active duration. */
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"lt - animationDidStart :%@", anim);
}

/* Called when the animation either completes its active duration or
 * is removed from the object it is attached to (i.e. the layer). 'flag'
 * is true if the animation reached the end of its active duration
 * without being removed. */

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"lt - animationDidStop :%@, flag:%d",anim, flag);
    self.layer.borderWidth = 10.f;
}


@end
