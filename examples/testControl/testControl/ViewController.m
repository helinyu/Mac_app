//
//  ViewController.m
//  testControl
//
//  Created by Aka on 2019/10/1.
//  Copyright © 2019 Aka. All rights reserved.
//

#import "ViewController.h"
#import "FXTextView.h"
#import "FXButton.h"


@interface ViewController ()<NSTextViewDelegate, NSTextStorageDelegate, NSSearchFieldDelegate>

@property (unsafe_unretained) IBOutlet FXTextView *textView;
@property (weak) IBOutlet NSSearchField *searchField;
@property (weak) IBOutlet NSTextField *textLabel;
@property (weak) IBOutlet NSButton *singleRadio;

@property (nonatomic, strong) NSSegmentedControl *segmentedControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self initTextView];
//    [self initSearchField];
//    [self initLabel];
//    [self initButton];
//    [self initCheckBox];
//    [self initRadio];
//    [self initSegmentalControl];
//    [self initComboBox];
    [self initPopUpBtn];
    
}

- (void)initPopUpBtn {
    
}

- (void)initComboBox {
    
}

#pragma mark -- 分段选择器——————————

- (IBAction)onSegmentControlClicked:(NSSegmentedControl *)sender {
    NSLog(@"lt- segment control :%zd",sender.indexOfSelectedItem);
}

- (void)initSegmentalControl {
    _segmentedControl = [[NSSegmentedControl alloc] initWithFrame:NSMakeRect(300.f, 200.f, 200.f, 200.f)];
    _segmentedControl.layer = [CALayer layer];
    _segmentedControl.layer.backgroundColor = [NSColor purpleColor].CGColor;
    [self.view addSubview:_segmentedControl];
    _segmentedControl.segmentCount = 3;
    
}

#pragma mark -- 单选框——————————+——

- (IBAction)onRadioClicked:(NSButton *)sender {
    NSLog(@"lt- radio :%@",sender);
}

- (IBAction)onSenderClicked:(NSButtonCell *)sender {
    
}

- (void)initRadio {
    
    self.singleRadio.allowsMixedState = YES;
}

#pragma mark -- 复选框 ——————————————————————
// 允许多个选项同时选择的按钮控件，对应的类NSButton
- (void)initCheckBox {
    
}

- (IBAction)onCheckboxAction:(NSButton *)sender {
    if (sender.state == NSControlStateValueOn) {
        NSLog(@"lt- check is selected");
    }
    else {
        NSLog(@"lt- check un selected");
    }
    NSLog(@"lt- selected state; %zd, sender tag :%zd",sender.state, sender.tag);
}

#pragma mark -- NSButton ——————————————————————

- (IBAction)buttonClicked:(id)sender {
    NSLog(@"lt- button clicked");
}

// 代码创建按钮
- (void)initButton {
    NSButton *btn = [[NSButton alloc] initWithFrame:NSMakeRect(0.f, 0.f, 150, 120.f)];
    btn.bezelStyle = NSBezelStyleRounded;
    btn.image = [NSImage imageNamed:@"Snip20191002_52"];
    btn.imageScaling = NSImageScaleAxesIndependently;
    btn.target = self;
    btn.action = @selector(buttonClicked:);
    [self.view addSubview:btn];
}

#pragma mark -- label ————————————————————————

- (void)initLabel {
    _textLabel.maximumNumberOfLines = 0;
    
    NSString *text = @"please visit http://www.apple.com";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSString *linkURLText = @"http://www.apple.com";
    NSURL *linkURL = [NSURL URLWithString:linkURLText];
    
//    查找字符串的范围
    NSRange selectedRange = [text rangeOfString:linkURLText];
    
    [attributedString beginEditing];
    
//    设置连接属性
    [attributedString addAttribute:NSLinkAttributeName value:linkURL range:selectedRange];
//    设置文字颜色
    [attributedString addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:selectedRange];
    
//    设置下划线
    [attributedString addAttributes:@{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)} range:selectedRange];
    [attributedString endEditing];
    
    _textLabel.frame = CGRectMake(200.f, 100.f, 200,200.f);
    _textLabel.editable = NO;
    _textLabel.bezeled = NO;
    _textLabel.drawsBackground = NO;
    _textLabel.attributedStringValue = attributedString;
    
}

#pragma mark -- search field ————————————————————————————-

- (void)initSearchField {
    _searchField.delegate = self;
    _searchField.backgroundColor = [NSColor blueColor];
    [self registerSearchButtonAction];
}

