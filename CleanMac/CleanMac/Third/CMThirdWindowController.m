//
//  CMThirdWindowController.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/15 16:17 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMThirdWindowController.h"
#import <Masonry.h>

@interface CMThirdWindowController ()

@property (nonatomic, strong) NSPanel *loginPanel;
@property (nonatomic, strong) NSTextField *userNameField;
@property (nonatomic, strong) NSTextField *passwordField;

@end

@implementation CMThirdWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    _loginPanel = [NSPanel new];
    [self.window addChildWindow:_loginPanel ordered:NSWindowAbove];
    _loginPanel.backgroundColor = [NSColor redColor];
    [_loginPanel center];
    self.loginPanel.contentView.frame = NSMakeRect(0.f, 0.f, 100, 100.f);
    
    _userNameField = [NSTextField new];
    _passwordField = [NSTextField new];
    [_loginPanel.contentView addSubview:_userNameField];
    [_loginPanel.contentView addSubview:_passwordField];
    _userNameField.frame = NSMakeRect(0.f, 0., 100, 40);
    _passwordField.frame = NSMakeRect(0.f, 50, 100.f, 40.f);
    _userNameField.textColor = [NSColor greenColor];
    _passwordField.textColor = [NSColor purpleColor];
    _userNameField.backgroundColor = [NSColor darkGrayColor];
    _passwordField.backgroundColor = [NSColor darkGrayColor];
    _userNameField.placeholderString = @"请输入名字";
    _passwordField.placeholderString =  @"请输入密码";

    [self.window beginSheet:self.loginPanel completionHandler:^(NSModalResponse returnCode) {
        NSString *userName = self.userNameField.stringValue;
        NSString *password = self.passwordField.stringValue;
        NSLog(@"userName %@",userName);
        NSLog(@"password %@",password);
    }];
}

@end
