//
//  CMXPCViewController.m
//  CleanMac
//
//  Created by Aka on 2020/1/19.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMXPCViewController.h"
//#import "HelperProtocol.h"
//#import "Helper.h"

@interface CMXPCViewController ()

@property (nonatomic, strong) NSButton *btn;

@property (nonatomic, strong) NSXPCConnection *connection;

@end

@implementation CMXPCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor orangeColor].CGColor;
    
    _btn = [NSButton cm_buttonWithTitle:@"btn" target:self action:@selector(convertAction:)];
    [self.view addSubview:_btn];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(50.f);
        make.width.height.mas_equalTo(50.f);
    }];
    
//     创建connection
//    self.connection = [[NSXPCConnection alloc] initWithServiceName:@"macdev.io.Helper"]; // 创建连接对象
//    self.connection.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(HelperProtocol)]; // 注册协议
//    [self.connection resume]; // 同步等待连接建立
    
}

- (void)dealloc
{
    [self.connection invalidate];
}
//
//- (void)convertAction:(NSButton *)btn {
//    Helper *helper = [self.connection remoteObjectProxyWithErrorHandler:^(NSError * _Nonnull error) {
//        if (error) {
//            NSLog(@"lt - remote proxy error :%@",error);
//        }
//    }];
//
//    NSString *testString = @"abcd";
//
//    //通过remoteObjectProxy 执行xpc服务方法
//    [helper upperCaseString:testString withReply:^(NSString * upperString) {
//        NSLog(@"lt - upper string :%@",upperString);
//    }];
//}

@end