- (void)registerSearchButtonAction {
    NSSearchFieldCell *searchButtonCell = self.searchField.cell;
    NSButtonCell *searchButtonActionCell = searchButtonCell.searchButtonCell;
    searchButtonActionCell.target = self;
    searchButtonActionCell.action = @selector(onSearchAction:);
    
    NSSearchFieldCell *cancelButtonCell = self.searchField.cell;
    NSButtonCell *cancelButtonActionCell = cancelButtonCell.cancelButtonCell;
    cancelButtonActionCell.target = self;
    cancelButtonActionCell.action= @selector(cancelButtonAction:);
}

- (void)onSearchAction:(id)sender {
    NSLog(@"lt- search button aciotn");
}

- (void)cancelButtonAction:(id)sender {
    NSLog(@"lt- cancel button action: %@",sender);
}

// 点击搜索，触发了两次，这个NSSeachField 不应该增加这些动作
- (IBAction)onSearchOutlineAction:(id)sender {
    NSLog(@"lt- sender :%@",sender);
    NSSearchField *searchField = (NSSearchField *)sender;
}

//- (IBAction)onSearchAction:(NSSearchField *)sender {
//
////    NSLog(@"lt- sender :%@",sender.stringValue);
//}

#pragma mark -- search delegate

- (void)searchFieldDidStartSearching:(NSSearchField *)sender API_AVAILABLE(macos(10.11)) {
//    NSLog(@"lt- searchFieldDidStartSearching ;%@",sender);
}

- (void)searchFieldDidEndSearching:(NSSearchField *)sender API_AVAILABLE(macos(10.11)) {
//    NSLog(@"lt- searchFieldDidEndSearching ;%@",sender);
}


#pragma mark - text view content ——————————————————————————————————————————————————

- (void)initTextView {
    _textView.delegate = self;
    _textView.textStorage.delegate = self;
    //    _textView.backgroundColor = [NSColor redColor];
    _textView.textColor = [NSColor greenColor];

    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"attributedString"];
    [attributedString addAttributes:@{NSForegroundColorAttributeName: [NSColor blueColor]} range:NSMakeRange(0.f, 10)];
    [attributedString addAttributes:@{NSForegroundColorAttributeName: [NSColor greenColor]} range:NSMakeRange(10, 6)];
    [_textView.textStorage setAttributedString:attributedString];
}


#pragma mark -- text storage delegate

// Sent inside -processEditing right before fixing attributes.  Delegates can change the characters or attributes.
- (void)textStorage:(NSTextStorage *)textStorage willProcessEditing:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta API_AVAILABLE(macos(10.11), ios(7.0), tvos(9.0)) {
    NSLog(@"lt- willProcessEditing store:%@",textStorage);
}

// Sent inside -processEditing right before notifying layout managers.  Delegates can change the attributes.
- (void)textStorage:(NSTextStorage *)textStorage didProcessEditing:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta API_AVAILABLE(macos(10.11), ios(7.0), tvos(9.0)) {
    NSLog(@"lt- didProcessEditing store:%@",textStorage);
//     可以在这里实现控件自适应
}

#pragma mark -- textview delegate

// Delegate only.
- (BOOL)textView:(NSTextView *)textView clickedOnLink:(id)link atIndex:(NSUInteger)charIndex {
    return YES;
}

// Delegate only.
- (void)textView:(NSTextView *)textView clickedOnCell:(id <NSTextAttachmentCell>)cell inRect:(NSRect)cellFrame atIndex:(NSUInteger)charIndex {
    NSLog(@" clicked on cell ;%zd",charIndex);
}

// Delegate only.
- (void)textView:(NSTextView *)textView doubleClickedOnCell:(id <NSTextAttachmentCell>)cell inRect:(NSRect)cellFrame atIndex:(NSUInteger)charIndex {
    NSLog(@"lt- double clicked on cell :%zd",charIndex);
}

// Delegate only.  Allows the delegate to take over attachment dragging altogether.
- (void)textView:(NSTextView *)view draggedCell:(id <NSTextAttachmentCell>)cell inRect:(NSRect)rect event:(NSEvent *)event atIndex:(NSUInteger)charIndex {
    NSLog(@"lt- dragged cell :%zd",charIndex);
}

// Delegate only.  If the previous method is not used, this method and the next allow the textview to take care of attachment dragging and pasting, with the delegate responsible only for writing the attachment to the pasteboard.  In this method, the delegate should return an array of types that it can write to the pasteboard for the given attachment.
- (NSArray<NSPasteboardType> *)textView:(NSTextView *)view writablePasteboardTypesForCell:(id<NSTextAttachmentCell>)cell atIndex:(NSUInteger)charIndex {
    return @[];
}

// Delegate only.  In this method, the delegate should attempt to write the given attachment to the pasteboard with the given type, and return success or failure.
- (BOOL)textView:(NSTextView *)view writeCell:(id<NSTextAttachmentCell>)cell atIndex:(NSUInteger)charIndex toPasteboard:(NSPasteboard *)pboard type:(NSPasteboardType)type {
    return YES;
}

