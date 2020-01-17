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

@property (unsafe_unretained) IBOutlet NSTextView *textView;

@end

@implementation CMThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor redColor].CGColor;

}

@end
