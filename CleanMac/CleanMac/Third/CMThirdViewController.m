//
//  CMThirdViewController.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/15 16:18 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//


#import "CMThirdViewController.h"

@interface CMThirdViewController ()

@property (nonatomic, strong) NSScrollView *scrollView;

@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (weak) IBOutlet NSScrollView *textViewScrollView;

@end

@implementation CMThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor redColor].CGColor;
    
    self.textView.backgroundColor = [NSColor clearColor];
    
    _scrollView = [[NSScrollView alloc] initWithFrame:CGRectMake(50.f, 50.f, 200.f, 200.f)];
    [self.view addSubview:_scrollView];
    _scrollView.backgroundColor = [NSColor clearColor];
    
    NSArray *subViews = _scrollView.subviews;
    NSLog(@"lt - subviews count :%lu",(unsigned long)subViews.count);
    for (NSView *subView in subViews) {
        NSLog(@"lt - cur subvie :%@",subView);
        if ([subView isKindOfClass:[NSClipView class]]) {
            NSClipView *clipView = (NSClipView *)subView;
            clipView.backgroundColor = [NSColor clearColor];
        }
    }
    
    
    self.scrollView.drawsBackground = NO; // 设置为no， scrollView是透明的， YES， scrollView设置颜色就有效
    self.textViewScrollView.drawsBackground = YES;
    
    NSColor *scrollViewColor = self.scrollView.backgroundColor;
    NSColor *textColor = self.textViewScrollView.backgroundColor;
    
    NSLog(@"lt - scroll color :%@ , text scroll color :%@",scrollViewColor, textColor);
    
    self.scrollView.backgroundColor = [NSColor greenColor];
    self.textViewScrollView.backgroundColor = [NSColor greenColor];
    
    NSColor *scrollViewColor1 = self.scrollView.backgroundColor;
    NSColor *textColor1 = self.textViewScrollView.backgroundColor;
    NSLog(@"lt - scroll color :%@ , text scroll color :%@",scrollViewColor1, textColor1);
    
//    self.scrollView.backgroundColor = [NSColor clearColor];
//      self.textViewScrollView.backgroundColor = [NSColor clearColor];
//
//      NSColor *scrollViewColor2 = self.scrollView.backgroundColor;
//      NSColor *textColor2 = self.textViewScrollView.backgroundColor;
//      NSLog(@"lt - scroll color :%@ , text scroll color :%@",scrollViewColor2, textColor2);
}


@end
