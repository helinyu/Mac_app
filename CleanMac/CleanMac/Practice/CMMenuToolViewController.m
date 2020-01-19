//
//  CMMenuToolViewController.m
//  CleanMac
//
//  Created by Aka on 2020/1/19.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMMenuToolViewController.h"

@interface CMMenuToolViewController ()

@property (nonatomic, strong) NSMenu *menu;

@end

@implementation CMMenuToolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor greenColor].CGColor;

}

@end
