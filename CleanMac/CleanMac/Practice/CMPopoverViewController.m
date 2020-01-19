//
//  CMPopoverViewController.m
//  CleanMac
//
//  Created by Aka on 2020/1/19.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMPopoverViewController.h"
#import "CMPopViewController.h"

@interface CMPopoverViewController ()<NSPopoverDelegate>

@property (nonatomic, strong) NSPopover *popover;

@end

@implementation CMPopoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor redColor].CGColor;
    
    NSButton *btn = [NSButton cm_buttonWithTitle:@"分类选择" target:self action:@selector(onCategoryAction:)];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view).offset(10.f);
        make.width.mas_equalTo(100.f);
        make.height.mas_equalTo(25.f);
    }];
    btn.layer.backgroundColor = [NSColor yellowColor].CGColor;
    
}


- (void)onCategoryAction:(NSButton *)sender {
    [self setUpPopover];
}

-(void)setUpPopover {
    self.popover = [NSPopover new];
//    self.popover.appearance = NSPopoverAppearanceHUD;
    self.popover.contentViewController = [CMPopViewController new];
    self.popover.contentViewController.view.frame = NSMakeRect(0.f, 0.f, 200.f, 200.f);
    self.popover.behavior = NSPopoverBehaviorTransient;
    self.popover.animates = YES;
    self.popover.delegate = self;
}


#pragma mark -- pop delegate

/*!
 * The popover invokes this method on its delegate whenever it is about to close to give the delegate a chance to veto the close.
 * If the delegate does not implement this method, \c -popoverShouldClose: will also be invoked on the popover to allow the popover to veto the close.
 * \return Return YES if the popover should close, NO otherwise.
 */
- (BOOL)popoverShouldClose:(NSPopover *)popover {
    NSLog(@"lt - popoverShouldClose");
    return YES;
}

/*!
 * Return \c YES to allow the popover to detach from its positioning view. Return \c NO if it should not. If this method is not implemented, the default behavior is \c NO.
 * If this method returns YES, and \c -detachableWindowForPopover: is not implemented or returns nil, a detachable window will be created with the popover’s \c contentViewController.
 * This implicit detached window will have the same appearance as the popover. If the \c contentViewController has a title, it will be bound to and displayed as the title of the detached window. Upon being released in a detached state, the popover will call \c -popoverDidDetach: on the delegate. Once the detached popover is closed, PopoverShould/Will/DidClose delegate calls and notifications will be sent with the reason \c NSPopoverCloseReasonStandard.
 * \param popover The popover that may be detached
 * \return YES if the popover should detach, whether to a custom window or the implicitly detached window. NO if not.
 */
//- (BOOL)popoverShouldDetach:(NSPopover *)popover API_AVAILABLE(macos(10.10)) {
//    NSLog(@"lt - popoverShouldDetach");
//    return YES;
//}

/*!
 * This is called when the popover has been released in an implicitly detached state, i.e. not when detached to a custom window returned from \c -detachableWindowForPopover:.
 * \param popover The popover that detached from its anchor view and is not closing.
 */
- (void)popoverDidDetach:(NSPopover *)popover API_AVAILABLE(macos(10.10)) {
    NSLog(@"lt - popoverDidDetach");

}

/*!
 * Return a custom window to which the popover should be detached. This should be used when the content of the detached window is wanted to be different from the content of the popover. If the same content should be used in the detached window, only \c -popoverShouldDetach: needs to be implemented.
 * If implementing this method, you should not remove the popover's content view as part of your implementation of this method. The popover and the detachable window may be shown at the same time and therefore cannot share a content view (or a content view controller).  If the popover and the detachable window should have the same content, you should define the content in a separate nib file and use a view controller to instantiate separate copies of the content for the popover and the detachable window.  The popover will animate to appear as though it morphs into the detachable window (unless the animates property is set to NO.  The exact animation used is not guaranteed).  Subclasses of NSPopover may also implement this method, in which case the subclass method will be invoked only if the delegate does not implement the method.
 * Not implementing this method, and just returning YES to \c -popoverShouldDetach: is recommended over providing a custom window.
 * If \c -popoverShouldDetach: is not overridden or returns NO, this method will not be called and the popover will not be detachable.
 * \param popover The popover that is being detached
 * \return The custom window to detach to.
 */
//- (nullable NSWindow *)detachableWindowForPopover:(NSPopover *)popover {
//    NSLog(@"lt - detachableWindowForPopover");
//
//}

/*!
 * Invoked on the delegate when the NSPopoverWillShowNotification notification is sent.  This method will also be invoked on the popover.
 */
- (void)popoverWillShow:(NSNotification *)notification {
    NSLog(@"lt - popoverWillShow");
}

/*!
 * Invoked on the delegate when the NSPopoverDidShowNotification notification is sent.  This method will also be invoked on the popover.
 */
- (void)popoverDidShow:(NSNotification *)notification {
    NSLog(@"lt - popoverDidShow");
}

/*!
 * Invoked on the delegate when the NSPopoverWillCloseNotification notification is sent.  This method will also be invoked on the popover.
 */
- (void)popoverWillClose:(NSNotification *)notification {
    NSLog(@"lt - popoverWillClose");
}

/*!
 * Invoked on the delegate when the NSPopoverDidCloseNotification notification is sent.  This method will also be invoked on the popover.
 */
- (void)popoverDidClose:(NSNotification *)notification {
    NSLog(@"lt - popoverDidClose");
}

@end
