//
//  ViewController.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/8 12:14 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//

#import "ViewController.h"
#import <Masonry.h>

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = CALayer.layer;
    layer.frame = CGRectMake(0.f, 0.f, self.view.bounds.size.width, self.view.bounds.size.height - 30);
    self.view.layer = layer;
    layer.backgroundColor = [NSColor grayColor].CGColor;
    [self.view setNeedsDisplay:YES];
    
    
//    NSButton *btn = [NSButton buttonWithTitle:@"点击" target:self action:@selector(ontapAction)];
//    [self.view addSubview:btn];
//    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.equalTo(self.view).offset(50);
////        make.width.height.mas_equalTo(100.f);
//    }];
    
//    NSRect frame = CGRectMake(0, 0, 200, 200);
//    NSUInteger style =  NSTitledWindowMask | NSClosableWindowMask |NSMiniaturizableWindowMask | NSResizableWindowMask;
//    NSWindow *window = [NSWindow alloc]initWithContentRect:frame styleMask:style backing:NSBackingStoreBuffered defer:YES];
//    window.title = @"New Create Window";
//    [window makeKeyAndOrderFront:self];

}
//- (IBAction)onTapAction:(id)sender {
//    NSLog(@"ontapAction");
//    NSWindow *window = [[NSWindow alloc]initWithContentRect:NSMakeRect(200.f, 200.f, 600, 400) styleMask: NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:YES];
//    window.title = @"第二个window";
//    [window center];
//    [window makeKeyAndOrderFront:self];
//}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


// test method
- (IBAction)onAlertAction:(id)sender {
//    NSString *password = self.passwordField.stringValue;
//    if([password length]<6) {
        NSAlert *alert = [[NSAlert alloc] init];
        //增加一个按钮
        [alert addButtonWithTitle:@"Ok"];
        //提示的标题
        [alert setMessageText:@"Alert"];
        //提示的详细内容
        [alert setInformativeText:@"password length must be more than 6 "];
        //设置告警风格
        [alert setAlertStyle:NSInformationalAlertStyle];
        //开始显示告警
    
    [alert beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse returnCode) {
        NSLog(@"resutn count ;%ld", (long)returnCode);
    }];
}

@end
