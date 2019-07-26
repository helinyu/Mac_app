//
//  CMMainPageViewController.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/16 20:29 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMMainPageViewController.h"
#import <Masonry.h>
#import "CMMainPageClassTCellView.h"
#import "CMFileManger.h"
//#import <ReactiveCocoa/ReactiveCocoa.h>
#import "CMFileManger.h"

#import "CMIntelligenceView.h"
#import "CMSystemTrashView.h"
#import "CMPhotoTrashView.h"
#import "CMEmailTrashView.h"
#import "CMItunesTrashView.h"
#import "CMTrashScanBeforeView.h"
#import "CMMaliciousSoftwareView.h"
#import "CMPrivacyView.h"
#import "CMOptimizationView.h"
#import "CMMaintainView.h"
#import "CMUnloaderView.h"
#import "CMUpdateProgramView.h"
#import "CMExtendView.h"
#import "CMSpaceLensView.h"
#import "CMLODcumentView.h"
#import "CMShredderView.h"
#import "CMTrashWrapperView.h"

#define Create_right_view(cls) ([self createRightViewWithClass:[cls new]])

@interface CMMainPageViewController ()<NSTableViewDataSource, NSTableViewDelegate>

@property (weak) IBOutlet NSTableView *classTableView;
@property (nonatomic, strong) NSArray<NSString *> *datasources;
@property (nonatomic, strong) NSDictionary<NSString *, NSNumber *> *datasourceDic;
@property (nonatomic, strong) NSArray<NSView *> *rightViews;

@property (nonatomic, strong) CMIntelligenceView *intelligenceView;
@property (nonatomic, strong) CMSystemTrashView *systemTrashView;
@property (nonatomic, strong) CMPhotoTrashView *photoTrashView;
@property (nonatomic, strong) CMEmailTrashView *emailTrashView;
@property (nonatomic, strong) CMItunesTrashView *itunestrashView;

@property (nonatomic, strong) CMTrashWrapperView *trashView;
@property (nonatomic, copy) NSString *trashFolderPath;

@property (nonatomic, strong) CMMaliciousSoftwareView * maliciousSoftwareView;
@property (nonatomic, strong) CMPrivacyView *privacyView;
@property (nonatomic, strong) CMOptimizationView *optimizationView;
@property (nonatomic, strong) CMMaintainView *maintainView;
@property (nonatomic, strong) CMUnloaderView *unloaderView;
@property (nonatomic, strong) CMUpdateProgramView *updateProgramView;
@property (nonatomic, strong) CMExtendView *extendView;
@property (nonatomic, strong) CMSpaceLensView *spaceLensView;
@property (nonatomic, strong) CMLODcumentView *loDocumentView;
@property (nonatomic, strong) CMShredderView *shredderView;

@property (nonatomic, assign) NSInteger curRow;

@end

@implementation CMMainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self viewInit];
    [self dataInit];
    [self bindInit];
}

- (void)viewInit {
    self.view.window.backgroundColor = [NSColor cyanColor];
    
    self.datasourceDic = [CMFileManger getMainClassInfoDic];
    self.datasources = [CMFileManger getMainClassInfos];
    [self.classTableView reloadData];
    
    _intelligenceView = Create_right_view(CMIntelligenceView);
    _systemTrashView = Create_right_view(CMSystemTrashView);
    _photoTrashView = Create_right_view(CMPhotoTrashView);
    _emailTrashView = Create_right_view(CMEmailTrashView);
    _itunestrashView = Create_right_view(CMItunesTrashView);
    _trashView = Create_right_view(CMTrashWrapperView);
    _maliciousSoftwareView = Create_right_view(CMMaliciousSoftwareView);
    _privacyView = Create_right_view(CMPrivacyView);
    _optimizationView = Create_right_view(CMOptimizationView);
    _maintainView = Create_right_view(CMMaintainView);
    _unloaderView = Create_right_view(CMUnloaderView);
    _updateProgramView = Create_right_view(CMUpdateProgramView);
    _extendView = Create_right_view(CMExtendView);
    _spaceLensView = Create_right_view(CMSpaceLensView);
    _loDocumentView = Create_right_view(CMLODcumentView);
    _shredderView = Create_right_view(CMShredderView);
    
    _rightViews = @[_intelligenceView, _systemTrashView, _photoTrashView, _emailTrashView, _itunestrashView, _trashView, _maliciousSoftwareView, _privacyView, _optimizationView, _maintainView, _unloaderView, _updateProgramView, _extendView, _spaceLensView, _loDocumentView, _shredderView];
    
    for (NSView *rightView in _rightViews) {
        rightView.hidden = YES;
    }
    _intelligenceView.hidden = NO;
}

