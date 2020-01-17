//
//  CMSecondGradientView.m
//  CleanMac
//
//  Created by Aka on 2020/1/16.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMSecondGradientView.h"
#import <Quartz/Quartz.h>

@interface CMSecondGradientView ()

@property (nonatomic, strong) CALayer *animationLayer;
@property (nonatomic, strong) NSView *myView;

@end

@implementation CMSecondGradientView

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self onImplicitAnimationAction];
        [self addMyView];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
//    [self drawLinerGradient];
//    [self drawRadialGradientView];
//    [self drawArcPath];
//    [self drawArcPath2];
//    [self drawBezierPath];
//    [self onImplicitAnimationAction];
//    [self onAnimationAciton];
}

// 1、直线渐变
- (void)drawLinerGradient {
    NSBezierPath *clicShape = [NSBezierPath new];
    [clicShape appendBezierPathWithRect:self.bounds];
//    NSArray *colorAndLocations = @[@{[NSColor redColor]:@(0)},@{[NSColor greenColor]:@(0.5)}, @{[NSColor blueColor]:@(1)}];
    NSGradient *aGradient = [[NSGradient alloc] initWithColorsAndLocations:[[NSColor redColor] colorWithAlphaComponent:0.5],0.f,[NSColor greenColor],0.5f,[NSColor blueColor], 1.f,nil];
    [aGradient drawInBezierPath:clicShape angle:90];
}

// 根据半径来进行渐变
- (void)drawRadialGradientView {
    NSRect bounds = self.bounds;
    NSGradient *aGradient = [[NSGradient alloc] initWithStartingColor:[NSColor blueColor] endingColor:[NSColor greenColor]];
    NSPoint centerPoint = NSMakePoint(NSMidX(bounds), NSMidY(bounds));
    NSPoint otherPoint = NSMakePoint(centerPoint.x +10.f, centerPoint.y +10.f);
    [aGradient drawFromCenter:centerPoint radius:50.f toCenter:otherPoint radius:2.f options:NSGradientDrawsBeforeStartingLocation];
}

// 绘制圆弧
- (void)drawArcPath {
    NSBezierPath *arcPath = [NSBezierPath new];
    [arcPath moveToPoint:NSMakePoint(30.f, 10.f)];
    [arcPath appendBezierPathWithArcFromPoint:NSMakePoint(10.f, 30.f) toPoint:NSMakePoint(60.f, 60.f) radius:20.f];
    arcPath.lineWidth = 2.f;
    [[NSColor redColor] setStroke];
    [arcPath stroke];
}
- (void)drawArcPath2 {
    NSBezierPath *arcPath = [NSBezierPath new];
    [arcPath appendBezierPathWithArcWithCenter:NSMakePoint(60.f, 60.f) radius:40.f startAngle:45.f endAngle:90.f];
    arcPath.lineWidth = 2.f;
    [[NSColor redColor] setStroke];
    [arcPath stroke];
}

//贝塞尔曲线
- (void)drawBezierPath {
    NSBezierPath *bezierPath = [NSBezierPath new];
    [bezierPath moveToPoint:NSMakePoint(20.f, 20.f)];
    [bezierPath curveToPoint:NSMakePoint(160.f, 60.f) controlPoint1:NSMakePoint(80.f, 50.f) controlPoint2:NSMakePoint(90.f, 5.f)];
    [bezierPath stroke];
    
    self.wantsLayer = YES;
}

- (CALayer *)makeBackingLayer {
    return [CATextLayer new];
}


- (void)onImplicitAnimationAction {
    NSButton *btn = [NSButton cm_buttonWithTitle:@"显示动画" target:self action:@selector(onAnimationMacAciton)];
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self).offset(100.f);
        make.width.height.mas_equalTo(100.f);
    }];
    btn.layer.backgroundColor = [NSColor greenColor].CGColor;
    
    [self addAniamationLayer];
}

- (void)addAniamationLayer {
    CALayer *animationLayer = CALayer.layer;
    animationLayer.frame = CGRectMake(10, 10.f, 50, 50);
    animationLayer.backgroundColor = [NSColor redColor].CGColor;
    
//    要求view使用层
    self.wantsLayer = YES;
    [self.layer addSublayer:animationLayer];
    self.animationLayer = animationLayer;
    
//    own layer backgournd color
    
    self.wantsLayer = YES;
//    self.layer = CALayer.layer;
    self.layer.backgroundColor = [NSColor cyanColor].CGColor;
}

// 这个例子证明layer-backed 的layer是没有隐式动画的；
- (void)onChangeOplha {
//    [self.animationLayer setOpacity:0.1f];
//    [self.layer setOpacity:0.1];
    
//    CABasicAnimation *ba = [CABasicAnimation new];
//    ba.fromValue = @10;
//    ba.toValue = @1;
//    [self.animationLayer addAnimation:ba forKey:@"property"];
//
}

- (void)addMyView {
    self.myView = [NSView new];
    self.myView.frame = NSMakeRect(50.f, 50.f, 50.f, 50.f);
    [self addSubview:self.myView];
    self.myView.wantsLayer = YES;
    self.myView.layer.backgroundColor = [NSColor magentaColor].CGColor;
}


//// ios 的方式
//- (void)onAnimationAciton {
//    CGPoint myNewPosition = CGPointMake(200.f, 150.f);
//    CABasicAnimation *theAnim = [CABasicAnimation animationWithKeyPath:@"postion"];
//    theAnim.fromValue = [NSValue valueWithPoint:self.myView.layer.position];
//    theAnim.toValue = [NSValue valueWithPoint:myNewPosition];
//    theAnim.duration = 3.f;
//    [self.myView.layer addAnimation:theAnim forKey:@"animateFrame"];
//}

- (void)onAnimationMacAciton {
    CAAnimation;
    
}

@end
