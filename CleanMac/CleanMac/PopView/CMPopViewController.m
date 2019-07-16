//
//  CMPopViewController.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/15 20:28 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMPopViewController.h"
#import <Masonry.h>
#import "CMTopClassCItem.h"
#import "CMPopHeaderView.h"
#import "CMPopFooterView.h"

//static CGFloat kViewWidth = 400.f;
//static CGFloat kViewHeight = 500.f;
static CGFloat kItemWidth = 200.f;
static CGFloat kItemHeight = 100.f;

@interface CMPopViewController ()<NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSImageView *imgView;
@property (weak) IBOutlet NSCollectionView *collectionView;

@end

@implementation CMPopViewController


- (void)viewDidLoad {
    [super viewDidLoad];

  

    [self viewInit];
}


- (void)viewInit {
    NSCollectionViewFlowLayout *flowLayout = [NSCollectionViewFlowLayout new];
    _collectionView.collectionViewLayout = flowLayout;
    _collectionView.maxItemSize = CGSizeMake(kItemWidth, kItemHeight);
    _collectionView.minItemSize = CGSizeMake(60.f, 60.f);
    flowLayout.minimumInteritemSpacing = 0.f;
    flowLayout.minimumLineSpacing = 0.f;
    [_collectionView registerClass:[CMTopClassCItem class] forItemWithIdentifier:NSStringFromClass([CMTopClassCItem class])];
    [_collectionView registerClass:[CMPopHeaderView class] forSupplementaryViewOfKind:NSCollectionElementKindSectionHeader withIdentifier:NSStringFromClass([CMPopHeaderView class])];
    [_collectionView registerClass:[CMPopFooterView class] forSupplementaryViewOfKind:NSCollectionElementKindSectionFooter withIdentifier:NSStringFromClass([CMPopFooterView class])];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
//    CALayer *viewLayer = [CALayer layer];
//    viewLayer.frame = _collectionView.bounds;
//    viewLayer.backgroundColor = [NSColor redColor].CGColor;
//    _collectionView.layer = viewLayer;
//    [_collectionView setNeedsDisplay:YES];
}

#pragma mark -- collectionview datasource

- (NSInteger)numberOfSectionsInCollectionView:(NSCollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section API_AVAILABLE(macos(10.11)) {
    return 8;
}

- (NSSize)collectionView:(NSCollectionView *)collectionView layout:(NSCollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return NSMakeSize(kItemWidth -1, kItemHeight -1);
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath API_AVAILABLE(macos(10.11)) {
    CMTopClassCItem *item = [collectionView makeItemWithIdentifier:NSStringFromClass([CMTopClassCItem class]) forIndexPath:indexPath];
    return item;
}

- (NSSize)collectionView:(NSCollectionView *)collectionView layout:(NSCollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return NSMakeSize(self.view.bounds.size.width, 40.f);
}

- (NSSize)collectionView:(NSCollectionView *)collectionView layout:(NSCollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return NSMakeSize(self.view.bounds.size.width, 60.f);
}

- (NSView *)collectionView:(NSCollectionView *)collectionView viewForSupplementaryElementOfKind:(NSCollectionViewSupplementaryElementKind)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:NSCollectionElementKindSectionHeader]) {
        CMPopHeaderView *headerView = [collectionView makeSupplementaryViewOfKind:kind withIdentifier:NSStringFromClass([CMPopHeaderView class]) forIndexPath:indexPath];
        return headerView;
    }
    else {
        CMPopFooterView *footerView = [collectionView makeSupplementaryViewOfKind:kind withIdentifier:NSStringFromClass([CMPopFooterView class]) forIndexPath:indexPath];
        return footerView;
    }
}

@end
