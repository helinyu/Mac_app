//
//  CMTrashInfoDetailView.m
//  CleanMac
//
//  Created by Aka on 2020/1/17.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMTrashInfoDetailView.h"
#import "CMTrashInfoDetailLeftView.h"
#import "CMTrashInfoDetailRightView.h"
#import "CMFileInfoModel.h"

@interface CMTrashInfoDetailView ()

@property (nonatomic, strong) CMTrashInfoDetailLeftView *leftView;
@property (nonatomic, strong) CMTrashInfoDetailRightView *rightView;

@property (nonatomic, assign) NSInteger selectedIndex;

@end


// default selected first
kConstInterger(kDefaultSelectedIndex, 0);

kConstCGFloat(totalLength, 11.f);
kConstCGFloat(leftLength, 5.f);

@implementation CMTrashInfoDetailView

- (void)baseInit {
    [super baseInit];
    
    self.wantsLayer = YES;
    self.layer.backgroundColor = [NSColor greenColor].CGColor;
    
    _leftView = [CMTrashInfoDetailLeftView new];
    _rightView = [CMTrashInfoDetailRightView new];
    [self cm_addSubviews:@[_leftView, _rightView]];

    CGFloat ratio = leftLength/totalLength;
    [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.top.equalTo(self);
        make.right.equalTo(self).multipliedBy(ratio);
    }];
    _leftView.wantsLayer = YES;
    _leftView.layer.backgroundColor = [NSColor cyanColor].CGColor;
    
    [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self);
        make.left.equalTo(self.leftView.mas_right);
        make.bottom.lessThanOrEqualTo(self);
    }];
    _rightView.wantsLayer = YES;
    _rightView.layer.backgroundColor = [NSColor purpleColor].CGColor;
    
    _leftView.files = self.files;
    _rightView.files = self.files;
}

- (void)setFiles:(NSArray *)files {
    
    _files = files;
    
    _selectedIndex = kDefaultSelectedIndex;
    for (NSInteger index =0; index< files.count; index++) {
          CMFileInfoModel *fileItem = [files objectAtIndex:index];
          if (index == kDefaultSelectedIndex) {
              fileItem.isSelected = YES;
          }
          else {
              fileItem.isSelected = NO;
          }
      }

    _leftView.files = files;
   
    NSArray<CMFileInfoModel *> *rightFiles ;
    if (_selectedIndex < files.count) {
        CMFileInfoModel *curFileItem = [files objectAtIndex:_selectedIndex];
        rightFiles = curFileItem.sonFiles;
        for (CMFileInfoModel *fileItem in rightFiles) {
            fileItem.isSelected = YES;
        }
    }
    
    _rightView.files = rightFiles;
    
}

@end