// Delegate only.  Will not be called if textView:willChangeSelectionFromCharacterRanges:toCharacterRanges: is implemented.  Effectively prevents multiple selection.
//- (NSRange)textView:(NSTextView *)textView willChangeSelectionFromCharacterRange:(NSRange)oldSelectedCharRange toCharacterRange:(NSRange)newSelectedCharRange;

// Delegate only.  Supersedes textView:willChangeSelectionFromCharacterRange:toCharacterRange:.  Return value must be a non-nil, non-empty array of objects responding to rangeValue.
//- (NSArray<NSValue *> *)textView:(NSTextView *)textView willChangeSelectionFromCharacterRanges:(NSArray<NSValue *> *)oldSelectedCharRanges toCharacterRanges:(NSArray<NSValue *> *)newSelectedCharRanges {
//    return @[];
//}

// Delegate only.  Supersedes textView:shouldChangeTextInRange:replacementString:.  The affectedRanges argument obeys the same restrictions as selectedRanges, and the replacementStrings argument will either be nil (for attribute-only changes) or have the same number of elements as affectedRanges.
- (BOOL)textView:(NSTextView *)textView shouldChangeTextInRanges:(NSArray<NSValue *> *)affectedRanges replacementStrings:(nullable NSArray<NSString *> *)replacementStrings {
    return YES;
}

// Delegate only.  The delegate should return newTypingAttributes to allow the change, oldTypingAttributes to prevent it, or some other dictionary to modify it.
- (NSDictionary<NSAttributedStringKey, id> *)textView:(NSTextView *)textView shouldChangeTypingAttributes:(NSDictionary<NSString *, id> *)oldTypingAttributes toAttributes:(NSDictionary<NSAttributedStringKey, id> *)newTypingAttributes {
    return nil;
}

- (void)textViewDidChangeSelection:(NSNotification *)notification {
    NSLog(@"lt- textViewDidChangeSelection:%@", notification);
}

- (void)textViewDidChangeTypingAttributes:(NSNotification *)notification {
    NSLog(@"lt- textViewDidChangeTypingAttributes; %@ ", notification);
}

// Delegate only.  Allows delegate to modify the tooltip that will be displayed from that specified by the NSToolTipAttributeName, or to suppress display of the tooltip (by returning nil).
- (nullable NSString *)textView:(NSTextView *)textView willDisplayToolTip:(NSString *)tooltip forCharacterAtIndex:(NSUInteger)characterIndex {
    return nil;
}

// Delegate only.  Allows delegate to modify the list of completions that will be presented for the partial word at the given range.  Returning nil or a zero-length array suppresses completion.  Optionally may specify the index of the initially selected completion; default is 0, and -1 indicates no selection.
//- (NSArray<NSString *> *)textView:(NSTextView *)textView completions:(NSArray<NSString *> *)words forPartialWordRange:(NSRange)charRange indexOfSelectedItem:(nullable NSInteger *)index {
//    return @[];
//}

// Delegate only.  If characters are changing, replacementString is what will replace the affectedCharRange.  If attributes only are changing, replacementString will be nil.  Will not be called if textView:shouldChangeTextInRanges:replacementStrings: is implemented.
- (BOOL)textView:(NSTextView *)textView shouldChangeTextInRange:(NSRange)affectedCharRange replacementString:(nullable NSString *)replacementString {
    return YES;
}

- (BOOL)textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector {
    return YES;
}

// Delegate only.  Allows delegate to control the setting of spelling and grammar indicators.  Values are those listed for NSSpellingStateAttributeName.
//- (NSInteger)textView:(NSTextView *)textView shouldSetSpellingState:(NSInteger)value range:(NSRange)affectedCharRange API_AVAILABLE(macos(10.5));

// Delegate only.  Allows delegate to control the context menu returned by menuForEvent:.  The menu parameter is the context menu NSTextView would otherwise return; charIndex is the index of the character that was right-clicked.
- (nullable NSMenu *)textView:(NSTextView *)view menu:(NSMenu *)menu forEvent:(NSEvent *)event atIndex:(NSUInteger)charIndex API_AVAILABLE(macos(10.5)) {
    return nil;
}

// Delegate only.  Called by checkTextInRange:types:options:, this method allows control over text checking options (via the return value) or types (by modifying the flags pointed to by the inout parameter checkingTypes).
- (NSDictionary<NSTextCheckingOptionKey, id> *)textView:(NSTextView *)view willCheckTextInRange:(NSRange)range options:(NSDictionary<NSTextCheckingOptionKey, id> *)options types:(NSTextCheckingTypes *)checkingTypes API_AVAILABLE(macos(10.6)) {
    return nil;
}

