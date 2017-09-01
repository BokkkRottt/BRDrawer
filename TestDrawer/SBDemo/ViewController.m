//
//  ViewController.m
//  SBDemo
//
//  Created by Yang on 01/09/2017.
//  Copyright © 2017 sgyang. All rights reserved.
//

#import "ViewController.h"
#import "BRDrawer.h"

@interface ViewController ()

@property (strong) IBOutlet BRDrawer *drawer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear
{
    self.view.window.titlebarAppearsTransparent = YES;
    self.view.window.movableByWindowBackground = YES;
    
    [self.view.window standardWindowButton:NSWindowMiniaturizeButton].hidden = YES;
    [self.view.window standardWindowButton:NSWindowZoomButton].hidden = YES;
    self.drawer.parentWindow = self.view.window;
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