- (void)dataInit {
//    NSArray*volumes =[[CMFileManger single] mountedVolumefileURls]; // 加载的券的内容
//    NSLog(@"volumes :%@",volumes);
    
    NSArray *contents = [[CMFileManger single]  fileUrls];
//    NSLog(@"contents :%@",contents);
    
    NSArray *trashFiles = [[CMFileManger single]  trashFiles];
//    NSLog(@"trashFiles :%@",trashFiles);

}

- (id)createRightViewWithClass:(NSView *)rightView {
    [self.view addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self.view);
        make.left.equalTo(self.classTableView.mas_right);
    }];
    return rightView;
}

#pragma mark -- method

- (void)bindInit {

    __weak typeof (self) weakSelf = self;
    _trashView.actionScanBlock = ^(NSInteger scanState) {
        [weakSelf dealWithState:scanState];
    };
}

#pragma mark -- trash View deal with

- (void)dealWithState:(NSInteger)scanState {
    if (scanState == CMScanStateScanBefore) {
        self.trashView.scanState = CMScanStateScaning;
        [self scaningTrashFolder];
    }
    else if (scanState == CMScanStateScaning) {
        NSLog(@"取消扫描");// 方法药设置l为实例方法
        self.trashView.scanState = CMScanStateScanBefore;
    }
    else {
        NSLog(@"清除");
        NSString *trashFolderFilesPath = [NSString stringWithFormat:@"%@/.",self.trashFolderPath];
        BOOL flag = [CMFileManger removePath:trashFolderFilesPath];
        if (flag) {
            NSLog(@"清除完成");
            self.trashView.scanState = CMScanStateScanBefore;
        }
        else {
            NSLog(@"清除失败");
        }
    }
}

- (void)scaningTrashFolder {
    NSString *folderPath = [CMFileManger scanTrashFolderThen:^(BOOL finished, NSError *error, NSString * _Nullable path, kInteger size) {
        if (finished) {
            self.trashView.scanState = CMScanStateScanEnd;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.trashView configureEndScanSize:size];
            });
        }
        else {
            self.trashView.scanState = CMScanStateScaning;
            if (!path) {
                [self.trashView configScaningPath:path];
            }
        }
    }];
    self.trashFolderPath = folderPath;
}

#pragma mark -- dataosurce & delegate

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return self.datasources.count;
} 

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    CMMainPageClassTCellView *cellView = [tableView makeViewWithIdentifier:NSStringFromClass([CMMainPageClassTCellView class]) owner:self];
    return cellView;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    CMMainPageClassTCellView *cellView = [tableView makeViewWithIdentifier:NSStringFromClass([CMMainPageClassTCellView class]) owner:self];
    cellView.titleTF.cell.title = self.datasources[row];
    return cellView;
}

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 30;
}

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row {
    [self updateCurRowAndView:row];
    return YES;
}

-(void)tableViewSelectionDidChange:(nonnull NSNotification *)notification{
    NSLog(@"didSelect：%@",notification.object);
}

#pragma mark -- custom method

- (void)updateCurRowAndView:(NSInteger)row {
    if (row >= self.datasourceDic.count) {
        return;
    }
    
    
    NSString *key = [self.datasources objectAtIndex:_curRow];
    [self.datasourceDic setValue:@(NO) forKey:key];
    [self.rightViews objectAtIndex:_curRow].hidden = YES;
    _curRow = row;
    NSString *newKey = [self.datasources objectAtIndex:_curRow];
    [self.datasourceDic setValue:@(YES) forKey:newKey];
    [self.rightViews objectAtIndex:_curRow].hidden = NO;
    
    
//    [self.classTableView reloadDataForRowIndexes:(nonnull NSIndexSet *) columnIndexes:<#(nonnull NSIndexSet *)#>];
}

@end
