//
//  CMUpdateProgramView.m
//  CleanMac
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/7/17 20:12 .
//  Copyright © 2019 Aka. All rights reserved.
//  xcode 10.15 .
//
    

#import "CMUpdateProgramView.h"
#import "CMRightLogoBaseView.h"
#import "CMRightItemView.h"
#import <Masonry.h>
#import <PushKit/PushKit.h>

@interface CMUpdateProgramView ()

@end

@implementation CMUpdateProgramView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.rightLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self).multipliedBy(3.f/2);
            make.centerY.equalTo(self);
            make.width.height.mas_equalTo(100.f);
        }];
        
        [self.firstItemView configImgName:@"icon_trash_dustbin" title:@"立即倾倒所有垃圾" desc:@"无需浏览所有的驱动器和应用查找它们的废纸篓"];
        [self.secondItemView configImgName:@"icon_finder" title:@"避免各种\"访达\"错误" desc:@"确保倾倒您的废纸篓,不管是否有任何问题"];
    }
    return self;
}

@end
