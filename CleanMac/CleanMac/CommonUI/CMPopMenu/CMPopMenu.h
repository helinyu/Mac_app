//
//  CMPopMenu.h
//  CleanMac
//
//  Created by Aka on 2020/1/20.
//  Copyright © 2020 Aka. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMPopMenuItemModel : NSObject

@property (nonatomic, assign) NSInteger keyInt; // 0 ~99
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger isOn;

@end

@interface CMPopMenuCategoryModel: NSObject

@property (nonatomic, assign) NSInteger keyInt; // 0 ~9  可以作为一个前缀 00 ~900
@property (nonatomic, strong) NSArray<CMPopMenuItemModel *> *menuItems;

// 同一个分类，它的这个肯定是一样的
@property (nonatomic, copy) NSString *onImageName;
@property (nonatomic, copy) NSString *offImageName;
@property (nonatomic, copy) NSString *mixedImageName;

@end

kConstString(kTitle, @"title");
kConstString(kRightIconName, @"rightIconName");
kConstString(kOnImageName, @"onImageName");
kConstString(kOffImageName, @"offImageName");
kConstString(kMixedImageName, @"mixedImageName");
kConstString(kCategories, @"categories");
kConstString(kKeyInt, @"keyint");
kConstString(kItems, @"items");
kConstString(kItemKeyValue, @"item.key.value");
kConstString(kIsOn, @"is.on");
kConstString(kIsMixed, @"is.mixed");


@protocol CMPopMenuProtocol <NSObject>

- (void)popMenu:(id)popMenu didSelectedIndexPath:(NSIndexPath *)indexPath;

@end

@interface CMPopMenu : NSButton

@property (nonatomic, strong, readonly) NSArray *categories;

@property (nonatomic, assign) NSInteger ratioValue;

@property (nonatomic, weak) id<CMPopMenuProtocol> popMenuDelegate;

///
/// @param info NSDiction
/// {ttitle:@"",iconName , @"rightIconName": @[@{item0},@{item1}]}
/// @param view  parentView
+ (CMPopMenu *)createMenuWithInfo:(NSDictionary *)info onView:(NSView *)view;
+ (CMPopMenu *)createMenuTitle:(NSString *)title rightIcon:(NSString *)rightIconName categories:(NSArray<CMPopMenuCategoryModel *> *)categories onView:(NSView *)view;

- (void)updateTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