// Delegate only.  Called by handleTextCheckingResults:forRange:orthography:wordCount:, this method allows observation of text checking, or modification of the results (via the return value).
- (NSArray<NSTextCheckingResult *> *)textView:(NSTextView *)view didCheckTextInRange:(NSRange)range types:(NSTextCheckingTypes)checkingTypes options:(NSDictionary<NSTextCheckingOptionKey, id> *)options results:(NSArray<NSTextCheckingResult *> *)results orthography:(NSOrthography *)orthography wordCount:(NSInteger)wordCount API_AVAILABLE(macos(10.6)) {
    return nil;
}

// Returns an URL representing the document contents for textAttachment.  The returned NSURL object is utilized by NSTextView for providing default behaviors involving text attachments such as Quick Look and double-clicking.  -[NSTextView quickLookPreviewableItemsInRanges:] uses this method for mapping text attachments to their corresponding document URLs.  NSTextView invokes -[NSWorkspace openURL:] with the URL returned from this method when the delegate has no -textView:doubleClickedOnCell:inRect:atPoint: implementation.
- (nullable NSURL *)textView:(NSTextView *)textView URLForContentsOfTextAttachment:(NSTextAttachment *)textAttachment atIndex:(NSUInteger)charIndex API_AVAILABLE(macos(10.7)) {
    return nil;
}

// Delegate only. Returns a sharing service picker created for items right before shown to the screen inside -orderFrontSharingServicePicker: method. The delegate specify a delegate for the NSSharingServicePicker instance. Also, it is allowed to return its own NSSharingServicePicker instance instead.
- (nullable NSSharingServicePicker *)textView:(NSTextView *)textView willShowSharingServicePicker:(NSSharingServicePicker *)servicePicker forItems:(NSArray *)items API_AVAILABLE(macos(10.8)) {
    return nil;
}

- (nullable NSUndoManager *)undoManagerForTextView:(NSTextView *)view {
    return nil;
}


// Delegate only. Invoked from -updateTouchBarItemIdentifiers before setting the item identifiers for textView's NSTouchBar.
- (NSArray<NSTouchBarItemIdentifier> *)textView:(NSTextView *)textView shouldUpdateTouchBarItemIdentifiers:(NSArray<NSTouchBarItemIdentifier> *)identifiers API_AVAILABLE(macos(10.12.2)) {
    return nil;
}

// Delegate only. Provides customized list of candidates to textView.candidateListTouchBarItem. Invoked from -updateCandidates. NSTextView uses the candidates returned from this method and suppress its built-in candidate generation. Returning nil from this delegate method allows NSTextView to query candidates from NSSpellChecker.
- (nullable NSArray *)textView:(NSTextView *)textView candidatesForSelectedRange:(NSRange)selectedRange API_AVAILABLE(macos(10.12.2)) {
    return nil;
}

// Delegate only. Allows customizing the candidate list queried from NSSpellChecker.
- (NSArray<NSTextCheckingResult *> *)textView:(NSTextView *)textView candidates:(NSArray<NSTextCheckingResult *> *)candidates forSelectedRange:(NSRange)selectedRange API_AVAILABLE(macos(10.12.2)) {
    return nil;
}

// Delegate only. Notifies the delegate that the user selected the candidate at index in -[NSCandidateListTouchBarItem candidates] for textView.candidateListTouchBarItem. When no candidate selected, index is NSNotFound. Returning YES allows textView to insert the candidate into the text storage if it's NSString, NSAttributedString, or NSTextCheckingResult.
- (BOOL)textView:(NSTextView *)textView shouldSelectCandidateAtIndex:(NSUInteger)index API_AVAILABLE(macos(10.12.2)) {
    return YES;
}


//// The following delegate-only methods are deprecated in favor of the more verbose ones above.
//- (BOOL)textView:(NSTextView *)textView clickedOnLink:(null_unspecified id)link API_DEPRECATED("Use -textView:clickedOnLink:atIndex: instead", macos(10.0,10.6));
//- (void)textView:(NSTextView *)textView clickedOnCell:(null_unspecified id <NSTextAttachmentCell>)cell inRect:(NSRect)cellFrame API_DEPRECATED("Use -textView:clickedOnCell:inRect:atIndex: instead", macos(10.0,10.6));
//- (void)textView:(NSTextView *)textView doubleClickedOnCell:(null_unspecified id <NSTextAttachmentCell>)cell inRect:(NSRect)cellFrame API_DEPRECATED("Use -textView:doubleClickedOnCell:inRect:atIndex: instead", macos(10.0,10.6));
//- (void)textView:(NSTextView *)view draggedCell:(null_unspecified id <NSTextAttachmentCell>)cell inRect:(NSRect)rect event:(null_unspecified NSEvent *)event API_DEPRECATED("Use -textView:draggedCell:inRect:event:atIndex: instead", macos(10.0,10.6));

@end
