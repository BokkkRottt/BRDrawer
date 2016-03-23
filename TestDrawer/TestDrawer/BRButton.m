//
//  BRButton.m
//  BRButtonDemo
//
//  Created by Yang on 16/3/1.
//  Copyright © 2016年 BokkkRottt. All rights reserved.
//

#import "BRButton.h"

#define BRTextAlignmentDefault 8

#define BRButtonAlphaValueActive 1.0
#define BRButtonAlphaValueInactive 0.8

@interface BRButton ()
{
    BOOL _mouseDown;
    BOOL _mouseIn;
}

@property (readonly) NSColor * effectBackgroundColor;
@property (retain) NSTrackingArea * trackingArea;
@end

@implementation BRButton
@dynamic displayString;

- (instancetype)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
    if (backgroundColor != _backgroundColor) {
        _backgroundColor = backgroundColor;
        self.needsDisplay = YES;
    }
}

- (NSAttributedString *)displayString
{
    NSMutableAttributedString * attibutedTitle = [[NSMutableAttributedString alloc] initWithString:self.textString attributes:@{NSForegroundColorAttributeName:self.textColor, NSFontAttributeName: [NSFont systemFontOfSize:NSHeight(self.bounds) - 2*self.textAlignment]}];
    return attibutedTitle;
}

- (void)setDisplayString:(NSAttributedString *)displayString
{
    NSDictionary * dicAttibutes = [displayString attributesAtIndex:0 effectiveRange:NULL];
    self.textString = displayString.string;
    for (NSString * key in dicAttibutes.allKeys) {
        if ([key isEqualToString:NSForegroundColorAttributeName]) {
            self.textColor = dicAttibutes[NSForegroundColorAttributeName];
        }
    }
}

- (NSColor *)effectBackgroundColor
{
    NSColor * color = [NSColor clearColor];
    if (_mouseDown && _mouseIn) {
        color = [self.backgroundColor blendedColorWithFraction:0.3 ofColor:[NSColor blackColor]];
    }
    else {
        color = self.backgroundColor;
    }
    
    return color;
}

- (void)setup
{
    self.alphaValue = BRButtonAlphaValueInactive;
    
    _mouseDown = NO;
    _mouseIn = NO;
    self.textAlignment = BRTextAlignmentDefault;
    self.backgroundColor = [NSColor redColor];
    self.textColor = [NSColor whiteColor];
    self.textString = @"";
    
    self.trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds options:NSTrackingActiveAlways | NSTrackingMouseEnteredAndExited owner:self userInfo:nil];
    [self addTrackingArea:self.trackingArea];
}

- (void)setButtonType:(NSButtonType)aType
{
    [self setButtonType:NSToggleButton];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSRect rectFill = NSInsetRect(self.bounds, 3, 3);
    NSBezierPath * bezier = [NSBezierPath bezierPathWithRoundedRect:rectFill xRadius:6 yRadius:6];
    [self.effectBackgroundColor setFill];
    [bezier fill];
    
    [self.displayString drawAtPoint:NSMakePoint((NSWidth(self.bounds) - self.displayString.size.width) / 2 + 1, (NSHeight(self.bounds) - self.displayString.size.height) / 2)];
}

- (void)mouseDown:(NSEvent *)theEvent
{
    _mouseDown = YES;
    self.needsDisplay = YES;
}

- (void)mouseUp:(NSEvent *)theEvent
{
    if (_mouseDown) {
        _mouseDown = NO;
        self.needsDisplay = YES;
        if (_mouseIn && self.target && self.action) {
            [self.target performSelector:self.action withObject:nil afterDelay:0.0];
        }
    }
}

- (void)mouseEntered:(NSEvent *)theEvent
{
    _mouseIn = YES;
    self.animator.alphaValue = BRButtonAlphaValueActive;
    
    self.needsDisplay = YES;
}

- (void)mouseExited:(NSEvent *)theEvent
{
    _mouseIn = NO;
    self.animator.alphaValue = BRButtonAlphaValueInactive;
    
    self.needsDisplay = YES;
}

- (void)updateTrackingAreas
{
    if (self.trackingArea) {
        [self removeTrackingArea:self.trackingArea];
        self.trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds options:NSTrackingActiveAlways | NSTrackingMouseEnteredAndExited | NSTrackingEnabledDuringMouseDrag owner:self userInfo:nil];
        [self addTrackingArea:self.trackingArea];
    }
}

@end
