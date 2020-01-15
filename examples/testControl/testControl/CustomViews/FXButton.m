//
//  FXButton.m
//  testControl
//
//  Created by Aka on 2019/10/1.
//  Copyright © 2019 Aka. All rights reserved.
//

#import "FXButton.h"

@implementation FXButton

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"lt- init with frame ");
    }
    return self;
}

- (void)scrollWheel:(NSEvent *)event  {
    NSLog(@"lt- button :%@, event ;%@",self, event);
}

@end
