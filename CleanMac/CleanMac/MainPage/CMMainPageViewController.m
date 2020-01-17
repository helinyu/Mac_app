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

#import "CMMainPageClassTCellView.h"
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
#import "XNRightTrashGradientView.h"
#import "XNLeftTrashGradientView.h"
#import "CMScanView.h"
#import "CMScanContentView.h"

#import "NSButton+CMAdd.h"

#import "CMFileManger.h"
#import "CMTrashManger.h"

#define Create_right_view(cls) ([self createRightViewWithClass:[cls new]])

kConstCGFloat(kClassWidth, 150.f);
kConstCGFloat(kBottomViewH, 30.f);
kConstCGFloat(kScanViewH, 60.f);

@interface CMMainPageViewController ()<NSTableViewDataSource, NSTableViewDelegate, CMScanViewDelegate>

@property (nonatomic, strong) XNRightTrashGradientView *rightTrashGradientView;
@property (nonatomic, strong) XNLeftTrashGradientView *leftTrashGradientView;

@property (nonatomic, strong) CMScanView *scanView;


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
    
    self.view.layer = [CALayer layer];
    self.view.layer.backgroundColor = [NSColor redColor].CGColor;
    _leftTrashGradientView = [XNLeftTrashGradientView new];
    [self.view addSubview:_leftTrashGradientView positioned:NSWindowBelow relativeTo:self.view];
    _rightTrashGradientView = [XNRightTrashGradientView new];
    [self.view addSubview:_rightTrashGradientView positioned:NSWindowBelow relativeTo:self.view];
    [_leftTrashGradientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view);
        make.width.mas_equalTo(kClassWidth);
        make.bottom.equalTo(self.view).offset(-kBottomViewH);
    }];
    
    [_rightTrashGradientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-kBottomViewH);
        make.left.equalTo(self.leftTrashGradientView.mas_right);
    }];
    
    self.datasourceDic = [CMFileManger getMainClassInfoDic];
    self.datasources = [CMFileManger getMainClassInfos];
    [self.classTableView reloadData];
    self.classTableView.layer.backgroundColor = [NSColor clearColor].CGColor;
    self.classTableView.backgroundColor = [NSColor redColor];
    self.classTableView.layer.borderColor = [NSColor clearColor].CGColor;
    self.classTableView.layer.borderWidth = CGFLOAT_MIN;
    self.classTableView.headerView = [[NSTableHeaderView alloc] initWithFrame:CGRectMake(0.f, 0.f, CGFLOAT_MIN, CGFLOAT_MIN)];
    if (@available(macOS 10.12, *)) {
        self.classTableView.enclosingScrollView.borderType = NSTabViewBorderTypeNone;
    } else {
        // Fallback on earlier versions
    }
    
    self.classTableView.backgroundColor = [NSColor redColor];
    self.view.layer.backgroundColor = [NSColor yellowColor].CGColor;
    
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
    
    [self initScanView];
    
}

- (void)dataInit {
    //    NSArray*volumes =[[CMFileManger single] mountedVolumefileURls]; // 加载的券的内容
    //    NSLog(@"volumes :%@",volumes);
    
    NSArray *contents = [[CMFileManger single]  fileUrls];
    //    NSLog(@"contents :%@",contents);
    
    NSArray *trashFiles = [[CMFileManger single]  trashFiles];
    //    NSLog(@"trashFiles :%@",trashFiles);
}

- (void)initScanView {
    _scanView = [CMScanView new];
    [self.view addSubview:_scanView];
    [_scanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view.mas_centerX).offset(-kScanViewH/2.f);
    }];
    _scanView.scanViewDelegate = self;
    
    //     block/delegate for some action
}

- (id)createRightViewWithClass:(NSView *)rightView {
    [self.view addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-kBottomViewH);
        make.left.equalTo(self.classTableView.mas_right);
    }];
    return rightView;
}

#pragma mark -- method

- (void)bindInit {
    
    __weak typeof (self) weakSelf = self;
    _trashView.actionScanBlock = ^(NSInteger scanState) {
        [weakSelf onTrashActionWithState:scanState];
    };
}

#pragma mark - trash View deal with

- (void)onTrashActionWithState:(CMScanState)scanState {
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

#warning -- 如何设置左边的列表的大小以及各种距离

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
    
}


#pragma mark -- scan

- (void)onScanCurSelectedCategory {
    
}

@end

@implementation CMMainPageViewController (ScanView)

- (void)scanView:(id)view actionType:(CMScanViewType)actionType {
    if (view == self.scanView && actionType == CMScanViewTypeScanTap) {
        [self onScanCurSelectedCategory];
    }
}

@end
