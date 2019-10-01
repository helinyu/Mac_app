//
//  FXView.m
//  testControl
//
//  Created by Aka on 2019/10/1.
//  Copyright © 2019 Aka. All rights reserved.
//

#import "FXView.h"

@interface FXView ()<NSTextFieldDelegate>

@end

@implementation FXView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initBase];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initBase];
    }
    return self;
}

- (void)initBase {
    _textField = [NSTextField new];
    [self addSubview:_textField];
    _textField.frame = NSMakeRect(0.f, 0.f, 100.f, 40.f);
    _textField.cell.title = @"test";
    _textField.backgroundColor = [NSColor redColor];
    _textField.delegate = self;
}

- (void)scrollWheel:(NSEvent *)event {
    NSLog(@"lt-  ;%@ ， event :%@", self,event);
}

#pragma mark -- textfield delegate

- (BOOL)textField:(NSTextField *)textField textView:(NSTextView *)textView shouldSelectCandidateAtIndex:(NSUInteger)index API_AVAILABLE(macos(10.12.2)) {
    NSLog(@"lt- text filed ;%@, textView ;%@, index: %zd",textField, textView, index);
    return YES;
}

- (void)controlTextDidBeginEditing:(NSNotification *)obj {
    
}
- (void)controlTextDidEndEditing:(NSNotification *)obj {
    
}
- (void)controlTextDidChange:(NSNotification *)obj {
    if (obj.object == _textField) {
//        NSLog(@"lt- %@",_textField.cell.title);
    }
}

// These delegate and notification methods are sent from NSControl subclasses that allow text editing such as NSTextField and NSMatrix.  The classes that need to send these have delegates.  NSControl does not.
- (BOOL)control:(NSControl *)control textShouldBeginEditing:(NSText *)fieldEditor {
    return YES;
}
- (BOOL)control:(NSControl *)control textShouldEndEditing:(NSText *)fieldEditor {
    return YES;
}
- (BOOL)control:(NSControl *)control didFailToFormatString:(NSString *)string errorDescription:(nullable NSString *)error {
    return YES;
}
- (void)control:(NSControl *)control didFailToValidatePartialString:(NSString *)string errorDescription:(nullable NSString *)error {
//    NSLog(@"lt- string ;%@", string);
}
- (BOOL)control:(NSControl *)control isValidObject:(nullable id)obj {
    return YES;
}

- (BOOL)control:(NSControl *)control textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector {
    NSLog(@"lt- 特殊按键");
    if (commandSelector == @selector(insertNewline:)) {
        NSLog(@"lt- insert new line ;%zd",commandSelector);
//         相应不同的内容， 不用的操作处理；
        return YES;
    }
    else if (commandSelector == @selector(deleteForward:)) {
        NSLog(@"lt- dleete :%zd",commandSelector);
        return YES;
    }
    else if (commandSelector == @selector(deleteBackward:)) {
        NSLog(@"lt- delete backward ;%zd",commandSelector);
    }
    else if (commandSelector == @selector(insertTab:)) {
        NSLog(@"lt- 点击了tab按键", commandSelector);
    }
    else if (commandSelector == @selector(cancelOperation:)) {
        NSLog(@"lt- 取消：%zd",commandSelector);
    }
    return NO;
}

- (NSArray<NSString *> *)control:(NSControl *)control textView:(NSTextView *)textView completions:(NSArray<NSString *> *)words forPartialWordRange:(NSRange)charRange indexOfSelectedItem:(NSInteger *)index {
    return @[];
}


@end
