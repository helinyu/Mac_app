//
//  CMSecondViewController.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/15 14:32 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import <Masonry.h>
#import "CMSecondViewController.h"
#import "CMSecondDrawView.h"
#import "NSButton+CMAdd.h"
#import  "CMShadowDrawView.h"
#import "CMSecondGradientView.h"

@interface CMSecondViewController ()<NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, strong) NSTableView *classTableView;
@property (nonatomic, strong) CMSecondDrawView *secondDrawView;

@property (nonatomic, strong) CMShadowDrawView *shadowDrawView;

@property (nonatomic, strong) CMSecondGradientView *gradientView;

@property (nonatomic, strong) NSButton *saveImgBtn;



@end

@implementation CMSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self viewInit];
    [self bindInit];
}

- (void)viewInit {
    CALayer *layer = CALayer.layer;
    layer.frame = CGRectMake(0.f, 0.f, self.view.bounds.size.width, self.view.bounds.size.height - 30);
    self.view.layer = layer;
    layer.backgroundColor = [NSColor yellowColor].CGColor;
    [self.view setNeedsDisplay:YES];
    
    _classTableView = [[NSTableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_classTableView];
    CALayer *tableLayer = [CALayer layer];
    tableLayer.frame = _classTableView.bounds;
    _classTableView.layer = tableLayer;
    tableLayer.backgroundColor = [NSColor grayColor].CGColor;
    [_classTableView setNeedsDisplay:YES];
    
    _secondDrawView = [CMSecondDrawView new];
    [self.view addSubview:_secondDrawView];
    [_secondDrawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.view);
        make.width.height.mas_equalTo(100.f);
    }];
    
    _saveImgBtn = [NSButton cm_buttonWithTitle:@"保存图片" target:self action:@selector(onSaveImgAction)];
    [self.view addSubview:_saveImgBtn];
    [_saveImgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(50.f);
        make.top.equalTo(self.view);
        make.height.width.mas_equalTo(50.f);
    }];
    
    _shadowDrawView = [CMShadowDrawView new];
    [self.view addSubview:_shadowDrawView];
    _shadowDrawView.layer = CALayer.layer;
    _shadowDrawView.layer.backgroundColor = [NSColor grayColor].CGColor;
    [_shadowDrawView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.secondDrawView.mas_right).offset(10.f);
        make.top.equalTo(self.view);
        make.width.height.mas_equalTo(50.f);
    }];
    
    _gradientView = [CMSecondGradientView new];
    [self.view addSubview:_gradientView];
    [_gradientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.shadowDrawView.mas_right).offset(20.f);
        make.width.height.mas_equalTo(200.f);
    }];
}

- (void)onSaveImgAction {
//    保存图片文件到app的document的目录下面
    NSData *data = [self.view dataWithPDFInsideRect:self.view.bounds];
    NSImage *viewImage = [[NSImage alloc] initWithData:data];
    
    NSBitmapImageRep *imageRep = [NSBitmapImageRep imageRepWithData:viewImage.TIFFRepresentation]; // 获取image rep
    
    //    设置图像压缩
    NSDictionary *imageProps = @{NSImageCompressionFactor:@(1.f)};
    NSData *imageData = [imageRep representationUsingType:NSBitmapImageFileTypePNG properties:imageProps];
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
//    文件路径
    NSURL *fileURl = [NSURL fileURLWithPath:[path stringByAppendingPathComponent:@"image.png"]];
    
//    写入文件
    BOOL falg =  [imageData writeToURL:fileURl atomically:YES];
    if (falg ) {
        NSLog(@"写入成功");
    }
    else {
        NSLog(@"写入失败");
    }
}

- (void)bindInit {
    _classTableView.dataSource= self;
    _classTableView.delegate = self;
}

#pragma mark -- datasource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return 10;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    return nil;
}


#pragma mark -- delegate
- (void)tableView:(NSTableView *)tableView didAddRowView:(NSTableRowView *)rowView forRow:(NSInteger)row API_AVAILABLE(macos(10.7)) {
    NSLog(@"did add row view ");
}

@end
