//
//  BRButton.h
//  BRButtonDemo
//
//  Created by Yang on 16/3/1.
//  Copyright © 2016年 BokkkRottt. All rights reserved.
//

#import <Cocoa/Cocoa.h>

IB_DESIGNABLE
@interface BRButton : NSControl

@property (nonatomic, retain) IBInspectable NSColor * backgroundColor;
@property (nonatomic, copy) IBInspectable NSString * textString;
@property (nonatomic, retain) IBInspectable NSColor * textColor;
@property (nonatomic) IBInspectable CGFloat textAlignment;

@property (nonatomic) NSAttributedString * displayString;

@end
