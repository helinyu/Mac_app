//
//  CMPopMenu.m
//  CleanMac
//
//  Created by Aka on 2020/1/20.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMPopMenu.h"

@implementation CMPopMenuItemModel

@end

@implementation CMPopMenuCategoryModel

@end

@interface CMPopMenu ()<NSMenuItemValidation>

@property (nonatomic, strong) NSArray<CMPopMenuCategoryModel *> *categories;
@property (nonatomic, strong) NSMenu *systemMenu;

@property (nonatomic, strong) NSView *parentView;

@end

@implementation CMPopMenu

+ (CMPopMenu *)createMenuWithInfo:(NSDictionary *)info onView:(NSView *)view {
    NSString *title = [info objectForKey:kTitle];
    NSString *rightIconName = [info objectForKey:kRightIconName];
    
    NSMutableArray<CMPopMenuCategoryModel *> *mCategories = [NSMutableArray new];
    NSArray *categories = [info objectForKey:kCategories];
    if(categories.count >0) {
        for (NSInteger index=0; index < categories.count; index++) {
            NSDictionary *categoryItemDict = [categories objectAtIndex:index];
            CMPopMenuCategoryModel *categoryItem = [CMPopMenuCategoryModel new];
            categoryItem.onImageName = [categoryItemDict objectForKey:kOnImageName];
            categoryItem.offImageName = [categoryItemDict objectForKey:kOffImageName];
            categoryItem.mixedImageName = [categoryItemDict objectForKey:kMixedImageName];
            categoryItem.keyInt = index;
            NSMutableArray *mItems = [NSMutableArray new];
            NSArray *items = [categoryItemDict objectForKey:kItems];
            for (NSInteger indexJ =0; indexJ <items.count; indexJ++) {
                NSDictionary *itemDict = [items objectAtIndex:indexJ];
                CMPopMenuItemModel *menuItem = [CMPopMenuItemModel new];
                menuItem.title = [itemDict objectForKey:kTitle];
                menuItem.keyInt = indexJ;
                menuItem.isOn = [[itemDict objectForKey:kIsOn] boolValue];
                [mItems addObject:menuItem];
            }
            categoryItem.menuItems = mItems;
            [mCategories addObject:categoryItem];
        }
    }
    
    return [self createMenuTitle:title rightIcon:rightIconName categories:mCategories onView:view];
}

+ (CMPopMenu *)createMenuTitle:(NSString *)title rightIcon:(NSString *)iconName categories:(NSArray<CMPopMenuCategoryModel *> *)categories onView:(NSView *)view {
    CMPopMenu *menu = [CMPopMenu new];
    [menu initWithTitle:title rightIcon:iconName categories:categories];
    menu.parentView = view;
    return menu;
}

- (void)initWithTitle:(NSString *)title rightIcon:(NSString *)iconName categories:(NSArray<CMPopMenuCategoryModel *> *)categories {
    
    self.title = title;
    self.image = [NSImage imageNamed:iconName];
    self.imagePosition = NSImageRight;
    self.bezelStyle = NSBezelStyleShadowlessSquare;
    self.action = @selector(onPopMenuAction:);
    self.target = self;
    self.categories = categories;
}

- (void)onPopMenuAction:(CMPopMenu *)menu {
    if (self.categories.count <=0) {
        return;
    }
    
    [self createSystemMenu];
    
    CGPoint point = self.frame.origin;
    point.x = point.x + (self.frame.size.width - self.systemMenu.size.width)/2.f;

    [self.systemMenu popUpMenuPositioningItem:nil atLocation:point inView:self.parentView];
    return;
}

- (void)createSystemMenu {
    
    if (self.systemMenu) {
        return;
    }
    NSMenu *systemMenu = [NSMenu new];
    for (NSInteger index = 0; index< self.categories.count; index++) {
        if (index >0) {
            [systemMenu addItem:[NSMenuItem separatorItem]];
        }
        
        CMPopMenuCategoryModel *categoryItem = [self.categories objectAtIndex:index];
        NSImage *onImg = [NSImage imageNamed:categoryItem.onImageName];
        NSImage *offImg = [NSImage imageNamed:categoryItem.offImageName];
        NSImage *mixedImg = [NSImage imageNamed:categoryItem.mixedImageName];
        NSInteger categoryKeyInt = categoryItem.keyInt;
        
        if (categoryItem.menuItems.count <=0) {
            continue;
        }
        
        for (NSInteger iIndex = 0; iIndex <categoryItem.menuItems.count; iIndex++) {
            CMPopMenuItemModel *menuItemM = [categoryItem.menuItems objectAtIndex:iIndex];
            NSMenuItem *menuItem = [NSMenuItem new];
            menuItem.title = menuItemM.title;
            menuItem.onStateImage = onImg;
            menuItem.offStateImage = offImg;
            menuItem.mixedStateImage = mixedImg;
            menuItem.tag = categoryKeyInt *100 + menuItemM.keyInt;
            menuItem.action = @selector(onMenuItemSelected:);
            menuItem.state = (NSInteger) menuItemM.isOn;
            [systemMenu addItem:menuItem];
        }
    }
    self.systemMenu = systemMenu;
}

- (void)onMenuItemSelected:(NSMenuItem *)menuItem {
    
    NSInteger tag = menuItem.tag;
    NSInteger intVal = tag / self.ratioValue;
    NSInteger leftVal = tag % self.ratioValue;
    NSArray<NSMenuItem *> *items = self.systemMenu.itemArray;
    for (NSMenuItem *item in items) {
        NSInteger curVal = item.tag / self.ratioValue;
        if (curVal == intVal) {
            item.state = NSControlStateValueOff;
        }
    }
    menuItem.state = NSControlStateValueOn;
 
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:leftVal inSection:intVal];
//    回调回去
    if ([self.popMenuDelegate respondsToSelector:@selector(popMenu:didSelectedIndexPath:)]) {
        [self.popMenuDelegate popMenu:self didSelectedIndexPath:indexPath];
    }
}

- (NSInteger)ratioValue {
    if (_ratioValue <10) {
        return 100;
    }
    
    return _ratioValue;
}

- (void)updateTitle:(NSString *)title {
    self.title = title;
}


- (BOOL)validateMenuItem:(NSMenuItem *)menuItem {
    return YES;
}

@end
