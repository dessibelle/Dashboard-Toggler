//
//  TogglerAppDelegate.h
//  Toggler
//
//  Created by Simon Fransson on 2010-08-07.
//  Copyright 2010 Hobo Code. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TogglerAppDelegate : NSObject <NSApplicationDelegate> {

	NSWindow *window;
}

@property (retain) IBOutlet NSWindow *window;

- (void)fadeIn;
- (void)fadeOut;
- (void)fadeOut:(NSTimer *)timer;

@end
