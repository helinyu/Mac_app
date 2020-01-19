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
#import <AppKit/NSDiffableDataSource.h> // 可能这个方法可以进行定义

@interface CMThirdViewController ()<NSComboBoxDataSource, NSComboBoxDelegate>

@property (nonatomic, strong) NSComboBox *comboBox;
//@property (nonatomic, strong) NSComboBoxCell *comboBoxCell; // cell不是这么用的， 是对view的内容绘制以及填充进行使用的

@property (nonatomic, strong) NSArray *datas;

@end

@implementation CMThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor grayColor].CGColor;
    
    [self test1];
    
//     看来是需要进行处理这个内容了， 这个内容看看要怎么样子处理比较好；写一个类似combo box的控件
//     使用button + tableView 实现； 应该是没有问题的
}

// 使用数据源和代理 (为什么只有一个呢? 可不可以有两个的选择？)
- (void)test1 {
    NSComboBox *comboBox = [[NSComboBox alloc] initWithFrame:NSMakeRect(50.f, 50.f, 100.f, 25.f)];
    comboBox.backgroundColor = [NSColor yellowColor];
    comboBox.numberOfVisibleItems = 2;
    self.datas = @[
        @"羊肉泡馍",
        @"油泼扯面",
        @"板栗烧鸡",
        @"豆腐花",
    ];
    comboBox.usesDataSource = YES;
    comboBox.dataSource = self;
    comboBox.delegate = self;
    [self.view addSubview:comboBox];
}

- (void)test0 {
    NSComboBox *comboBox = [[NSComboBox alloc] init];
    comboBox.hasVerticalScroller = YES;
    comboBox.intercellSpacing = CGSizeMake(10.f, 2.f);
    comboBox.itemHeight = 20.f;
    comboBox.numberOfVisibleItems = 4;
    comboBox.buttonBordered = NO;
    
    //     below which undefined //不知道这个干嘛的 标识改变的内容 , 好像也不是这样使用的
    //    [comboBox noteNumberOfItemsChanged];
    
    [self.view addSubview:comboBox];
    self.comboBox = comboBox;
    self.comboBox.placeholderString = @"请选择你的内容";
    [self.comboBox mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10.f);
        make.width.mas_equalTo(100.f);
        make.height.mas_equalTo(25.f);
        make.top.equalTo(self.view).offset(30.f);
    }];
    self.comboBox.backgroundColor = [NSColor greenColor];
    self.comboBox.textColor = [NSColor redColor];
    
    self.comboBox.dataSource = self;
    self.comboBox.usesDataSource = YES;
    self.comboBox.completes = YES;
    [self.comboBox reloadData];
    
    //    comboBox.usesDataSource = NO;// 表示不用代理的方式，这样直接在前面添加的方式
    //    上面这个属性决定了是走代理的数据源还是直接走这个数据源
    [self.comboBox addItemWithObjectValue:@"你好呀0"];
    [self.comboBox addItemWithObjectValue:@"你好呀1"];
    [self.comboBox addItemWithObjectValue:@"你好呀2"];
    [self.comboBox addItemWithObjectValue:@"你好呀3"];
    [self.comboBox addItemWithObjectValue:@"你好呀4"];
    
    // 这个时候上面的饿插入的方法就不会起到了作用
    
    //    comboBox.delegate = self;
    
    [self.comboBox setAction:@selector(onSelectedChanged:)];
}

- (void)onSelectedChanged:(NSComboBox *)sender {
    NSComboBox *comboBox = sender;
        
        NSInteger selectedIndex = comboBox.indexOfSelectedItem;
        
        NSString *selectedContent = comboBox.stringValue;
        
        NSLog(@"selectedContent %@ at index %ld",selectedContent,selectedIndex);
}

#pragma mark -- combox delegate

//FIXME: 看看有关的饿选择问题
// 我们在点击选择的时候会调用到
- (void)comboBoxWillPopUp:(NSNotification *)notification {
    NSLog(@"lt - comboBoxWillPopUp");
}

- (void)comboBoxWillDismiss:(NSNotification *)notification {
    NSLog(@"lt - comboBoxWillDismiss");
}

- (void)comboBoxSelectionDidChange:(NSNotification *)notification {
    NSLog(@"lt - comboBoxSelectionDidChange");
}

- (void)comboBoxSelectionIsChanging:(NSNotification *)notification {
    NSLog(@"lt - comboBoxSelectionIsChanging");
}

#pragma mark - dataosurce
//* These two methods are required when not using bindings */
#pragma mark - NSComboBoxDataSource

- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox {
    return [self.datas count];
}

- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index {
    return self.datas[index];
}


//- (NSUInteger)comboBox:(NSComboBox *)comboBox indexOfItemWithStringValue:(NSString *)string {
//
//}

//- (nullable NSString *)comboBox:(NSComboBox *)comboBox completedString:(NSString *)string {
//
//}

@end
