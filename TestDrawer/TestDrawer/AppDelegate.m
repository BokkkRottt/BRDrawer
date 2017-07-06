//
//  AppDelegate.m
//  TestDrawer
//
//  Created by Yang on 3/22/16.
//  Copyright © 2016 sgyang. All rights reserved.
//

#import "AppDelegate.h"
#import "ShapleColorView.h"
#import "BRDrawer.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (strong) IBOutlet BRDrawer *drawer;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.window.titlebarAppearsTransparent = YES;
    self.window.movableByWindowBackground = YES;
    
    //hide Widgets
//    [[self.window.contentView.superview.subviews[1] subviews].lastObject subviews][1].hidden = YES;
//    [[self.window.contentView.superview.subviews[1] subviews].lastObject subviews][2].hidden = YES;
    
    [self.window standardWindowButton:NSWindowMiniaturizeButton].hidden = YES;
    [self.window standardWindowButton:NSWindowZoomButton].hidden = YES;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
