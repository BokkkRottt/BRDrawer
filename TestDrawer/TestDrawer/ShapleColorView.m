//
//  ShapleColorView.m
//  TestDrawer
//
//  Created by Yang on 3/22/16.
//  Copyright © 2016 sgyang. All rights reserved.
//

#import "ShapleColorView.h"

@interface ShapleColorView ()

@property (weak) IBOutlet NSButton *check1;
@property (weak) IBOutlet NSButton *check2;
@end

@implementation ShapleColorView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    if (self.fillColor) {
        [[NSColor clearColor] setFill];
        NSRectFill(dirtyRect);
        
        [self.fillColor setFill];
        NSBezierPath * shaple = [NSBezierPath bezierPathWithRoundedRect:self.bounds xRadius:8 yRadius:8];
        [shaple fill];
    }
}

- (void)awakeFromNib
{
    self.check1.attributedTitle = [[NSAttributedString alloc] initWithString:@"Remember" attributes:@{NSForegroundColorAttributeName: [NSColor whiteColor]}];
    self.check2.attributedTitle = [[NSAttributedString alloc] initWithString:@"Auto Login" attributes:@{NSForegroundColorAttributeName: [NSColor whiteColor]}];
}

@end
