//
//  CMSecondGradientView.m
//  CleanMac
//
//  Created by Aka on 2020/1/16.
//  Copyright © 2020 Aka. All rights reserved.
//

#import "CMSecondGradientView.h"

@implementation CMSecondGradientView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
//    [self drawLinerGradient];
//    [self drawRadialGradientView];
//    [self drawArcPath];
//    [self drawArcPath2];
    [self drawBezierPath];
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
}

@end
