//
//  TogglerAppDelegate.m
//  Toggler
//
//  Created by Simon Fransson on 2010-08-07.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import "TogglerAppDelegate.h"
#import "Toggler.h"
#import "TransparentWindow.h"

@implementation TogglerAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	
	BOOL result = [[Toggler toggler] toggleDashboard];
	
	[(TransparentWindow *)self.window setLevel:NSFloatingWindowLevel];
	[(TransparentWindow *)self.window makeKeyAndOrderFront:self];
	
	if (result)
		[self fadeIn];
	else {
		[self fadeOut];
	}
}

- (void)fadeIn {
	if ([self.window isKindOfClass:[TransparentWindow class]])
		[(TransparentWindow *)self.window fadeIn];
}

- (void)fadeOut {
	[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(fadeOut:) userInfo:nil repeats:NO];
}

- (void)fadeOut:(NSTimer *)timer {
	if ([self.window isKindOfClass:[TransparentWindow class]])
		[(TransparentWindow *)self.window fadeOut];
}

@end
